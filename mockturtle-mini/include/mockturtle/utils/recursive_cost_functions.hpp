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

/*!
  \file recursive_cost_functions.hpp
  \brief Various recursive cost functions for (optimization) algorithms

  \author Hanyu Wang
*/

#pragma once

#include <cstdint>
#include <queue>
#include <boost/dynamic_bitset.hpp>
#include <boost/random.hpp>
#include <random>
#include <unordered_map>
#include <cmath>  

#include "../traits.hpp"

namespace mockturtle
{

/*! \brief (Recursive) customizable cost function
 *
 * To define a new cost function, you need to first specify how each node
 * contributes to the total cost via the *contribution function*. Each node
 * is evaluated individually and independently.
 *
 * If additional (global) information is required to decide a node's contribution,
 * you may specify them as *context*. The content stored in the context can be
 * arbitrarily defined (`context_t`), but the derivation must be recursive. In
 * other words, the context of a node is derived using *context propagation function*
 * which takes only the context of fanins as input.
 *
 * Examples of recursive cost functions can be found at:
 * `mockturtle/utils/recursive_cost_functions.hpp`
 */
template<class Ntk>
struct recursive_cost_functions
{
  using base_type = recursive_cost_functions;

  /*! \brief Context type
   *
   * The context type is used to store additional information for each node.
   * The content stored in the context can be arbitrarily defined (`context_t`),
   * but the derivation must be recursive. In other words, the context of a node
   * is derived using *context propagation function* which takes only the context
   * of fanins as input.
   * 
   * Optionally you may define a `context_compare` function to compare two contexts.
   * This is used to sort the nodes in the priority queue, and potentially to
   * prune the search space.
  */
  using context_t = uint32_t;

  /*! \brief Context propagation function
   *
   * Return the context of a node given fanin contexts. The fanin contexts are
   * sorted in the same order as the fanins of the node.
   */
  virtual context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& fanin_contexts = {} ) const = 0;

  /*! \brief Contribution function
   *
   * Update the total cost using node n and its context. The total cost is
   * updated only if the cost of the node is larger than the current total cost.
   * 
   * The context of a node is derived using *context propagation function* which
   * takes only the context of fanins as input.
   * 
   * The contribution function is called only if the node is not a primary input.
   */
  virtual void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& total_cost, context_t const context ) const = 0;
};

template<class Ntk>
using cotext_signal_pair = std::pair<typename Ntk::context_t, signal<Ntk>>;

template<class Ntk>
struct context_signal_compare
{
  bool operator()( cotext_signal_pair<Ntk> const& p1, cotext_signal_pair<Ntk> const& p2 ) const
  {
    return Ntk::costfn_t::context_compare( p1.first, p2.first );
  }
};

template<class Ntk>
using cotext_signal_queue = std::priority_queue<cotext_signal_pair<Ntk>, std::vector<cotext_signal_pair<Ntk>>, context_signal_compare<Ntk>>;

template<class Ntk>
struct xag_depth_cost_function : recursive_cost_functions<Ntk>
{
public:
  using context_t = uint32_t;
  static bool context_compare( const context_t& c1, const context_t& c2 )
  {
    return c1 > c2;
  }

  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& fanin_contexts = {} ) const
  {
    uint32_t _cost = ntk.is_pi( n ) ? 0 : *std::max_element( std::begin( fanin_contexts ), std::end( fanin_contexts ) ) + 1;
    return _cost;
  }
  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& total_cost, context_t const context ) const
  {
    total_cost = std::max( total_cost, context );
  }
};

template<class Ntk>
struct xag_skew_cost_function
{
public:
  using context_t = std::pair<uint32_t, uint32_t>; // <depth, skew>
  static bool context_compare( const context_t& c1, const context_t& c2 )
  {
    return c1 > c2;
  }

  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& fanin_contexts = {} ) const
  {
    uint32_t depth = ntk.is_pi( n ) ? 0 : std::max_element( std::begin( fanin_contexts ), std::end( fanin_contexts ) )->first + 1;

    uint32_t skew = std::max_element( std::begin( fanin_contexts ), std::end( fanin_contexts ) )->first - std::min_element( std::begin( fanin_contexts ), std::end( fanin_contexts ) )->first;
    return std::make_pair( depth, depth - ntk.is_and( n ) );
  }

  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& total_cost, context_t const context ) const
  {
    if ( ntk.is_pi( n ) || ntk.visited( n ) == ntk.trav_id() )
    {
      return;
    }
    else
    {
      total_cost += context.second;
    }
  }
};

