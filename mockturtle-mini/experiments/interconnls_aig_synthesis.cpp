/* mockturtle: C++ logic network library
 * Copyright (C) 2018-2022  EPFL
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */


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
 using namespace experiments;
 using namespace std;
 
 
 template<typename Ntk>
 Ntk abc_opto( Ntk const& ntk, std::string str_code, std::string abc_script = "compress2rs" ) {
     write_blif( ntk, str_code + ".blif" );
     std::string command = "abc -q \"read_blif ./" + str_code + ".blif; strash; " + abc_script + "; write_aiger ./" + str_code + ".aig\"";
 
     std::array<char, 128> buffer;
     std::string result;
     std::unique_ptr<FILE, decltype( &pclose )> pipe( popen( command.c_str(), "r" ), pclose );
     if ( !pipe )
         throw std::runtime_error( "popen() failed" );
     while ( fgets( buffer.data(), buffer.size(), pipe.get() ) != nullptr )
         result += buffer.data();
 
     Ntk res;
     std::string string_path = ( "./" + str_code + ".aig" );
     if ( lorina::read_aiger( string_path, aiger_reader( res ) ) != lorina::return_code::success )
         std::cerr << "read_blif failed" << std::endl;
 
     return res;
 }
 
 
 class TechnologyIndependentOptimizer {
 public:
     xag_size_cost_function<aig_network> costSize; 
     xag_depth_cost_function<aig_network> costDepth; 
     xag_rent_aware_size_cost_function<aig_network> rentCost;
     string baseName;
     string tempFileBaseName;
     mockturtle::experimental::cost_generic_resub_params ps; 
     mockturtle::experimental::cost_generic_resub_stats st;

     bool   enforce_rent = true;
     double rent_r = 0.5;
     double rent_t = 3.0;
     double rent_slack = 0.10;
     double rent_weight = 1.0;
 
 
     explicit TechnologyIndependentOptimizer() {}
 
     void set_rent_params(bool enforce, double r, double t, double slack, double weight) {
        enforce_rent = enforce;
        rent_r = r; rent_t = t; rent_slack = slack; rent_weight = weight;
    }


     void UpdateBestAig(aig_network& aig, aig_network& bestAig, std::vector<uint32_t>& bestCosts) {
         assert(bestCosts.size() == 2);
         auto size = cost_view( aig, costSize ).get_cost();
         auto depth = cost_view( aig, costDepth ).get_cost();
         if ( size < bestCosts[0] || 
             (size == bestCosts[0] && depth < bestCosts[1]) ) {
                 bestCosts = std::vector<uint32_t>({size, depth});
                 bestAig = aig;
         }
     }
 
     void CallAbcOptimization(aig_network& aig, aig_network& bestAig, std::vector<uint32_t>& bestCosts, const std::string & abcScript) {
         aig = abc_opto( aig, tempFileBaseName, abcScript );
         UpdateBestAig(aig, bestAig, bestCosts);
     }
 
     void Resub(aig_network& aig, aig_network& bestAig, std::vector<uint32_t>& bestCosts, int windowSize) {
         ps.wps.max_pis = windowSize;
         // rent params

         ps.wps.enforce_rent = enforce_rent;
         ps.wps.rent_r = rent_r;
         ps.wps.rent_t = rent_t;
         ps.wps.rent_slack = rent_slack;
         ps.wps.rent_weight = rent_weight;
         
         rentCost = xag_rent_aware_size_cost_function<aig_network>(
             rent_r, rent_t, rent_slack, rent_weight
         );
         
         rentCost = xag_rent_aware_size_cost_function<aig_network>(ps.wps.rent_r, ps.wps.rent_t, ps.wps.rent_slack, ps.wps.rent_weight);
         cost_generic_resub(aig, rentCost, ps, &st);
         aig = cleanup_dangling( aig );
         UpdateBestAig(aig, bestAig, bestCosts);
         fmt::print("[i] Using Rent-aware cost: r={:.2f}, t={:.2f}, slack={:.2f}, weight={:.2f}\n", 
            rentCost.r, rentCost.t, rentCost.slack, rentCost.weight);
     }
 
     void PrintCosts(aig_network& aig, const string & prefix) {
         auto size = cost_view( aig, costSize ).get_cost();
         auto depth = cost_view( aig, costDepth ).get_cost();
         fmt::print( "[i] {} Size, Depth:\t{}\t{}\n", prefix, size, depth );
     }
 
     void PreProcess(aig_network& aig) {
         stopwatch<>::duration time_tot{ 0 };
         call_with_stopwatch( time_tot, [&]() {
             aig = abc_opto( aig, tempFileBaseName, "compress2rs; compress2rs;" );
             PrintCosts(aig, "Pre-processed");
             std::string output_filename = fmt::format( "{}_{}.blif", baseName, "compress2rs" );
             write_blif( aig, output_filename );
         } );
         fmt::print( "[i] Pre-processing runtime: {:5.2f} seconds\n", to_seconds( time_tot ) );
     }
 
     void BaselineMethod(const aig_network& aig) {
         stopwatch<>::duration time_tot{ 0 };
         call_with_stopwatch( time_tot, [&]() {
             auto baselineAig = aig;
             baselineAig = abc_opto( baselineAig, tempFileBaseName, "compress2rs; compress2rs;" );
             PrintCosts(baselineAig, "Baseline");
             std::string output_filename = fmt::format( "{}_{}.blif", baseName, "compress2rs" );
             write_blif( baselineAig, output_filename );
         } );
         fmt::print( "[i] Baseline runtime: {:5.2f} seconds\n", to_seconds( time_tot ) );
     }
 
     void OptimizeAIG(aig_network& aig) {
         auto bestCosts = std::vector<uint32_t>({cost_view( aig, costSize ).get_cost(), cost_view( aig, costDepth ).get_cost()});
         auto bestAig = aig;
         stopwatch<>::duration time_tot{ 0 };
         call_with_stopwatch( time_tot, [&]() {
 
             CallAbcOptimization(aig, bestAig, bestCosts, "b -l");
             Resub(aig, bestAig, bestCosts, 6);
             CallAbcOptimization(aig, bestAig, bestCosts, "rw -l");
             Resub(aig, bestAig, bestCosts, 6);
             CallAbcOptimization(aig, bestAig, bestCosts, "rf -l");
             Resub(aig, bestAig, bestCosts, 8);
             CallAbcOptimization(aig, bestAig, bestCosts, "b -l");
             Resub(aig, bestAig, bestCosts, 8);
             CallAbcOptimization(aig, bestAig, bestCosts, "rw -l");
             Resub(aig, bestAig, bestCosts, 10);
             CallAbcOptimization(aig, bestAig, bestCosts, "rwz -l");
             Resub(aig, bestAig, bestCosts, 10);
             CallAbcOptimization(aig, bestAig, bestCosts, "b -l");
             Resub(aig, bestAig, bestCosts, 12);
             CallAbcOptimization(aig, bestAig, bestCosts, "rfz -l");
             Resub(aig, bestAig, bestCosts, 12);
             CallAbcOptimization(aig, bestAig, bestCosts, "rwz -l");
             Resub(aig, bestAig, bestCosts, 14);
             CallAbcOptimization(aig, bestAig, bestCosts, "b -l");
 
             aig = bestAig;
             PrintCosts(aig, "Optimized AIG: ");
             std::string output_filename = fmt::format( "{}_{}.blif", baseName, "optimized_aig" );
             fmt::print( "[i] writing to {}\n", output_filename );
             write_blif( aig, output_filename );
         } );
         fmt::print( "[i] AIG optimization runtime: {:5.2f} seconds\n", to_seconds( time_tot ) );
     }
 };
 
 
 void CreatePath(const std::string & _path) {
     std::filesystem::path path(_path);
     if (!std::filesystem::exists(_path))
         std::filesystem::create_directories(_path);
 }
 
 
 int main(int argc, char ** argv) {
     /* parse arguments */
     if (argc < 2) {
        fmt::print("[e] usage: {} <input.aig> [--rent_r R] [--rent_t T] [--rent_slack S] [--rent_weight W] [--enforce_rent 0|1]\n", argv[0]);
        return 0;
      }
     std::string benchmark = argv[1];
     fmt::print( "[i] processing {}\n", benchmark );

    //  set rent params
     bool   enforce_rent = true;
     double rent_r = 0.5, rent_t = 3.0, rent_slack = 0.10, rent_weight = 1.0;
     auto read_double = [&](int& i)->double {
         if (i+1 >= argc) { throw std::runtime_error("missing value for option"); }
         return std::stod(argv[++i]);
     };
     auto read_bool01 = [&](int& i)->bool {
         if (i+1 >= argc) { throw std::runtime_error("missing value for option"); }
         int v = std::stoi(argv[++i]);
         if (v!=0 && v!=1) throw std::runtime_error("enforce_rent must be 0 or 1");
         return v==1;
     };
     for (int i = 2; i < argc; ++i) {
         std::string opt = argv[i];
         if (opt == "--rent_r")        { rent_r = read_double(i); }
         else if (opt == "--rent_t")   { rent_t = read_double(i); }
         else if (opt == "--rent_slack"){ rent_slack = read_double(i); }
         else if (opt == "--rent_weight"){ rent_weight = read_double(i); }
         else if (opt == "--enforce_rent"){ enforce_rent = read_bool01(i); }
         else {
             fmt::print("[w] unknown option ignored: {}\n", opt);
         }
     }

     /* create directories */
     CreatePath("./tmp/");
 
     /* deal with output name */
     TechnologyIndependentOptimizer optimizer;
     optimizer.set_rent_params(enforce_rent, rent_r, rent_t, rent_slack, rent_weight);
     std::string circuitName = benchmark.substr( benchmark.find_last_of( '/' ) + 1, benchmark.find_last_of( '.' ) - benchmark.find_last_of( '/' ) - 1 );
     optimizer.baseName = "./tmp/" + circuitName;
     if (optimizer.baseName.find("_init") != std::string::npos)
         optimizer.baseName = optimizer.baseName.substr(0, optimizer.baseName.find("_init"));
     optimizer.tempFileBaseName = optimizer.baseName + "_tmp";
     fmt::print( "[i] output base name: {}\n", optimizer.baseName );
 
     /* read benchmark */
     aig_network aig;
     auto const result = lorina::read_aiger( benchmark, aiger_reader( aig ) );
     if ( result != lorina::return_code::success ) {
         std::cerr << "[e] could not read aiger file" << std::endl;
         return 1;
     }
     assert( result == lorina::return_code::success );
 
     /* set parameters for resub */
     optimizer.ps.verbose = false;
     optimizer.ps.rps.use_esop = false;
     optimizer.ps.rps.max_solutions = 0; /* = 1: collect one, = 0: collect all */
 
     /* AIG cost before optimization */
     optimizer.PrintCosts(aig, "Original AIG (converted from pre-processed gate netlist)");
 
     stopwatch<>::duration time_tot{ 0 };
     call_with_stopwatch( time_tot, [&]() {
     optimizer.OptimizeAIG(aig);
     optimizer.OptimizeAIG(aig);
     optimizer.OptimizeAIG(aig);
     } );
     fmt::print( "[i] AIG synthesis runtime: {:5.2f} seconds\n", to_seconds( time_tot ) );
 
     return 0;
 }