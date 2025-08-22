
#include <filesystem>
#include <experiments.hpp>
#include <lorina/aiger.hpp>

#include <mockturtle/algorithms/balancing.hpp>
#include <mockturtle/algorithms/balancing/esop_balancing.hpp>
#include <mockturtle/algorithms/balancing/sop_balancing.hpp>
#include <mockturtle/algorithms/cleanup.hpp>
#include <mockturtle/algorithms/cut_rewriting.hpp>
#include <mockturtle/algorithms/experimental/cost_generic_resub.hpp>
#include <mockturtle/algorithms/functional_reduction.hpp>
 #include <mockturtle/algorithms/klut_to_graph.hpp>

#include <mockturtle/io/aiger_reader.hpp>
#include <mockturtle/io/blif_reader.hpp>
#include <mockturtle/io/verilog_reader.hpp>
#include <mockturtle/io/write_aiger.hpp>
#include <mockturtle/io/write_blif.hpp>

#include <mockturtle/utils/cost_functions.hpp>
#include <mockturtle/utils/recursive_cost_functions.hpp>
#include <mockturtle/utils/stopwatch.hpp>


using namespace mockturtle;
using namespace mockturtle::experimental;
using namespace std;
using namespace std::filesystem;



// 1) cost：size or depth

template<class Ntk> struct xag_size_cost_function : recursive_cost_functions<Ntk>
{
  using context_t = uint32_t;
  static bool context_compare( context_t const& a, context_t const& b ){ return a > b; }
  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& fi = {} ) const override {
    (void)fi;
    return ntk.is_pi( n ) ? 0u : 1u;
  }
  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& tot, context_t const ) const override {
    if ( !ntk.is_pi( n ) ) ++tot;
  }
};

template<class Ntk> struct xag_depth_cost_function : recursive_cost_functions<Ntk>
{
  using context_t = uint32_t;
  static bool context_compare( context_t const& a, context_t const& b ){ return a > b; }
  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& fi = {} ) const override {
    if ( ntk.is_pi( n ) ) return 0u;
    uint32_t d = 0u;
    for ( auto c : fi ) d = std::max( d, c );
    return d + 1u;
  }
  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& tot, context_t const ctx ) const override {
    (void)ntk;
    tot = std::max( tot, ctx );
  }
};


// 2) fanout cost
template<class Ntk> struct xag_fanout_cost_function : recursive_cost_functions<Ntk>
{
  using context_t = uint32_t;
  static bool context_compare( context_t const& a, context_t const& b ){ return a > b; }
  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& ) const override {
    return ntk.is_pi( n ) ? 0u : static_cast<uint32_t>( ntk.fanout_size( n ) );
  }
  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& tot, context_t const ) const override {
    if ( !ntk.is_pi( n ) ) tot += static_cast<uint32_t>( ntk.fanout_size( n ) );
  }
};


// 3) Rent-aware
template<class Ntk> struct xag_rent_aware_size_cost_function : recursive_cost_functions<Ntk>
{
  using context_t = uint32_t;

  double r = 0.5;       // Rent exponent
  double t = 3.0;       // avg terminals per gate
  double slack = 0.10;  // tolerated relative deviation
  double weight = 1.0;  // penalty weight

  xag_rent_aware_size_cost_function() = default;
  xag_rent_aware_size_cost_function( double rr, double tt, double ss, double ww )
    : r( rr ), t( tt ), slack( ss ), weight( ww ) {}

  static bool context_compare( context_t const& a, context_t const& b ){ return a > b; }

  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& fi = {} ) const override {
    if ( ntk.is_pi( n ) ) return 0u;
    uint32_t B = 1u; for ( auto c : fi ) B += c; /
    return B;
  }

  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& tot, context_t const B ) const override {
    if ( !ntk.is_pi( n ) ) ++tot; // size 
    if ( B == 0 ) return;
    const uint32_t T = static_cast<uint32_t>( ntk.fanin_size( n ) ) + 1u;
    double Texp = t * std::pow( static_cast<double>( B ), r );
    if ( Texp < 1e-9 ) Texp = 1.0;
    const double diff = std::max( 0.0, ( static_cast<double>( T ) - Texp ) / Texp );
    if ( diff > slack ) {
      tot += static_cast<uint32_t>( weight * diff * B + 0.5 );
    }
  }
};


enum class cost_mode_t { size, depth, fanout, rent };

template<class CostFn>
static void run_resub(aig_network& aig, CostFn const& cost, mockturtle::experimental::cost_generic_resub_params& ps, uint32_t passes)
{
  for (uint32_t p = 0; p < passes; ++p)
  {
    mockturtle::experimental::cost_generic_resub_stats st;
    mockturtle::experimental::cost_generic_resub(aig, cost, ps, &st);
    aig = cleanup_dangling(aig);
  }
}