template<class Ntk>
struct xag_max_skew_cost_function
{
public:
  using context_t = std::pair<uint32_t, uint32_t>; // <depth, skew>
  static bool context_compare( const context_t& c1, const context_t& c2 )
  {
    return c1 > c2;
  }

  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& fanin_contexts = {} ) const
  {
    uint32_t depth = ntk.is_pi( n ) ? 0 : std::max_element( std::begin( fanin_contexts ), std::end( fanin_contexts ) )->first + 1;

    uint32_t skew = std::max_element( std::begin( fanin_contexts ), std::end( fanin_contexts ) )->first - std::min_element( std::begin( fanin_contexts ), std::end( fanin_contexts ) )->first;
    return std::make_pair( depth, depth - ntk.is_and( n ) );
  }

  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& total_cost, context_t const context ) const
  {
    if ( ntk.is_pi( n ) || ntk.visited( n ) == ntk.trav_id() )
    {
      return;
    }
    else
    {
    total_cost = std::max( total_cost, context.second );
    }
  }
};

template<class Ntk>
struct xag_fanout_cost_function
{
public:
  using context_t = uint32_t;
  static bool context_compare( const context_t& c1, const context_t& c2 )
  {
    return c1 > c2;
  }

  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& fanin_contexts = {} ) const
  {
    return ntk.fanout_size( n );
  }

  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& total_cost, context_t const context ) const
  {
    if ( ntk.is_pi( n ) || ntk.visited( n ) == ntk.trav_id() )
    {
      total_cost += context;
    }
    else
    {
      total_cost += 1;
    }
  }
};

template<class Ntk>
struct xag_reconv_path_cost_function
{
public:
  using context_t = std::pair< std::set<node<Ntk>>, uint32_t >;
  static bool context_compare( const context_t& c1, const context_t& c2 )
  {
    return c1.first.size() > c2.first.size();
  }

  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& fanin_contexts = {} ) const
  {
    if ( ntk.is_pi( n ) )
    {
      return std::make_pair( std::set<node<Ntk>>{ n }, 0 );
    }
    else
    {
      uint32_t num_reconv_path = 0;
      std::set<node<Ntk>> _context;
      for ( auto const& fanin_context : fanin_contexts )
      {
        for ( auto const& fanin : fanin_context.first )
        {
          if ( _context.find( fanin ) != _context.end() )
          {
            num_reconv_path++;
          }
          else
          {
            _context.insert( fanin );
          }
        }
      }
      return std::make_pair( _context, num_reconv_path );
    }
  }

  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& total_cost, context_t const context ) const
  {
    if ( ntk.is_pi( n ) || ntk.visited( n ) == ntk.trav_id() )
    {
      return;
    }
    else
    {
      total_cost += context.second;
    }
  }
};


template<class Ntk, int SimulationLength>
struct xag_rare_signal_cost {
public:
  using ull = unsigned long;
  using context_t = std::pair< boost::dynamic_bitset<ull>, uint32_t >; // first: simulation vector, second: the cost contribution to the total cost
  double RARITY_THRESHOLD;
  int LOWER_THRESHOLD;
  int UPPER_THRESHOLD;

  xag_rare_signal_cost(double rarity_threshold = 0.1): 
    RARITY_THRESHOLD(rarity_threshold), LOWER_THRESHOLD((int)((double)(SimulationLength) * RARITY_THRESHOLD)), UPPER_THRESHOLD(SimulationLength - LOWER_THRESHOLD) {};

  void set_rarity_threshold(double rarity_threshold) {
    RARITY_THRESHOLD = rarity_threshold;
    LOWER_THRESHOLD = (int)((double)(SimulationLength) * RARITY_THRESHOLD);
    UPPER_THRESHOLD = SimulationLength - LOWER_THRESHOLD;
  }

  // priority in the balancing: if c2 has lower depth than c1 return true
  // Example: context_compare(c1, c2) {return c1.depth > c2.depth}
  // c1 is in the latter part of the queue, c2 is in the former part of the queue (c2 is pop first)
  static bool context_compare( const context_t& c1, const context_t& c2 ) {
    // return c1.first > c2.first;
    return c1.second > c2.second;
  }

  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& fanin_contexts = {} ) const {
    assert(!ntk.is_constant(n));
    static std::unordered_map<node<Ntk>, boost::dynamic_bitset<ull>> node2SimulationPattern;
    static boost::random::mt19937 eng((unsigned)(2023112000));
    static boost::random::uniform_int_distribution <ull> unifUll;
    static boost::variate_generator <boost::random::mt19937, boost::random::uniform_int_distribution <ull> > randUll(eng, unifUll);
    if ( ntk.is_pi( n ) ) {
      if (node2SimulationPattern.count(n) == 0) {
        const int unitLength = 64;
        assert((SimulationLength & (unitLength - 1)) == 0);
        int nUnit = SimulationLength / unitLength;
        for (int j = 0; j < nUnit; ++j) {
            ull numb = randUll();
            node2SimulationPattern[n].append(numb);
        }
        // std::cout << "initialize short simulation pattern for PI " << n << std::endl;
      }
      auto &bs = node2SimulationPattern[n];
      return std::make_pair( bs, 0 );
    }
    else {
      boost::dynamic_bitset<ull> bs;
      ntk.foreach_fanin( n, [&]( auto const& f, auto i ) {
        if (i == 0)
          bs = ntk.is_complemented(f)? ~fanin_contexts[i].first : fanin_contexts[i].first;
        else
          bs &= (ntk.is_complemented(f)? ~fanin_contexts[i].first : fanin_contexts[i].first);
      } ); // XOR function?
      auto count = bs.count();
      uint32_t is_rare_signal = (count <= LOWER_THRESHOLD || count >= UPPER_THRESHOLD);
      return std::make_pair( bs, is_rare_signal );
    }
  }

  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& total_cost, context_t const context ) const {
    if ( ntk.is_pi( n ) || ntk.visited( n ) == ntk.trav_id() )
      return;
    else
      total_cost += context.second;
  }
};

template<class Ntk, int SimulationLength>
struct xag_unhidden_rare_signal_cost {
public:
  using ull = unsigned long;
  using context_t = std::tuple< boost::dynamic_bitset<ull>, uint32_t, uint32_t >; // (simulationVector, isRareSignal, isUnhiddenRareSignal)
  double RARITY_THRESHOLD;
  int LOWER_THRESHOLD;
  int UPPER_THRESHOLD;

  xag_unhidden_rare_signal_cost(double rarity_threshold = 0.1): RARITY_THRESHOLD(rarity_threshold), LOWER_THRESHOLD((int)((double)(SimulationLength) * RARITY_THRESHOLD)), UPPER_THRESHOLD(SimulationLength - LOWER_THRESHOLD) {};

  void set_rarity_threshold(double rarity_threshold) {
    RARITY_THRESHOLD = rarity_threshold;
    LOWER_THRESHOLD = (int)((double)(SimulationLength) * RARITY_THRESHOLD);
    UPPER_THRESHOLD = SimulationLength - LOWER_THRESHOLD;
  }

  static bool context_compare( const context_t& c1, const context_t& c2 ) {
    return std::get<1>(c1) > std::get<1>(c2);
  }