static void run_resub_by_mode(aig_network& aig,
                              cost_mode_t mode,
                              mockturtle::experimental::cost_generic_resub_params& ps,
                              uint32_t passes,
                              double rent_r, double rent_t, double rent_slack, double rent_weight)
{
  switch (mode)
  {
    case cost_mode_t::size:
    {
      mockturtle::xag_size_cost_function<aig_network> cost{};
      run_resub(aig, cost, ps, passes);
    } break;

    case cost_mode_t::depth:
    {
      mockturtle::xag_depth_cost_function<aig_network> cost{};
      run_resub(aig, cost, ps, passes);
    } break;

    case cost_mode_t::fanout:
    {
      mockturtle::xag_fanout_cost_function<aig_network> cost{};
      run_resub(aig, cost, ps, passes);
    } break;

    case cost_mode_t::rent:
    {
      mockturtle::xag_rent_aware_size_cost_function<aig_network> cost{rent_r, rent_t, rent_slack, rent_weight};
      run_resub(aig, cost, ps, passes);
    } break;
  }
}

static void ensure_dir( std::string const& path )
{
  std::filesystem::path p( path );
  if ( !std::filesystem::exists( p ) ) std::filesystem::create_directories( p );
}

int main( int argc, char** argv )
{
  if ( argc < 2 )
  {
    fmt::print( "[e] usage: {} <input.aig> [--cost size|depth|fanout|rent] [--max_pis K] [--passes N] [--rent_r R] [--rent_t T] [--rent_slack S] [--rent_weight W]\n", argv[0] );
    return 0;
  }

  std::string input = argv[1];

  // defaults
  cost_mode_t mode = cost_mode_t::size;
  uint32_t max_pis = 10;
  uint32_t passes  = 1;
  double rent_r = 0.5, rent_t = 3.0, rent_slack = 0.10, rent_weight = 1.0;

  auto read_u32 = [&]( int& i ){ if ( i + 1 >= argc ) throw std::runtime_error( "missing value" ); return static_cast<uint32_t>( std::stoul( argv[++i] ) ); };
  auto read_f64 = [&]( int& i ){ if ( i + 1 >= argc ) throw std::runtime_error( "missing value" ); return std::stod( argv[++i] ); };

  for ( int i = 2; i < argc; ++i )
  {
    std::string opt = argv[i];
    if      ( opt == "--cost"      ) { std::string v = ( i+1 < argc ? argv[++i] : "" );
      if      ( v == "size"   ) mode = cost_mode_t::size;
      else if ( v == "depth"  ) mode = cost_mode_t::depth;
      else if ( v == "fanout" ) mode = cost_mode_t::fanout;
      else if ( v == "rent"   ) mode = cost_mode_t::rent;
      else fmt::print( "[w] unknown cost: {}\n", v );
    }
    else if ( opt == "--max_pis"   ) max_pis    = read_u32( i );
    else if ( opt == "--passes"    ) passes     = read_u32( i );
    else if ( opt == "--rent_r"    ) rent_r     = read_f64( i );
    else if ( opt == "--rent_t"    ) rent_t     = read_f64( i );
    else if ( opt == "--rent_slack") rent_slack = read_f64( i );
    else if ( opt == "--rent_weight")rent_weight= read_f64( i );
    else fmt::print( "[w] unknown option ignored: {}\n", opt );
  }

  fmt::print( "[i] input: {}\n", input );
  fmt::print( "[i] cost : {}\n", ( mode==cost_mode_t::size?"size":mode==cost_mode_t::depth?"depth":mode==cost_mode_t::fanout?"fanout":"rent" ) );
  if ( mode == cost_mode_t::rent )
    fmt::print( "[i] rent params: r={:.2f}, t={:.2f}, slack={:.2f}, weight={:.2f}\n", rent_r, rent_t, rent_slack, rent_weight );
  fmt::print( "[i] max_pis={}, passes={}\n", max_pis, passes );

  // read AIG
  aig_network aig;
  if ( lorina::read_aiger( input, aiger_reader( aig ) ) != lorina::return_code::success )
  {
    fmt::print( "[e] failed to read: {}\n", input );
    return 1;
  }

  // prepare cost + params
  fanout_view fntk( aig );

  cost_generic_resub_params ps;
  ps.verbose = false;
  ps.wps.max_pis = max_pis;

  stopwatch<>::duration rt{0};
  call_with_stopwatch(rt, [&](){
  run_resub_by_mode(aig, mode, ps, passes, rent_r, rent_t, rent_slack, rent_weight);
  });
  fmt::print("[i] runtime: {:.2f} s\n", to_seconds(rt));

  auto size_after  = aig.num_gates();
  depth_view dv(aig);
  auto depth_after = dv.depth();
  fmt::print("[i] result: size={}, depth={}\n", size_after, depth_after);
  ensure_dir( "./tmp" );
  std::string out = "./tmp/compare_costs_out.blif";
  write_blif( aig, out );
  fmt::print( "[i] wrote {}\n", out );

  return 0;
}