  // context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& fanin_contexts = {} ) const {
  //   assert(!ntk.is_constant(n));
  //   static std::unordered_map<node<Ntk>, boost::dynamic_bitset<ull>> node2SimulationPattern;
  //   static boost::random::mt19937 eng((unsigned)(2023112000));
  //   static boost::random::uniform_int_distribution <ull> unifUll;
  //   static boost::variate_generator <boost::random::mt19937, boost::random::uniform_int_distribution <ull> > randUll(eng, unifUll);
  //   if ( ntk.is_pi( n ) ) {
  //     if (node2SimulationPattern.count(n) == 0) {
  //       const int unitLength = 64;
  //       assert((SimulationLength & (unitLength - 1)) == 0);
  //       int nUnit = SimulationLength / unitLength;
  //       for (int j = 0; j < nUnit; ++j) {
  //           ull numb = randUll();
  //           node2SimulationPattern[n].append(numb);
  //       }
  //     }
  //     return std::make_tuple( node2SimulationPattern[n], 0, 0 );
  //   }
  //   else {
  //     boost::dynamic_bitset<ull> bs;
  //     bool existOneRareFanin = false; // sum or OR?
  //     ntk.foreach_fanin( n, [&]( auto const& f, auto i ) {
  //       auto & faninContext = fanin_contexts[i];
  //       auto & faninBs = std::get<0>(faninContext);
  //       if (i == 0)
  //         bs = ntk.is_complemented(f)? ~faninBs : faninBs;
  //       else
  //         bs &= (ntk.is_complemented(f)? ~faninBs : faninBs);
  //         existOneRareFanin |= std::get<1>(faninContext);
  //     } );
  //     auto count = bs.count();
  //     uint32_t isRareSignal = (count <= LOWER_THRESHOLD || count >= UPPER_THRESHOLD);
  //     uint32_t isUnhiddenRareSignal = (isRareSignal && existOneRareFanin);
  //     return std::make_tuple( bs, isRareSignal, isUnhiddenRareSignal );
  //   }
  // }

  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& fanin_contexts = {} ) const {
    assert(!ntk.is_constant(n));
    static std::unordered_map<node<Ntk>, boost::dynamic_bitset<ull>> node2SimulationPattern;
    static boost::random::mt19937 eng((unsigned)(2023112000));
    static boost::random::uniform_int_distribution <ull> unifUll;
    static boost::variate_generator <boost::random::mt19937, boost::random::uniform_int_distribution <ull> > randUll(eng, unifUll);
    if ( ntk.is_pi( n ) ) {
      if (node2SimulationPattern.count(n) == 0) {
        const int unitLength = 64;
        assert((SimulationLength & (unitLength - 1)) == 0);
        int nUnit = SimulationLength / unitLength;
        for (int j = 0; j < nUnit; ++j) {
            ull numb = randUll();
            node2SimulationPattern[n].append(numb);
        }
      }
      return std::make_tuple( node2SimulationPattern[n], 0, 0 );
    }
    else {
      // simulation
      boost::dynamic_bitset<ull> bs;
      ntk.foreach_fanin( n, [&]( auto const& f, auto i ) {
        auto & faninContext = fanin_contexts[i];
        auto & faninBs = std::get<0>(faninContext);
        if (i == 0)
          bs = ntk.is_complemented(f)? ~faninBs : faninBs;
        else
          bs &= (ntk.is_complemented(f)? ~faninBs : faninBs);
      } );
      // update isRareSignal
      auto count = bs.count();
      uint32_t isRareSignal = (count <= LOWER_THRESHOLD || count >= UPPER_THRESHOLD);
      // update isUnhiddenRareSignal
      // reduce "unhidden" structure can definitely reduce inherant rare signals
      assert(ntk.fanin_size(n) == 2);
      uint32_t isUnhiddenRareSignal = isRareSignal? 
        // if node n and one of n's fanins are rare signals, then we detect a "unhidden" structure
        (std::get<1>(fanin_contexts[0]) || std::get<1>(fanin_contexts[1])):
        // if n is not a rare signal and has two rare fanins, then we detect a "unhidden" structure
        (std::get<1>(fanin_contexts[0]) && std::get<1>(fanin_contexts[1]));
      return std::make_tuple( bs, isRareSignal, isUnhiddenRareSignal );
    }
  }

  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& total_cost, context_t const context ) const {
    if ( ntk.is_pi( n ) || ntk.visited( n ) == ntk.trav_id() )
      return;
    else
      total_cost += std::get<2>(context);
  }
};


template<class Ntk>
struct xag_fanout_cost_eval_function
{
public:
  using context_t = uint32_t;
  static bool context_compare( const context_t& c1, const context_t& c2 )
  {
    return c1 > c2;
  }

  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& fanin_contexts = {} ) const
  {
    if ( ntk.is_pi( n ) )
    {
      return ntk.fanout_size( n );
    }

    return ntk.fanout_size( n ) + *std::max_element( std::begin( fanin_contexts ), std::end( fanin_contexts ) );
  }

  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& total_cost, context_t const context ) const
  {
    if ( ntk.is_pi( n ) || ntk.visited( n ) == ntk.trav_id() )
    {
      return;
    }
    else
    {
      total_cost = std::max( total_cost, context );
    }
  }
};

template<class Ntk>
struct xag_and_chain_cost_function
{
public:
  using context_t = uint32_t;
  static bool context_compare( const context_t& c1, const context_t& c2 )
  {
    return c1 > c2;
  }

  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& fanin_contexts = {} ) const
  {
    if ( ntk.is_pi( n ) )
    {
      return 0;
    }
    else
    {
      if ( ntk.is_and( n ) )
      {
        return *std::max_element( std::begin( fanin_contexts ), std::end( fanin_contexts ) ) + 1;
      }
      else
      {
        return 0;
      }
    }
  }

  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& total_cost, context_t const context ) const
  {    
    if ( ntk.is_pi( n ) || ntk.visited( n ) == ntk.trav_id() )
    {
      return;
    }
    total_cost = std::max( total_cost, context );
  }
};


template<class Ntk>
struct xag_t_depth_cost_function : recursive_cost_functions<Ntk>
{
public:
  using context_t = uint32_t;
  static bool context_compare( const context_t& c1, const context_t& c2 )
  {
    return c1 > c2;
  }

  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& fanin_contexts = {} ) const
  {
    uint32_t _cost = ntk.is_pi( n ) ? 0 : *std::max_element( std::begin( fanin_contexts ), std::end( fanin_contexts ) ) + ntk.is_and( n );
    return _cost;
  }

  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& total_cost, context_t const context ) const
  {
    total_cost = std::max( total_cost, context );
  }
};

template<class Ntk>
struct xag_size_cost_function : recursive_cost_functions<Ntk>
{
public:
  using context_t = uint32_t;
  static bool context_compare( const context_t& c1, const context_t& c2 )
  {
    return true;
  }

  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<uint32_t> const& fanin_contexts = {} ) const
  {
    return 0;
  }
  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& total_cost, context_t const context ) const
  {
    total_cost += ( !ntk.is_pi( n ) && ntk.visited( n ) != ntk.trav_id() ) ? 1 : 0;
  }
};

template<class Ntk>
struct xag_multiplicative_complexity_cost_function : recursive_cost_functions<Ntk>
{
public:
  using context_t = uint32_t;
  static bool context_compare( const context_t& c1, const context_t& c2 )
  {
    return true;
  }

  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<uint32_t> const& fanin_contexts = {} ) const
  {
    return 0;
  }
  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& total_cost, context_t const context ) const
  {
    total_cost += ( !ntk.is_pi( n ) && ntk.visited( n ) != ntk.trav_id() ) ? ntk.is_and( n ) : 0;
  }
};

template<class Ntk>
struct aig_fflc_cost_function : recursive_cost_functions<Ntk>
{
public:
  using context_t = uint32_t;
  static bool context_compare( const context_t& c1, const context_t& c2 )
  {
    return true;
  }

  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<uint32_t> const& fanin_contexts = {} ) const
  {
    return ntk.fanout_size( n ) > 1 ? 0 : 1;
  }
  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& total_cost, context_t const context ) const
  {
    if ( ntk.is_pi( n ) || ntk.visited( n ) == ntk.trav_id() )
    {
      total_cost += context;
    }
    else
    {
      total_cost += 1;
    }
  }
};

template<class Ntk>
struct aig_fflc_cost_function_eval : recursive_cost_functions<Ntk>
{
public:
  using context_t = uint32_t;
  static bool context_compare( const context_t& c1, const context_t& c2 )
  {
    return true;
  }

  context_t operator()( Ntk const& ntk, node<Ntk> const& n, std::vector<uint32_t> const& fanin_contexts = {} ) const
  {
    return 0;
  }
  void operator()( Ntk const& ntk, node<Ntk> const& n, uint32_t& total_cost, context_t const context ) const
  {
    if ( ntk.is_pi( n ) || ntk.visited( n ) == ntk.trav_id() )
    {
      return; 
    }
    else
    {
      total_cost += ntk.fanout_size( n ) > 1? 2 : 1;
    }
  }
};



// template<class Ntk>
// struct xag_rent_aware_size_cost_function : recursive_cost_functions<Ntk>
// {
// public:
//   using context_t = uint32_t;
//   double r = 0.5;       // Rent exponent
//   double t = 3.0;       // Average terminals per gate (AIG default: 3)
//   double slack = 0.1;   // Slack for Rent violation
//   double weight = 1.0;  // Penalty weight for Rent violation

//   xag_rent_aware_size_cost_function(double rent_r = 0.5, double rent_t = 3.0, double rent_slack = 0.1, double rent_weight = 1.0)
//     : r(rent_r), t(rent_t), slack(rent_slack), weight(rent_weight) {}

//   static bool context_compare(const context_t& c1, const context_t& c2) {
//     return c1 > c2;  
//   }

//   context_t operator()(Ntk const& ntk, node<Ntk> const& n, std::vector<context_t> const& fanin_contexts = {}) const override {
//     if (ntk.is_pi(n)) return 0;
//     uint32_t B = 1;  // Current node counts as one gate
//     for (const auto& fc : fanin_contexts) B += fc;  
//     return B;
//   }

//   void operator()(Ntk const& ntk, node<Ntk> const& n, uint32_t& total_cost, context_t const context) const override {
//     // Base size contribution: count non-PI, unvisited nodes
//     total_cost += (!ntk.is_pi(n) && ntk.visited(n) != ntk.trav_id()) ? 1 : 0;

//     // Rent penalty: calculate T (terminals) and apply penalty if diff_ratio > slack
//     if (context > 0) {  // Avoid division by zero
//       uint32_t T = ntk.fanin_size(n) + 1;  // T = fanins + 1 output
//       double T_exp = t * std::pow(static_cast<double>(context), r);
//       if (T_exp == 0.0) T_exp = 1.0;  // Prevent division by zero
//       double diff_ratio = std::abs(static_cast<double>(T) - T_exp) / T_exp;
//       // if (diff_ratio > slack) {
//       total_cost += static_cast<uint32_t>(weight * diff_ratio * context + 0.5);  // Penalty proportional to B
//       // }
//     }
//   }
// };

#include <memory>
#include <algorithm>
#include <fstream>

template<class Ntk>
struct xag_rent_aware_size_cost_function : recursive_cost_functions<Ntk>
{
public:
  using context_t = uint32_t;

  double r = 0.5;       // Rent exponent
  double t = 3.0;       // Average terminals per gate
  double slack = 0.10;  // Allowed relative deviation
  double weight = 1.0;  // Penalty weight
  bool   only_over_slack = true; // Penalize only deviations beyond slack
  bool   debug = true;           // Collect stats
  uint32_t top_k = 10;           // Print top-K worst nodes

  struct rec_t { uint32_t node_idx; uint32_t B; uint32_t T; double Texp; double diff; uint32_t penalty; };
  struct stats_t
  {
    uint64_t nodes_seen      = 0;
    uint64_t nodes_counted   = 0;
    uint64_t nodes_penalized = 0;
    uint64_t penalty_sum     = 0;
    double   diff_sum        = 0.0;
    std::vector<rec_t> worst;
  };

  std::shared_ptr<stats_t> stats = std::make_shared<stats_t>();

  xag_rent_aware_size_cost_function(double rent_r = 0.5, double rent_t = 3.0,
                                    double rent_slack = 0.1, double rent_weight = 1.0)
    : r(rent_r), t(rent_t), slack(rent_slack), weight(rent_weight) {}

  static bool context_compare(const context_t& c1, const context_t& c2) { return c1 > c2; }

  void reset_stats() const
  {
    stats->nodes_seen = stats->nodes_counted = stats->nodes_penalized = stats->penalty_sum = 0;
    stats->diff_sum = 0.0;
    stats->worst.clear();
  }

  template<typename NTK>
  void print_report(NTK const&, const char* tag = "Rent-aware report") const
  {
    fmt::print("[i] {}\n", tag);
    fmt::print("    seen={}, counted={}, penalized={}, penalty_sum={}\n",
               stats->nodes_seen, stats->nodes_counted, stats->nodes_penalized, stats->penalty_sum);
    if (stats->nodes_seen)
      fmt::print("    avg diff_ratio={:.4f}\n", stats->diff_sum / double(stats->nodes_seen));
    if (!stats->worst.empty()) {
      auto tmp = stats->worst;
      std::sort(tmp.begin(), tmp.end(), [](auto const& a, auto const& b){ return a.penalty > b.penalty; });
      auto k = std::min<uint32_t>(top_k, tmp.size());
      fmt::print("    top-{} penalty nodes:\n", k);
      for (uint32_t i = 0; i < k; ++i) {
        auto const& r = tmp[i];
        fmt::print("      node#{:6d}: B={}, T={}, Texp={:.2f}, diff={:.3f}, penalty={}\n",
                   r.node_idx, r.B, r.T, r.Texp, r.diff, r.penalty);
      }
    }
  }

  // Optional: dump CSV for post analysis
  void dump_csv(const std::string& path) const
  {
    std::ofstream f(path);
    f << "node_id,B,T,Texp,diff,penalty\n";
    for (auto const& r : stats->worst)
      f << r.node_idx << "," << r.B << "," << r.T << "," << r.Texp << "," << r.diff << "," << r.penalty << "\n";
  }

  context_t operator()(Ntk const& ntk, node<Ntk> const& n,
                       std::vector<context_t> const& fanin_contexts = {}) const override
  {
    if (ntk.is_pi(n)) return 0;
    uint32_t B = 1;
    for (auto fc : fanin_contexts) B += fc;
    return B;
  }

  void operator()(Ntk const& ntk, node<Ntk> const& n,
                  uint32_t& total_cost, context_t const B) const override
  {
    stats->nodes_seen++;

    if (!ntk.is_pi(n) && ntk.visited(n) != ntk.trav_id()) {
      stats->nodes_counted++;
      total_cost += 1;
    }

    if (B == 0) return;

    const uint32_t T = ntk.num_pis() + ntk.num_pos();
    double Texp = t * std::pow(static_cast<double>(B), r);
    if (Texp < 1e-12) Texp = 1.0;
    double diff_ratio = std::abs(static_cast<double>(T) - Texp) / Texp;
    stats->diff_sum += diff_ratio;

    double over = only_over_slack ? std::max(0.0, diff_ratio - slack) : diff_ratio;
    if (over > 0.0) {
      uint32_t pen = static_cast<uint32_t>(weight * over * B + 0.5);
      if (pen > 0) {
        stats->nodes_penalized++;
        stats->penalty_sum += pen;
        total_cost += pen;

        if (debug) {
          uint32_t idx = static_cast<uint32_t>(ntk.node_to_index(n)); // if supported
          stats->worst.push_back(rec_t{idx, B, T, Texp, diff_ratio, pen});
        }
      }
    }
  }
};


template<class Ntk>
struct free_cost_function : recursive_cost_functions<Ntk>
{
  using context_t = uint32_t;

  context_t operator()(Ntk const& ntk, node<Ntk> const& n,
                       std::vector<context_t> const& fanin_contexts = {}) const override
  {
    return ntk.is_pi(n) ? 0 : 1;
  }

  void operator()(Ntk const& ntk, node<Ntk> const& n,
                  uint32_t& total_cost, context_t const) const override
  {
    if (!ntk.is_pi(n) && ntk.visited(n) != ntk.trav_id())
      total_cost += 1;
  }

  
  static bool context_compare( const context_t& c1, const context_t& c2 )
  {
    return c1 > c2;
  }
};


template<class Ntk>
struct interconnect_cost_function : recursive_cost_functions<Ntk>
{
  using context_t = uint32_t;

  double w_node = 1.0; // weight for node count
  double w_edge = 1.0; // weight for edge count

  struct stats_t {
    uint64_t nodes_seen = 0;
    uint64_t edges_seen = 0;
    uint64_t total_cost = 0;
  };

  std::shared_ptr<stats_t> stats = std::make_shared<stats_t>();

  interconnect_cost_function(double wnode = 1.0, double wedge = 1.0)
      : w_node(wnode), w_edge(wedge) {}

  static bool context_compare(const context_t&, const context_t&) { return true; }

  context_t operator()(Ntk const&, node<Ntk> const&,
                       std::vector<context_t> const& = {}) const override
  {
    return 0; // no per-node context needed
  }

  void operator()(Ntk const& ntk, node<Ntk> const& n,
                  uint32_t& total_cost, context_t const) const override
  {
    // size term
    if (!ntk.is_pi(n) && ntk.visited(n) != ntk.trav_id()) {
      stats->nodes_seen++;
      total_cost += static_cast<uint32_t>(w_node);
    }

    // edge term: count fanins only (each edge once)
    uint32_t deg = ntk.fanin_size(n);
    if (deg > 0) {
      stats->edges_seen += deg;
      total_cost += static_cast<uint32_t>(w_edge * deg);
    }

    stats->total_cost = total_cost;
  }

  void print_report(const char* tag = "Interconnect cost report") const
  {
    fmt::print("[i] {}\n", tag);
    fmt::print("    nodes_seen = {}, edges_seen = {}, total_cost = {}\n",
               stats->nodes_seen, stats->edges_seen, stats->total_cost);
  }
};


} /* namespace mockturtle */
