#include "raremap.h"


using namespace std;
using namespace abc;
using namespace boost;


void RareMapOpt::Print() {
    cout << "***** options" << endl;
    cout << "source seed = " << sourceSeed << endl;
    cout << "#simulation patterns = " << nFrame << endl;
    cout << "output path: " << outpPath << endl;
}


RareMapMan::RareMapMan(RareMapOpt & opt): 
    sourceSeed(opt.sourceSeed), 
    nFrame(opt.nFrame), 
    iterationRound(0), 
    rareSignalThreshold(opt.rareSignalThreshold),
    switchingActivityThreshold(2.0 * opt.rareSignalThreshold * (1.0 - opt.rareSignalThreshold)),
    oriNet(NetMan(opt.pNtk, true)),
    outpPath(opt.outpPath)
{
    seed = NewSeed();
    if (oriNet.GetNetType() == NET_TYPE::GATE) {
        oriNet.ReArrInTopoOrd();
        maxDelay = oriNet.GetDelay();
    }
    else   
        maxDelay = numeric_limits <double>::max();
    randGen.seed(sourceSeed);
}


void RareMapMan::Run() {
    // initialize
    auto currNet = oriNet;
    currNet.CleanUpPro();
    auto amapResultNet = currNet;
    auto htResistantMapNet = currNet;

    vector<double> signalProbabilities;
    CollectSignalProbabilities(currNet, signalProbabilities, true);
    CollectInherentRareSignals(currNet, true);
    // currNet.WriteBlif(outpPath + "/sop.blif");
    // currNet.WriteDot(outpPath + "/sop.dot", &signalProbabilities, rareSignalThreshold);

    // // amap
    // cout << "**************************************** applying amap" << endl;
    // amapResultNet.Comm("st; ps; amap; topo; stime;");
    // int nRareSignals = CollectSignalProbabilities(amapResultNet, signalProbabilities, true);
    // cout << "area, delay, #rare =\t" << amapResultNet.GetArea() << "\t" << amapResultNet.GetDelay() << "\t\t" << nRareSignals << endl;
    // // amapResultNet.WriteBlif(outpPath + "amap_sop.blif");
    // // amapResultNet.WriteNet(outpPath + "amap_gate.v");
    // amapResultNet.Comm("ps -p");
    // // amapResultNet.WriteDot(outpPath + "/amap.dot", &signalProbabilities, rareSignalThreshold);
    // // cout << "****************************************" << endl;

    // security-aware area-oriented technology mapping
    cout << "**************************************** applying rarity-reducing area-oriented technology mapping" << endl;
    Security_Amap(htResistantMapNet);
    AbcMan abc;
    abc.Comm("topo; stime");
    htResistantMapNet = NetMan(abc.GetNet(), true);
    int nRareSignals = CollectSignalProbabilities(htResistantMapNet, signalProbabilities, true);
    cout << "area, delay, #rare =\t" << htResistantMapNet.GetArea() << "\t" << htResistantMapNet.GetDelay() << "\t\t" << nRareSignals << endl;
    htResistantMapNet.WriteBlif(outpPath + "hideamap_sop.blif");
    htResistantMapNet.WriteNet(outpPath + "hideamap_gate.blif");
    htResistantMapNet.WriteNet(outpPath + "hideamap_gate.v");
    htResistantMapNet.Comm("ps -p");
    // htResistantMapNet.WriteDot(outpPath + "/hide_amap.dot", &signalProbabilities, rareSignalThreshold);
    // cout << "****************************************" << endl;
}


int RareMapMan::CollectSignalProbabilities(NetMan& net, std::vector<double> & signalProbabilities, bool enablePrint) {
    // if (enablePrint)
        // cout << "===============================================" << endl;
    Simulator sim(net, seed, nFrame);
    sim.InpUnifFast();
    sim.Sim();
    signalProbabilities.clear();
    signalProbabilities.resize(net.GetIdMaxPlus1());
    ll sum = 0;
    for (int i = 0; i < net.GetIdMaxPlus1(); ++i) {
        if (!net.IsObj(i))
            continue;
        signalProbabilities[i] = sim.GetSignalProb(i);
        // if (i == 96)
        //     cout << "signal " << net.GetName(i) << " has probability " << signalProbabilities[i] << endl;
        if (signalProbabilities[i] < rareSignalThreshold || signalProbabilities[i] > 1 - rareSignalThreshold) {
            if (!net.IsConst(i) && !net.IsObjPo(i)) {
                if (net.GetNetType() == NET_TYPE::SOP && net.IsInv(i))
                    continue;
                // if (enablePrint)
                //     cout << net.GetName(i) << "(" << sim.GetSignalProb(i) << "), ";
                ++sum;
            }
        }
    }
    if (enablePrint) {
        // cout << endl;
        cout << "#signals = " << net.GetObjNum() << ", #rare signals = " << sum << ", percentage = " << double(sum) / net.GetObjNum() << endl;
        // cout << "===============================================" << endl << endl;
    }
    return sum;
}


static int ExploreNeighbours(Simulator& sim, ll sourceNodeId, double rareSignalDeviation) { // performance: unhidden signals are in pairs
    const int maxDepth = 2;
    queue<ll> q;
    q.push(sourceNodeId);
    unordered_set<ll> visitedNodes;
    unordered_map<ll, int> depth;
    unordered_map<ll, pair<int, int>> movement; // +1: fanout; -1: fanin; 0: unassigned
    visitedNodes.emplace(sourceNodeId);
    depth[sourceNodeId] = 0;
    int IsUnhiddenRareSignal = 0;
    // cout << "explore neighbours of " << sim.GetObj(sourceNodeId) << endl;
    // breadth-first search
    while (!q.empty()) {
        ll nodeId = q.front();
        q.pop();
        // cout << "visit " << sim.GetObj(nodeId) << " with depth " << depth[nodeId] << endl;
        if (nodeId != sourceNodeId && IsRareSignal(sim, nodeId, rareSignalDeviation)) {
            if (depth[nodeId] == 1) {
                IsUnhiddenRareSignal = 1;
                // cout << sim.GetObj(sourceNodeId) << " is unhidden due to " << sim.GetObj(nodeId) << endl;
            }
            else if (depth[nodeId] == 2) {
                assert(movement.count(nodeId));
                assert(movement[nodeId].first && movement[nodeId].second);
                if (movement[nodeId] == pair<int,int>(1, -1)) {
                    IsUnhiddenRareSignal = 1;
                    // cout << "distance 2: " << sim.GetObj(sourceNodeId) << " is unhidden due to " << sim.GetObj(nodeId) << endl;
                }
            }
            else {
                cout << sourceNodeId << " " << nodeId << " depth[nodeId] = " << depth[nodeId] << endl;
                assert(0);
            }
        }
        if (IsUnhiddenRareSignal)
            break;
        // explore fanouts
        for (int i = 0; i < sim.GetFanoutNum(nodeId); ++i) {
            auto fanoutId = sim.GetFanoutId(nodeId, i);
            if (visitedNodes.count(fanoutId) == 0) {
                visitedNodes.emplace(fanoutId);
                depth[fanoutId] = depth[nodeId] + 1;
                // cout << "fanout " << sim.GetObj(fanoutId) << " with depth " << depth[fanoutId] << " from " << sim.GetObj(nodeId) << " with depth " << depth[nodeId] << endl;
                if (depth[fanoutId] == 1)
                    movement[fanoutId] = pair<int,int>(1, 0);
                else if (depth[fanoutId] == 2)
                    movement[fanoutId] = pair<int,int>(movement[nodeId].first, 1);
                if (depth[fanoutId] <= maxDepth)
                    q.push(fanoutId);
            }
        }
        // explore fanins
        for (int i = 0; i < sim.GetFaninNum(nodeId); ++i) {
            auto faninId = sim.GetFaninId(nodeId, i);
            if (visitedNodes.count(faninId) == 0) {
                visitedNodes.emplace(faninId);
                depth[faninId] = depth[nodeId] + 1;
                // cout << "fanin " << sim.GetObj(faninId) << " with depth " << depth[faninId] << " from " << sim.GetObj(nodeId) << " with depth " << depth[nodeId] << endl;
                if (depth[faninId] == 1)
                    movement[faninId] = pair<int,int>(-1, 0);
                else if (depth[faninId] == 2)
                    movement[faninId] = pair<int,int>(movement[nodeId].first, -1);
                if (depth[faninId] <= maxDepth)
                    q.push(faninId);
            }
        }
    }
    return IsUnhiddenRareSignal;
}
int RareMapMan::CollectUnhiddenRareSignals(NetMan& net, std::vector<ll> & unhiddenRareSignals, bool enablePrint) {
    assert(net.GetNetType() == NET_TYPE::SOP);
    auto rareSignalDeviation = abs(rareSignalThreshold - 0.5);

    if (enablePrint)
        cout << "===============================================" << endl;
    Simulator sim(net, seed, nFrame);
    sim.InpUnifFast();
    sim.Sim();

    unhiddenRareSignals.clear();
    for (int i = 0; i < net.GetIdMaxPlus1(); ++i) {
        if (!net.IsNode(i) || net.IsConst(i))
            continue;
        if (IsRareSignal(sim, i, rareSignalDeviation)) {
            // explore neighbours
            int IsUnhiddenRareSignal = ExploreNeighbours(sim, i, rareSignalDeviation);
            if (IsUnhiddenRareSignal)
                unhiddenRareSignals.emplace_back(i);
            // else
            //     cout << net.GetObj(i) << " (" << sim.GetSignalProb(i) << ") can be hidden" << endl;
        }
    }
    if (enablePrint) {
        // cout << endl;
        cout << "#signals = " << net.GetObjNum() << ", #unhidden rare signals = " << unhiddenRareSignals.size() << ", percentage = " << double(unhiddenRareSignals.size()) / net.GetObjNum() << endl;
        cout << "===============================================" << endl << endl;
    }
    return (int)(unhiddenRareSignals.size());
}


int RareMapMan::CollectInherentRareSignals(NetMan& net, bool enablePrint) {
    assert(net.GetNetType() == NET_TYPE::SOP);
    auto rareSignalDeviation = abs(rareSignalThreshold - 0.5);

    if (enablePrint)
        cout << "===============================================" << endl;
    Simulator sim(net, seed, nFrame);
    sim.InpUnifFast();
    sim.Sim();

    dynamic_bitset<ull> isInherentRare(net.GetIdMaxPlus1());
    isInherentRare.reset();

    for (int i = 0; i < net.GetIdMaxPlus1(); ++i) {
        if (!net.IsNode(i) || net.IsConst(i))
            continue;
        if (IsRareSignal(sim, i, rareSignalDeviation)) {
            // if any fanin is a rare signal, then the current node and the rare fanin are inherent rare signals
            for (int j = 0; j < net.GetFaninNum(i); ++j) {
                auto faninId = net.GetFaninId(i, j);
                if (IsRareSignal(sim, faninId, rareSignalDeviation)) {
                    isInherentRare[faninId] = true;
                    isInherentRare[i] = true;
                }
            }
        }
        else {
            if (net.GetFaninNum(i) == 2) {
                // if both fanins are rare signal, then both rare fanins are inherent rare signals
                auto faninId0 = net.GetFaninId(i, 0);
                auto faninid1 = net.GetFaninId(i, 1);
                if (IsRareSignal(sim, faninId0, rareSignalDeviation) && IsRareSignal(sim, faninid1, rareSignalDeviation)) {
                    isInherentRare[faninId0] = true;
                    isInherentRare[faninid1] = true;
                }
            }
        }
    }

    if (enablePrint) {
        cout << "#signals = " << net.GetObjNum() << ", #inherent rare signals = " << isInherentRare.count() << endl;
        // cout << "===============================================" << endl << endl;
    }
    return (int)(isInherentRare.count());
}


void RareMapMan::DetectRareSignals(NetMan & net, vector<ll> & rareSignals, double rareThreshold) {
    cout << "===============================================" << endl;
    Simulator sim(net, seed, nFrame);
    sim.InpUnifFast();
    sim.Sim();
    ll sum = 0;
    rareSignals.clear();
    for (int i = 0; i < net.GetIdMaxPlus1(); ++i) {
        if (!net.IsObj(i))
            continue;
        if (sim.GetSignalProb(i) < rareThreshold || sim.GetSignalProb(i) > 1 - rareThreshold) {
            cout << net.GetName(i) << "\t" << sim.GetSignalProb(i) << endl;
            ++sum;
            rareSignals.emplace_back(i);
        }
    }
    cout << "#signals = " << net.GetObjNum() << endl;
    cout << "#rare signals = " << sum << endl;
    cout << "percentage = " << double(sum) / net.GetObjNum() << endl;
    cout << "===============================================" << endl << endl;
}


void RareMapMan::AnalyzeRareSignal(NetMan& net, const std::string & signalName) {
    cout << "===============================================" << endl;
    Simulator sim(net, seed, nFrame);
    sim.InpUnifFast();
    sim.Sim();

    auto pObj = net.GetObjByName(signalName, false);
    cout << "signal " << signalName << " has probability " << sim.GetSignalProb(pObj->Id) << endl;

    cout << "fanins:" << endl;
    auto pFanins = net.GetFanins(pObj);
    for (auto pFanin: pFanins)
        cout << net.GetName(pFanin) << "\t" << sim.GetSignalProb(pFanin->Id) << endl;

    cout << "fanouts:" << endl;
    auto pFanouts = net.GetFanouts(pObj);
    for (auto pFanout: pFanouts)
        cout << net.GetName(pFanout) << "\t" << sim.GetSignalProb(pFanout->Id) << endl;
    cout << "===============================================" << endl << endl;
}


unsigned RareMapMan::NewSeed() {
    boost::uniform_int <> unDistr(numeric_limits <int>::min(), numeric_limits <int>::max());
    unsigned _seed = static_cast <unsigned> (unDistr(randGen));
    // cout << "new seed = " << _seed << endl;
    return _seed;
}


int RareMapMan::SecurityAwareTechnologyMapping(NetMan & net, int fAreaOnly) {
    Abc_Ntk_t * pNtk = net.GetNet();
    Abc_Ntk_t * pNtkRes = nullptr;
    double DelayTarget;
    double AreaMulti;
    double DelayMulti;
    float LogFan = 0;
    float Slew = 0; // choose based on the library
    float Gain = 250;
    int nGatesMin = 0;
    int fRecovery;
    int fSweep;
    int fSwitching;
    int fSkipFanout;
    int fUseProfile;
    int fUseBuffs;
    int fVerbose;

    // set defaults
    DelayTarget =-1;
    AreaMulti   = 0;
    DelayMulti  = 0;
    fRecovery   = 1;
    fSweep      = 0;
    fSwitching  = 0;
    fSkipFanout = 0;
    fUseProfile = 0;
    fUseBuffs   = 0;
    fVerbose    = 1;

    if ( pNtk == NULL )
    {
        Abc_Print( -1, "Empty network.\n" );
        return 1;
    }

    if ( fAreaOnly )
        DelayTarget = ABC_INFINITY;

    if ( !Abc_NtkIsStrash(pNtk) )
    {
        pNtk = Abc_NtkStrash( pNtk, 0, 0, 0 );
        if ( pNtk == NULL )
        {
            Abc_Print( -1, "Strashing before mapping has failed.\n" );
            return 1;
        }
        // pNtk = Abc_NtkBalance( pNtkRes = pNtk, 0, 0, 1 );
        // Abc_NtkDelete( pNtkRes );
        // if ( pNtk == NULL )
        // {
        //     Abc_Print( -1, "Balancing before mapping has failed.\n" );
        //     return 1;
        // }
        // Abc_Print( 0, "The network was strashed and balanced before mapping.\n" );
        Abc_Print( 0, "The network was strashed before mapping.\n" );
        // get the new network
        pNtkRes = Security_NtkMap( pNtk, DelayTarget, AreaMulti, DelayMulti, LogFan, Slew, Gain, nGatesMin, fRecovery, fSwitching, fSkipFanout, fUseProfile, fUseBuffs, fVerbose );
        if ( pNtkRes == NULL )
        {
            Abc_NtkDelete( pNtk );
            Abc_Print( -1, "Mapping has failed.\n" );
            return 1;
        }
        Abc_NtkDelete( pNtk );
    }
    else
       assert(0);

    if ( fSweep )
       assert(0);

    // replace the current network
    auto pAbc = Abc_FrameGetGlobalFrame();
    Abc_FrameReplaceCurrentNetwork( pAbc, pNtkRes );
    
    return 0;
}


extern "C" Abc_Ntk_t * Abc_NtkFromMap( Map_Man_t * pMan, Abc_Ntk_t * pNtk, int fUseBuffs );
extern "C" Vec_Int_t * Sim_NtkComputeSwitching( Abc_Ntk_t * pNtk, int nPatterns );
Abc_Ntk_t * RareMapMan::Security_NtkMap( Abc_Ntk_t * pNtk, double DelayTarget, double AreaMulti, double DelayMulti, float LogFan, float Slew, float Gain, int nGatesMin, int fRecovery, int fSwitching, int fSkipFanout, int fUseProfile, int fUseBuffs, int fVerbose ) {
    static int fUseMulti = 0;
    int fShowSwitching = 1;
    Abc_Ntk_t * pNtkNew;
    Map_Man_t * pMan;
    Vec_Int_t * vSwitching = NULL;
    float * pSwitching = NULL;
    abctime clk, clkTotal = Abc_Clock();
    Mio_Library_t * pLib = (Mio_Library_t *)Abc_FrameReadLibGen();

    assert( Abc_NtkIsStrash(pNtk) );
    // derive library from SCL
    // if the library is created here, it will be deleted when pSuperLib is deleted in Map_SuperLibFree()
    if ( Abc_FrameReadLibScl() && Abc_SclHasDelayInfo( Abc_FrameReadLibScl() ) )
    {
        if ( pLib && Mio_LibraryHasProfile(pLib) )
            assert(0);
        else
            pLib = Abc_SclDeriveGenlib( Abc_FrameReadLibScl(), NULL, Slew, Gain, nGatesMin, fVerbose );
        if ( Abc_FrameReadLibGen() )
        {
            Mio_LibraryTransferDelays( (Mio_Library_t *)Abc_FrameReadLibGen(), pLib );
            Mio_LibraryTransferProfile( pLib, (Mio_Library_t *)Abc_FrameReadLibGen() );
        }
        // remove supergate library
        Map_SuperLibFree( (Map_SuperLib_t *)Abc_FrameReadLibSuper() );
        Abc_FrameSetLibSuper( NULL );
    }
    // quit if there is no library
    if ( pLib == NULL )
    {
        printf( "The current library is not available.\n" );
        return 0;
    }
    if ( AreaMulti != 0.0 )
        assert(0);
    if ( DelayMulti != 0.0 )
        assert(0);

    // derive the supergate library
    if ( fUseMulti || Abc_FrameReadLibSuper() == NULL )
    {
        if ( fVerbose )
            printf( "Converting \"%s\" into supergate library \"%s\".\n", 
                Mio_LibraryReadName(pLib), Extra_FileNameGenericAppend(Mio_LibraryReadName(pLib), ".super") );
        // compute supergate library to be used for mapping
        if ( Mio_LibraryHasProfile(pLib) )
            assert(0);
        Map_SuperLibDeriveFromGenlib( pLib, fVerbose );
    }

    // print a warning about choice nodes
    if ( fVerbose && Abc_NtkGetChoiceNum( pNtk ) )
        assert(0);
    
    // write dot file
    Io_WriteDot( pNtk, "./tmp/strash.dot" );

    // compute switching activity
    fShowSwitching |= fSwitching;
    // if ( fShowSwitching )
    {
        // vSwitching = Sim_NtkComputeSwitching( pNtk, 4096 );
        vSwitching = Sim_NtkComputeSwitching( pNtk, nFrame );
        pSwitching = (float *)vSwitching->pArray;
        // traverse each signal in pNtk, and print its switching activity
        // Abc_Obj_t * pNode;
        // int i;
        // cout << "switchingActivityThreshold = " << switchingActivityThreshold << endl;
        // Abc_NtkForEachNode(pNtk, pNode, i) {
        //     if (pSwitching[pNode->Id] < switchingActivityThreshold)
        //         cout << pNode->Id << " " << pSwitching[pNode->Id] << endl;
        // }
    }

    // perform the mapping
    pMan = Security_NtkToMap( pNtk, DelayTarget, fRecovery, pSwitching, fVerbose );
    if ( pSwitching ) Vec_IntFree( vSwitching );
    if ( pMan == NULL )
        return NULL;
clk = Abc_Clock();
    Map_ManSetSwitching( pMan, fSwitching );
    Map_ManSetSkipFanout( pMan, fSkipFanout );
    if ( fUseProfile )
        assert(0);
    if ( LogFan != 0 )
        assert(0);
    if ( !Security_Mapping( pMan ) )
    {
        Map_ManFree( pMan );
        return NULL;
    }

    // reconstruct the network after mapping (use buffers when user requested or in the area mode)
    pNtkNew = Abc_NtkFromMap( pMan, pNtk, fUseBuffs || (DelayTarget == (double)ABC_INFINITY) );
    if ( Mio_LibraryHasProfile(pLib) )
        Mio_LibraryTransferProfile2( (Mio_Library_t *)Abc_FrameReadLibGen(), pLib );
    Map_ManFree( pMan );
    if ( pNtkNew == NULL )
        return NULL;

    if ( pNtk->pExdc )
        pNtkNew->pExdc = Abc_NtkDup( pNtk->pExdc );
if ( fVerbose )
{
ABC_PRT( "Total runtime", Abc_Clock() - clkTotal );
}

    // make sure that everything is okay
    if ( !Abc_NtkCheck( pNtkNew ) )
    {
        printf( "Abc_NtkMap: The network check has failed.\n" );
        Abc_NtkDelete( pNtkNew );
        return NULL;
    }
    return pNtkNew;
}


extern "C" Map_Time_t * Abc_NtkMapCopyCiArrivalCon( Abc_Ntk_t * pNtk );
extern "C" Map_Time_t * Abc_NtkMapCopyCiArrival( Abc_Ntk_t * pNtk, Abc_Time_t * ppTimes );
extern "C" Map_Time_t * Abc_NtkMapCopyCoRequiredCon( Abc_Ntk_t * pNtk );
extern "C" Abc_Time_t * Abc_NtkGetCoRequiredTimes( Abc_Ntk_t * pNtk );
extern "C" Map_Time_t * Abc_NtkMapCopyCoRequired( Abc_Ntk_t * pNtk, Abc_Time_t * ppTimes );
Map_Man_t * RareMapMan::Security_NtkToMap( Abc_Ntk_t * pNtk, double DelayTarget, int fRecovery, float * pSwitching, int fVerbose )
{
    Map_Man_t * pMan;
    Map_Node_t * pNodeMap;
    Vec_Ptr_t * vNodes;
    Abc_Obj_t * pNode;
    int i;

    assert( Abc_NtkIsStrash(pNtk) );

    // start the mapping manager and set its parameters
    pMan = Map_ManCreate( Abc_NtkPiNum(pNtk) + Abc_NtkLatchNum(pNtk) - pNtk->nBarBufs, Abc_NtkPoNum(pNtk) + Abc_NtkLatchNum(pNtk) - pNtk->nBarBufs, fVerbose );
    if ( pMan == NULL )
        return NULL;
    Map_ManSetAreaRecovery( pMan, fRecovery );
    Map_ManSetOutputNames( pMan, Abc_NtkCollectCioNames(pNtk, 1) );
    Map_ManSetDelayTarget( pMan, (float)DelayTarget );

    // set arrival and requireds
    if ( Scl_ConIsRunning() && Scl_ConHasInArrs() )
        Map_ManSetInputArrivals( pMan, Abc_NtkMapCopyCiArrivalCon(pNtk) );
    else
        Map_ManSetInputArrivals( pMan, Abc_NtkMapCopyCiArrival(pNtk, Abc_NtkGetCiArrivalTimes(pNtk)) );
    if ( Scl_ConIsRunning() && Scl_ConHasOutReqs() )
        Map_ManSetOutputRequireds( pMan, Abc_NtkMapCopyCoRequiredCon(pNtk) );
    else
        Map_ManSetOutputRequireds( pMan, Abc_NtkMapCopyCoRequired(pNtk, Abc_NtkGetCoRequiredTimes(pNtk)) );

    // create PIs and remember them in the old nodes
    Abc_NtkCleanCopy( pNtk );
    Abc_AigConst1(pNtk)->pCopy = (Abc_Obj_t *)Map_ManReadConst1(pMan);
    Abc_NtkForEachCi( pNtk, pNode, i )
    {
        if ( i == Abc_NtkCiNum(pNtk) - pNtk->nBarBufs )
            break;
        pNodeMap = Map_ManReadInputs(pMan)[i];
        pNode->pCopy = (Abc_Obj_t *)pNodeMap;
        // if ( pSwitching )
            Map_NodeSetSwitching( pNodeMap, pSwitching[pNode->Id] );
    }

    // load the AIG into the mapper
    vNodes = Abc_AigDfsMap( pNtk );
    Vec_PtrForEachEntry( Abc_Obj_t *, vNodes, pNode, i )
    {
        if ( Abc_ObjIsLatch(pNode) )
            assert(0);
        assert( Abc_ObjIsNode(pNode) );
        // add the node to the mapper
        pNodeMap = Map_NodeAnd( pMan, 
            Map_NotCond( Abc_ObjFanin0(pNode)->pCopy, (int)Abc_ObjFaninC0(pNode) ),
            Map_NotCond( Abc_ObjFanin1(pNode)->pCopy, (int)Abc_ObjFaninC1(pNode) ) );
        assert( pNode->pCopy == NULL );
        // remember the node
        pNode->pCopy = (Abc_Obj_t *)pNodeMap;
        // if ( pSwitching )
            Map_NodeSetSwitching( pNodeMap, pSwitching[pNode->Id] );
        // set up the choice node
        if ( Abc_AigNodeIsChoice( pNode ) )
            assert(0);
    }
    assert( Map_ManReadBufNum(pMan) == pNtk->nBarBufs );
    Vec_PtrFree( vNodes );

    // set the primary outputs in the required phase
    Abc_NtkForEachCo( pNtk, pNode, i )
    {
        if ( i == Abc_NtkCoNum(pNtk) - pNtk->nBarBufs )
            break;
        Map_ManReadOutputs(pMan)[i] = Map_NotCond( (Map_Node_t *)Abc_ObjFanin0(pNode)->pCopy, (int)Abc_ObjFaninC0(pNode) );
    }
    return pMan;
}


int RareMapMan::Security_Mapping( Map_Man_t * p )
{
    int fShowSwitching         = 0;
    int fUseAreaFlow           = 1;
    int fUseExactArea          = !p->fSwitching;
    int fUseExactAreaWithPhase = !p->fSwitching;
    abctime clk;

    //////////////////////////////////////////////////////////////////////
    // perform pre-mapping computations
    if ( p->fVerbose )
        Map_MappingReportChoices( p ); 
    Map_MappingSetChoiceLevels( p ); // should always be called before mapping!

    // compute the cuts of nodes in the DFS order
    clk = Abc_Clock();
    Map_MappingCuts( p );
    p->timeCuts = Abc_Clock() - clk;
    // derive the truth tables 
    clk = Abc_Clock();
    Map_MappingTruths( p );
    p->timeTruth = Abc_Clock() - clk;
    //////////////////////////////////////////////////////////////////////
//ABC_PRT( "Truths", Abc_Clock() - clk );

    //////////////////////////////////////////////////////////////////////
    // compute the minimum-delay mapping
    cout << "compute the minimum-delay mapping" << endl;
    clk = Abc_Clock();
    p->fMappingMode = 0;
    if ( !Security_MappingMatches( p ) )
        return 0;
    p->timeMatch = Abc_Clock() - clk;
    // compute the references and collect the nodes used in the mapping
    Map_MappingSetRefs( p );
    p->AreaBase = Map_MappingGetArea( p );
    if ( p->fVerbose )
    {
    printf( "Delay    : %s = %8.2f  Flow = %11.1f  Area = %11.1f  %4.1f %%   ", 
                        fShowSwitching? "Switch" : "Delay", 
                        fShowSwitching? Map_MappingGetSwitching(p) : p->fRequiredGlo, 
                        Map_MappingGetAreaFlow(p), p->AreaBase, 0.0 );
    ABC_PRT( "Time", p->timeMatch );
    }
    //////////////////////////////////////////////////////////////////////

    if ( !p->fAreaRecovery )
        assert(0);

    //////////////////////////////////////////////////////////////////////
    // perform area recovery using area flow
    clk = Abc_Clock();
    if ( fUseAreaFlow )
    {
        cout << "area recovery using area flow" << endl;
        // compute the required times
        Map_TimeComputeRequiredGlobal( p );
        // recover area flow
        p->fMappingMode = 1;
        Security_MappingMatches( p );
        // compute the references and collect the nodes used in the mapping
        Map_MappingSetRefs( p );
        p->AreaFinal = Map_MappingGetArea( p );
        if ( p->fVerbose )
        {
        printf( "AreaFlow : %s = %8.2f  Flow = %11.1f  Area = %11.1f  %4.1f %%   ", 
                            fShowSwitching? "Switch" : "Delay", 
                            fShowSwitching? Map_MappingGetSwitching(p) : p->fRequiredGlo, 
                            Map_MappingGetAreaFlow(p), p->AreaFinal, 
                            100.0*(p->AreaBase-p->AreaFinal)/p->AreaBase );
        ABC_PRT( "Time", Abc_Clock() - clk );
        }
    }
    p->timeArea += Abc_Clock() - clk;
    //////////////////////////////////////////////////////////////////////

    //////////////////////////////////////////////////////////////////////
    // perform area recovery using exact area
    clk = Abc_Clock();
    if ( fUseExactArea )
    {
        cout << "use exact area" << endl;
        // compute the required times
        Map_TimeComputeRequiredGlobal( p );
        // recover area
        p->fMappingMode = 2;
        Security_MappingMatches( p );
        // compute the references and collect the nodes used in the mapping
        Map_MappingSetRefs( p );
        p->AreaFinal = Map_MappingGetArea( p );
        if ( p->fVerbose )
        {
        printf( "Area     : %s = %8.2f  Flow = %11.1f  Area = %11.1f  %4.1f %%   ", 
                            fShowSwitching? "Switch" : "Delay", 
                            fShowSwitching? Map_MappingGetSwitching(p) : p->fRequiredGlo, 
                            0.0, p->AreaFinal, 
                            100.0*(p->AreaBase-p->AreaFinal)/p->AreaBase );
        ABC_PRT( "Time", Abc_Clock() - clk );
        }
    }
    p->timeArea += Abc_Clock() - clk;
    //////////////////////////////////////////////////////////////////////

    //////////////////////////////////////////////////////////////////////
    // perform area recovery using exact area
    clk = Abc_Clock();
    if ( fUseExactAreaWithPhase ) {
        cout << "fUseExactAreaWithPhase" << endl;
        // compute the required times
        Map_TimeComputeRequiredGlobal( p );
        // recover area
        p->fMappingMode = 3;
        Security_MappingMatches( p );
        // compute the references and collect the nodes used in the mapping
        Map_MappingSetRefs( p );
        p->AreaFinal = Map_MappingGetArea( p );
        if ( p->fVerbose )
        {
        printf( "Area     : %s = %8.2f  Flow = %11.1f  Area = %11.1f  %4.1f %%   ", 
                            fShowSwitching? "Switch" : "Delay", 
                            fShowSwitching? Map_MappingGetSwitching(p) : p->fRequiredGlo, 
                            0.0, p->AreaFinal, 
                            100.0*(p->AreaBase-p->AreaFinal)/p->AreaBase );
        ABC_PRT( "Time", Abc_Clock() - clk );
        }
    }
    p->timeArea += Abc_Clock() - clk;
    //////////////////////////////////////////////////////////////////////

    //////////////////////////////////////////////////////////////////////
    // perform switching recovery
    clk = Abc_Clock();
    if ( p->fSwitching )
        assert(0);
    p->timeArea += Abc_Clock() - clk;
    //////////////////////////////////////////////////////////////////////

    // print the arrival times of the latest outputs
    if ( p->fVerbose )
        Map_MappingPrintOutputArrivals( p );
    return 1;
}


extern "C" void Map_MappingSetPiArrivalTimes( Map_Man_t * p );
extern "C" void Map_NodeTryDroppingOnePhase( Map_Man_t * p, Map_Node_t * pNode );
extern "C" void Map_NodeTransferArrivalTimes( Map_Man_t * p, Map_Node_t * pNode );
int RareMapMan::Security_MappingMatches( Map_Man_t * p ) {
    ProgressBar * pProgress;
    Map_Node_t * pNode;
    int i;

    // assert( p->fMappingMode >= 0 && p->fMappingMode <= 4 );
    assert( p->fMappingMode >= 0 && p->fMappingMode <= 3 );

    // use the externally given PI arrival times
    if ( p->fMappingMode == 0 )
        Map_MappingSetPiArrivalTimes( p );

    // estimate the fanouts
    if ( p->fMappingMode == 0 )
        Map_MappingEstimateRefsInit( p );
    else if ( p->fMappingMode == 1 )
        Map_MappingEstimateRefs( p );

    // the PI cuts are matched in the cut computation package
    // in the loop below we match the internal nodes
    pProgress = Extra_ProgressBarStart( stdout, p->vMapObjs->nSize );
    for ( i = 0; i < p->vMapObjs->nSize; i++ )
    {
        pNode = p->vMapObjs->pArray[i];
        if ( Map_NodeIsBuf(pNode) )
        {
            assert( pNode->p2 == NULL );
            pNode->tArrival[0] = Map_Regular(pNode->p1)->tArrival[ Map_IsComplement(pNode->p1)];
            pNode->tArrival[1] = Map_Regular(pNode->p1)->tArrival[!Map_IsComplement(pNode->p1)];
            continue;
        }

        // skip primary inputs and secondary nodes if mapping with choices
        if ( !Map_NodeIsAnd( pNode ) || pNode->pRepr )
            continue;

        // cout << "mapping node " << pNode->Num << " with switching activity " << pNode->Switching << endl;

        // make sure that at least one non-trival cut is present
        if ( pNode->pCuts->pNext == NULL )
        {
            Extra_ProgressBarStop( pProgress );
            printf( "\nError: A node in the mapping graph does not have feasible cuts.\n" );
            return 0;
        }

        // match negative phase
        if ( !Security_MatchNodePhase( p, pNode, 0 ) )
        {
            Extra_ProgressBarStop( pProgress );
            return 0;
        }
        // match positive phase
        if ( !Security_MatchNodePhase( p, pNode, 1 ) )
        {
            Extra_ProgressBarStop( pProgress );
            return 0;
        }

        // make sure that at least one phase is mapped
        if ( pNode->pCutBest[0] == NULL && pNode->pCutBest[1] == NULL )
        {
            printf( "\nError: Could not match both phases of AIG node %d.\n", pNode->Num );
            printf( "Please make sure that the supergate library has equivalents of AND2 or NAND2.\n" );
            printf( "If such supergates exist in the library, report a bug.\n" );
            Extra_ProgressBarStop( pProgress );
            return 0;
        }

        // if both phases are assigned, check if one of them can be dropped
        Map_NodeTryDroppingOnePhase( p, pNode );
        // set the arrival times of the node using the best cuts
        Map_NodeTransferArrivalTimes( p, pNode );

        // update the progress bar
        Extra_ProgressBarUpdate( pProgress, i, "Matches ..." );
    }
    Extra_ProgressBarStop( pProgress );
    return 1;
}


extern "C" void Map_MatchClean( Map_Match_t * pMatch );
extern "C" int Map_MatchCompare( Map_Man_t * pMan, Map_Match_t * pM1, Map_Match_t * pM2, int fDoingArea );
int RareMapMan::Security_MatchNodePhase( Map_Man_t * p, Map_Node_t * pNode, int fPhase ) {
    Map_Match_t MatchBest, * pMatch;
    Map_Cut_t * pCut, * pCutBest;
    float Area1 = 0.0; // Suppress "might be used uninitialized
    float Area2, fWorstLimit;

    // skip the cuts that have been unassigned during area recovery
    pCutBest = pNode->pCutBest[fPhase];
    if ( p->fMappingMode != 0 && pCutBest == NULL )
        return 1;

    // recompute the arrival times of the current best match 
    // because the arrival times of the fanins may have changed 
    // as a result of remapping fanins in the topological order
    if ( p->fMappingMode != 0 )
        Map_TimeCutComputeArrival( pNode, pCutBest, fPhase, MAP_FLOAT_LARGE );

    // recompute the exact area of the current best match
    // because the exact area of the fanins may have changed
    // as a result of remapping fanins in the topological order
    if ( p->fMappingMode == 2 || p->fMappingMode == 3 )
    {
        pMatch = pCutBest->M + fPhase;
        if ( pNode->nRefAct[fPhase] > 0 || 
            (pNode->pCutBest[!fPhase] == NULL && pNode->nRefAct[!fPhase] > 0) )
            // pMatch->AreaFlow = Area1 = Map_CutDeref( pCutBest, fPhase, p->fUseProfile );
            pMatch->AreaFlow = Area1 = Security_CutRefDeref( pCutBest, fPhase, 0, pNode );
        else
            pMatch->AreaFlow = Area1 = Security_CutGetAreaDerefed_PlusNumberOfRareSignals( pCutBest, fPhase, pNode );
    }
    else if ( p->fMappingMode == 4 )
        assert(0);

    // save the old mapping
    if ( pCutBest )
        MatchBest = pCutBest->M[fPhase];
    else
        Map_MatchClean( &MatchBest );
 
    // select the new best cut
    fWorstLimit = pNode->tRequired[fPhase].Worst;
    for ( pCut = pNode->pCuts->pNext; pCut; pCut = pCut->pNext )
    {
        // cout << "deal with "; Security_CutPrint(p, pNode, pCut, fPhase);
        // limit gate sizes based on fanout count
        if ( p->fSkipFanout && ((pNode->nRefs > 3 && pCut->nLeaves > 2) || (pNode->nRefs > 1 && pCut->nLeaves > 3)) )
            continue;
        pMatch = pCut->M + fPhase;
        if ( pMatch->pSupers == NULL )
            continue;

        // find the matches for the cut
        Security_MatchNodeCut( p, pNode, pCut, fPhase, fWorstLimit );
        if ( pMatch->pSuperBest == NULL || pMatch->tArrive.Worst > fWorstLimit + p->fEpsilon )
            continue;

        // if the cut can be matched compare the matchings
        if ( Map_MatchCompare( p, &MatchBest, pMatch, p->fMappingMode ) )
        {
            pCutBest  =  pCut;
            MatchBest = *pMatch;
            // if we are mapping for delay, the worst-case limit should be tightened
            if ( p->fMappingMode == 0 )
                fWorstLimit = MatchBest.tArrive.Worst;
        }
    }

    if ( pCutBest == NULL )
        return 1;

    // set the new mapping
    pNode->pCutBest[fPhase] = pCutBest;
    pCutBest->M[fPhase]     = MatchBest;

    // reference the new cut if it used
    if ( p->fMappingMode >= 2 && 
         (pNode->nRefAct[fPhase] > 0 || 
         (pNode->pCutBest[!fPhase] == NULL && pNode->nRefAct[!fPhase] > 0)) )
    {
        if ( p->fMappingMode == 2 || p->fMappingMode == 3 )
            Area2 = Map_CutRef( pNode->pCutBest[fPhase], fPhase, p->fUseProfile );
        else if ( p->fMappingMode == 4 )
            Area2 = Map_SwitchCutRef( pNode, pNode->pCutBest[fPhase], fPhase );
        else 
            assert( 0 );
    }

    return 1;
}


void RareMapMan::Security_CutPrint( Map_Man_t * p, Map_Node_t * pRoot, Map_Cut_t * pCut, int fPhase ) {
    int i;
    printf( "CUT: Nodes = %d -> {", 
        pRoot->Num );
    for ( i = 0; i < pCut->nLeaves; i++ )
        printf( " %d(%lf)", pCut->ppLeaves[i]->Num, pCut->ppLeaves[i]->Switching );
    printf( " } \n" );
}


int RareMapMan::Security_MatchNodeCut( Map_Man_t * p, Map_Node_t * pNode, Map_Cut_t * pCut, int fPhase, float fWorstLimit ) {
    Map_Match_t MatchBest, * pMatch = pCut->M + fPhase;
    Map_Super_t * pSuper;
    int i, Counter;

    // save the current match of the cut
    MatchBest = *pMatch;
    // go through the supergates
    for ( pSuper = pMatch->pSupers, Counter = 0; pSuper; pSuper = pSuper->pNext, Counter++ )
    {
        p->nMatches++;
        // this is an attempt to reduce the runtime of matching and area 
        // at the cost of rare and very minor increase in delay
        // (the supergates are sorted by increasing area)
        if ( Counter == 30 )
           break;

        // go through different phases of the given match and supergate
        pMatch->pSuperBest = pSuper;
        for ( i = 0; i < (int)pSuper->nPhases; i++ )
        {
            p->nPhases++;
            // find the overall phase of this match
            pMatch->uPhaseBest = pMatch->uPhase ^ pSuper->uPhases[i];
            if ( p->fMappingMode == 0 )
            {
                // get the arrival time
                Map_TimeCutComputeArrival( pNode, pCut, fPhase, fWorstLimit );
                // skip the cut if the arrival times exceed the required times
                if ( pMatch->tArrive.Worst > fWorstLimit + p->fEpsilon )
                    continue;
                // get the area (area flow)
                pMatch->AreaFlow = Security_CutGetAreaFlow_PlusNumberOfRareSignals( pCut, fPhase, pNode->Switching < switchingActivityThreshold );
            }
            else
            {
                // get the area (area flow)
                if ( p->fMappingMode == 1 )
                    pMatch->AreaFlow = Security_CutGetAreaFlow_PlusNumberOfRareSignals( pCut, fPhase, pNode->Switching < switchingActivityThreshold );
                else if ( p->fMappingMode == 2 || p->fMappingMode == 3 )
                    pMatch->AreaFlow = Security_CutGetAreaDerefed_PlusNumberOfRareSignals( pCut, fPhase, pNode );
                // else if ( p->fMappingMode == 4 )
                //     pMatch->AreaFlow = Map_SwitchCutGetDerefed( pNode, pCut, fPhase );
                else 
                    assert(0);
                // skip if the cut is too large
                if ( pMatch->AreaFlow > MatchBest.AreaFlow + p->fEpsilon )
                    continue;
                // get the arrival time
                Map_TimeCutComputeArrival( pNode, pCut, fPhase, fWorstLimit );
                // skip the cut if the arrival times exceed the required times
                if ( pMatch->tArrive.Worst > fWorstLimit + p->fEpsilon )
                    continue;
            }

            // if the cut is non-trivial, compare it
            if ( Map_MatchCompare( p, &MatchBest, pMatch, p->fMappingMode ) )
            {
                MatchBest = *pMatch;
                // if we are mapping for delay, the worst-case limit should be reduced
                if ( p->fMappingMode == 0 )
                    fWorstLimit = MatchBest.tArrive.Worst;
            }
        }
    }
    // set the best match
    *pMatch = MatchBest;

    // recompute the arrival time and area (area flow) of this cut
    if ( pMatch->pSuperBest )
    {
        Map_TimeCutComputeArrival( pNode, pCut, fPhase, MAP_FLOAT_LARGE );
        if ( p->fMappingMode == 0 || p->fMappingMode == 1 )
            pMatch->AreaFlow = Security_CutGetAreaFlow_PlusNumberOfRareSignals( pCut, fPhase, pNode->Switching < switchingActivityThreshold );
        else if ( p->fMappingMode == 2 || p->fMappingMode == 3 )
            pMatch->AreaFlow = Security_CutGetAreaDerefed_PlusNumberOfRareSignals( pCut, fPhase, pNode );
        // else if ( p->fMappingMode == 4 )
        //     pMatch->AreaFlow = Map_SwitchCutGetDerefed( pNode, pCut, fPhase );
        else 
            assert(0);
    }
    return 1;
}


extern "C" float Map_NodeReadRefPhaseEst( Map_Node_t * pNode, int fPhase );
float RareMapMan::Security_CutGetAreaFlow_PlusNumberOfRareSignals( Map_Cut_t * pCut, int fPhase, int isRareSignal ) {
    Map_Match_t * pM = pCut->M + fPhase;
    Map_Super_t * pSuper = pM->pSuperBest;
    unsigned uPhaseTot = pM->uPhaseBest;
    Map_Cut_t * pCutFanin;
    float aFlowRes, aFlowFanin, nRefs;
    int i, fPinPhasePos;

    // start the resulting area flow
    // aFlowRes = pSuper->Area;
    aFlowRes = isRareSignal ? LARGE + pSuper->Area : pSuper->Area;
    // iterate through the leaves
    for ( i = 0; i < pCut->nLeaves; i++ )
    {
        // get the phase of this fanin
        fPinPhasePos = ((uPhaseTot & (1 << i)) == 0);
        // get the cut implementing this phase of the fanin
        pCutFanin = pCut->ppLeaves[i]->pCutBest[fPinPhasePos];
        // if the cut is not available, we have to use the opposite phase
        if ( pCutFanin == NULL )
        {
            fPinPhasePos = !fPinPhasePos;
            pCutFanin = pCut->ppLeaves[i]->pCutBest[fPinPhasePos];
        }
        aFlowFanin = pCutFanin->M[fPinPhasePos].AreaFlow; // ignores the area of the interter
        // get the fanout count of the cut in the given phase
        nRefs = Map_NodeReadRefPhaseEst( pCut->ppLeaves[i], fPinPhasePos );
        // if the node does no fanout, assume fanout count equal to 1
        if ( nRefs == (float)0.0 )
            nRefs = (float)1.0;
        // add the area flow due to the fanin
        aFlowRes += aFlowFanin / nRefs;
    }
    pM->AreaFlow = aFlowRes;
    return aFlowRes;
}


float RareMapMan::Security_CutGetAreaDerefed_PlusNumberOfRareSignals( Map_Cut_t * pCut, int fPhase, Map_Node_t * pNode ) { 
    float aResult, aResult2;
    aResult2 = Security_CutRefDeref( pCut, fPhase, 1, pNode ); // reference
    aResult  = Security_CutRefDeref( pCut, fPhase, 0, pNode ); // dereference
    // assert( aResult == aResult2 );
    return aResult;
}


float RareMapMan::Security_CutRefDeref( Map_Cut_t * pCut, int fPhase, int fReference, abc::Map_Node_t * pRoot ) {
    Map_Node_t * pNodeChild;
    Map_Cut_t * pCutChild;
    float aArea;
    int i, fPhaseChild;

    // consider the elementary variable
    if ( pCut->nLeaves == 1 )
        return 0;
    // start the area of this cut
    // aArea = Map_CutGetRootArea( pCut, fPhase );
    aArea = (pRoot->Switching < switchingActivityThreshold) ? LARGE + Map_CutGetRootArea( pCut, fPhase ): Map_CutGetRootArea( pCut, fPhase );
    
    // go through the children
    for ( i = 0; i < pCut->nLeaves; i++ )
    {
        pNodeChild  = pCut->ppLeaves[i];
        fPhaseChild = Map_CutGetLeafPhase( pCut, fPhase, i );
        // get the reference counter of the child
        if ( fReference )
        {
            if ( pNodeChild->pCutBest[0] && pNodeChild->pCutBest[1] ) // both phases are present
            {
                // if this phase of the node is referenced, there is no recursive call
                pNodeChild->nRefAct[2]++;
                if ( pNodeChild->nRefAct[fPhaseChild]++ > 0 )
                    continue;
            }
            else // only one phase is present
            {
                // inverter should be added if the phase
                // (a) has no reference and (b) is implemented using other phase
                if ( pNodeChild->nRefAct[fPhaseChild]++ == 0 && pNodeChild->pCutBest[fPhaseChild] == NULL )
                    aArea += pNodeChild->p->pSuperLib->AreaInv;
                // if the node is referenced, there is no recursive call
                if ( pNodeChild->nRefAct[2]++ > 0 )
                    continue;
            }
        }
        else
        {
            if ( pNodeChild->pCutBest[0] && pNodeChild->pCutBest[1] ) // both phases are present
            {
                // if this phase of the node is referenced, there is no recursive call
                --pNodeChild->nRefAct[2];
                if ( --pNodeChild->nRefAct[fPhaseChild] > 0 )
                    continue;
            }
            else // only one phase is present
            {
                // inverter should be added if the phase
                // (a) has no reference and (b) is implemented using other phase
                if ( --pNodeChild->nRefAct[fPhaseChild] == 0 && pNodeChild->pCutBest[fPhaseChild] == NULL )
                    aArea += pNodeChild->p->pSuperLib->AreaInv;
                // if the node is referenced, there is no recursive call
                if ( --pNodeChild->nRefAct[2] > 0 )
                    continue;
            }
            assert( pNodeChild->nRefAct[fPhaseChild] >= 0 );
        }

        // get the child cut
        pCutChild = pNodeChild->pCutBest[fPhaseChild];
        // if the child does not have this phase mapped, take the opposite phase
        if ( pCutChild == NULL )
        {
            fPhaseChild = !fPhaseChild;
            pCutChild   = pNodeChild->pCutBest[fPhaseChild];
        }
        // reference and compute area recursively
        aArea += Security_CutRefDeref( pCutChild, fPhaseChild, fReference, pNodeChild );
    }
    return aArea;
}


extern "C" Abc_Ntk_t * Abc_NtkDarAmap( Abc_Ntk_t * pNtk, Amap_Par_t * pPars );
int RareMapMan::Security_Amap( NetMan & net ) {
    Abc_Ntk_t * pNtk = net.GetNet();
    Amap_Par_t Pars, * pPars = &Pars;
    Abc_Ntk_t * pNtkRes = nullptr;

    // set defaults
    Amap_ManSetDefaultParams( pPars );
    // pPars->fVerbose = 1;

    if ( pNtk == NULL )
    {
        Abc_Print( -1, "Empty network.\n" );
        return 1;
    }

    if ( !Abc_NtkIsStrash(pNtk) )
    {
        pNtk = Abc_NtkStrash( pNtk, 0, 0, 0 );
        if ( pNtk == NULL )
        {
            Abc_Print( -1, "Strashing before mapping has failed.\n" );
            return 1;
        }
        // pNtk = Abc_NtkBalance( pNtkRes = pNtk, 0, 0, 1 );
        // Abc_NtkDelete( pNtkRes );
        // if ( pNtk == NULL )
        // {
        //     Abc_Print( -1, "Balancing before mapping has failed.\n" );
        //     return 1;
        // }
        Abc_Print( 0, "The network was strashed before mapping.\n" );
        // get the new network
        pNtkRes = Security_NtkDarAmap( pNtk, pPars );
        if ( pNtkRes == NULL )
        {
            Abc_NtkDelete( pNtk );
            Abc_Print( -1, "Mapping has failed.\n" );
            return 1;
        }
        Abc_NtkDelete( pNtk );
    }
    else
        assert(0);

    // replace the current network
    auto pAbc = Abc_FrameGetGlobalFrame();
    Abc_FrameReplaceCurrentNetwork( pAbc, pNtkRes );
    return 0;
}


extern "C" Aig_Man_t * Abc_NtkToDarChoices( Abc_Ntk_t * pNtk );
extern "C" Abc_Ntk_t * Amap_ManProduceNetwork( Abc_Ntk_t * pNtk, Vec_Ptr_t * vMapping );
Abc_Ntk_t * RareMapMan::Security_NtkDarAmap( Abc_Ntk_t * pNtk, Amap_Par_t * pPars ) {
    Vec_Ptr_t * vMapping;
    Abc_Ntk_t * pNtkAig = NULL;
    Aig_Man_t * pMan;
    Aig_MmFlex_t * pMem;

    assert( Abc_NtkIsStrash(pNtk) );
    // convert to the AIG manager
    pMan = Abc_NtkToDarChoices( pNtk );
    if ( pMan == NULL )
        return NULL;

    // perform computation
    vMapping = Security_Amap_ManTest( pMan, pPars );
    Aig_ManStop( pMan );
    if ( vMapping == NULL )
        return NULL;
    pMem = (Aig_MmFlex_t *)Vec_PtrPop( vMapping );
    pNtkAig = Amap_ManProduceNetwork( pNtk, vMapping );
    Aig_MmFlexStop( pMem, 0 );
    Vec_PtrFree( vMapping );

    // make sure everything is okay
    if ( pNtkAig && !Abc_NtkCheck( pNtkAig ) )
    {
        Abc_Print( 1, "Abc_NtkDar: The network check has failed.\n" );
        Abc_NtkDelete( pNtkAig );
        return NULL;
    }
    return pNtkAig;
}


Vec_Ptr_t * RareMapMan::Security_Amap_ManTest( Aig_Man_t * pAig, Amap_Par_t * pPars ) {
    Vec_Ptr_t * vRes;
    Amap_Man_t * p;
    Amap_Lib_t * pLib;
    abctime clkTotal = Abc_Clock();
    pLib = (Amap_Lib_t *)Abc_FrameReadLibGen2();
    if ( pLib == NULL )
    {
        printf( "Library is not available.\n" );
        return NULL;
    }
    p = Amap_ManStart( Aig_ManNodeNum(pAig) );
    p->pPars = pPars;
    // p->pPars->fVerbose = 1;
    p->pLib  = pLib;
    p->fAreaInv = pPars->fFreeInvs? 0.0 : pLib->pGateInv->dArea;
    p->fUseMux = pPars->fUseMuxes && pLib->fHasMux;
    p->fUseXor = pPars->fUseXors && pLib->fHasXor;
    assert(p->fUseMux == 0);
    p->ppCutsTemp = ABC_CALLOC( Amap_Cut_t *, 2 * pLib->nNodes );
    p->pMatsTemp = ABC_CALLOC( int, 2 * pLib->nNodes );
    Amap_ManCreate( p, pAig );
    ComputeSwitchingActivity(p);
    Security_Amap_ManMap( p );
    vRes = NULL;
    vRes = Amap_ManProduceMapped( p );
    Amap_ManStop( p );
if ( pPars->fVerbose )
{
ABC_PRT( "Total runtime", Abc_Clock() - clkTotal );
}
    return vRes;
}


static float Sim_ComputeSwitching( unsigned * pSimInfo, int nSimWords )
{
    int nOnes, nTotal;
    nTotal = 32 * nSimWords;
    nOnes = Sim_UtilCountOnes( pSimInfo, nSimWords );
    return (float)2.0 * nOnes / nTotal * (nTotal - nOnes) / nTotal;
}
void Amap_SimulateNode( Amap_Man_t * pAmap, Amap_Obj_t * pNode, Vec_Ptr_t * vSimInfo, int nSimWords ) {
    unsigned * pSimmNode, * pSimmNode1, * pSimmNode2;
    int k, fComp1, fComp2;
    // simulate the internal nodes
    // assert( Abc_ObjIsNode(pNode) );
    pSimmNode  = (unsigned *)Vec_PtrEntry(vSimInfo, pNode->Id);
    pSimmNode1 = (unsigned *)Vec_PtrEntry(vSimInfo, Amap_ObjFanin0(pAmap, pNode)->Id);
    pSimmNode2 = (unsigned *)Vec_PtrEntry(vSimInfo, Amap_ObjFanin1(pAmap, pNode)->Id);
    // pSimmNode  += nOffset;
    // pSimmNode1 += nOffset;
    // pSimmNode2 += nOffset;
    fComp1 = Amap_ObjFaninC0(pNode);
    fComp2 = Amap_ObjFaninC1(pNode);
    if (pNode->Type == AMAP_OBJ_AND) {
        if ( fComp1 && fComp2 )
            for ( k = 0; k < nSimWords; k++ )
                pSimmNode[k] = ~pSimmNode1[k] & ~pSimmNode2[k];
        else if ( fComp1 && !fComp2 )
            for ( k = 0; k < nSimWords; k++ )
                pSimmNode[k] = ~pSimmNode1[k] &  pSimmNode2[k];
        else if ( !fComp1 && fComp2 )
            for ( k = 0; k < nSimWords; k++ )
                pSimmNode[k] =  pSimmNode1[k] & ~pSimmNode2[k];
        else // if ( fComp1 && fComp2 )
            for ( k = 0; k < nSimWords; k++ )
                pSimmNode[k] =  pSimmNode1[k] &  pSimmNode2[k];
    }
    else if (pNode->Type == AMAP_OBJ_XOR) {
        if ( fComp1 && fComp2 )
            for ( k = 0; k < nSimWords; k++ )
                pSimmNode[k] = ~pSimmNode1[k] ^ ~pSimmNode2[k];
        else if ( fComp1 && !fComp2 )
            for ( k = 0; k < nSimWords; k++ )
                pSimmNode[k] = ~pSimmNode1[k] ^  pSimmNode2[k];
        else if ( !fComp1 && fComp2 )
            for ( k = 0; k < nSimWords; k++ )
                pSimmNode[k] =  pSimmNode1[k] ^ ~pSimmNode2[k];
        else // if ( fComp1 && fComp2 )
            for ( k = 0; k < nSimWords; k++ )
                pSimmNode[k] =  pSimmNode1[k] ^  pSimmNode2[k];
    }
    else
        assert(0);
}
void RareMapMan::ComputeSwitchingActivity(Amap_Man_t * pAmap) {
    Vec_Ptr_t * vSimInfo;
    unsigned * pSimInfo;
    int nSimWords, i;
    Amap_Obj_t * pObj;

    // allocate space for simulation info of all nodes
    nSimWords = SIM_NUM_WORDS(nFrame);
    vSimInfo = Sim_UtilInfoAlloc( Amap_ManObjNum(pAmap) + 1, nSimWords, 0 );
    switchingActivity.resize(Amap_ManObjNum(pAmap) + 1, 0.0);
    // assign the random simulation to the CIs
    Amap_ManForEachPi( pAmap, pObj, i )
    {
        pSimInfo = (unsigned *)Vec_PtrEntry(vSimInfo, pObj->Id);
        Sim_UtilSetRandom( pSimInfo, nSimWords );
        switchingActivity[pObj->Id] = Sim_ComputeSwitching( pSimInfo, nSimWords );
    }
    // simulate the internal nodes
    Amap_ManForEachNode( pAmap, pObj, i )
    {
        // cout << pObj->Id << " " << pObj->Type << endl;
        pSimInfo = (unsigned *)Vec_PtrEntry(vSimInfo, pObj->Id);
        Amap_SimulateNode( pAmap, pObj, vSimInfo, nSimWords );
        switchingActivity[pObj->Id] = Sim_ComputeSwitching( pSimInfo, nSimWords );
    }
    Sim_UtilInfoFree( vSimInfo );

    // Amap_ManForEachNode( pAmap, pObj, i ) {
    //     if (switchingActivity[pObj->Id] < switchingActivityThreshold) {
    //         cout << "node " << pObj->Id << " has switching activity " << switchingActivity[pObj->Id] << endl;
    //     }
    // }
}


extern "C" void Amap_ManCleanData( Amap_Man_t * p );
void RareMapMan::Security_Amap_ManMap( Amap_Man_t * p ) {
    int i;
    Amap_ManMerge( p );
    for ( i = 0; i < p->pPars->nIterFlow; i++ )
        Security_Amap_ManMatch( p, 1, i>0 );
    for ( i = 0; i < p->pPars->nIterArea; i++ )
        Security_Amap_ManMatch( p, 0, p->pPars->nIterFlow>0||i>0 );
    Amap_ManCleanData( p );
}


extern "C" float Amap_ManComputeMapping( Amap_Man_t * p );
extern "C" int Amap_ManCountInverters( Amap_Man_t * p );
extern "C" float Amap_ManMaxDelay( Amap_Man_t * p );
void RareMapMan::Security_Amap_ManMatch( Amap_Man_t * p, int fFlow, int fRefs ) {
    Aig_MmFlex_t * pMemOld;
    Amap_Obj_t * pObj;
    float Area;
    int i, nInvs;
    abctime clk = Abc_Clock();
    pMemOld = p->pMemCutBest;
    p->pMemCutBest = Aig_MmFlexStart();
    Amap_ManForEachNode( p, pObj, i )
        if ( pObj->pData )
            Security_Amap_ManMatchNode( p, pObj, fFlow, fRefs );
    Aig_MmFlexStop( pMemOld, 0 );
    Area = Amap_ManComputeMapping( p );
    nInvs = Amap_ManCountInverters( p );
if ( p->pPars->fVerbose )
{
    printf( "Area =%9.2f. Gate =%9.2f. Inv =%9.2f. (%6d.) Delay =%6.2f. ", 
        Area + nInvs * p->fAreaInv, 
        Area, nInvs * p->fAreaInv, nInvs,
        Amap_ManMaxDelay(p) );
ABC_PRT( "Time ", Abc_Clock() - clk );
}
}


float RareMapMan::Security_Amap_CutAreaDeref( Amap_Man_t * p, Amap_Mat_t * pM, Amap_Obj_t * pRoot )
{
    Amap_Obj_t * pFanin;
    int i, fCompl;
    float Area = Amap_LibGate( p->pLib, pM->pSet->iGate )->dArea;
    if (switchingActivity[pRoot->Id] < switchingActivityThreshold)
        Area += LARGE;
    Amap_MatchForEachFaninCompl( p, pM, pFanin, fCompl, i )
    {
        assert( Amap_ObjRefsTotal(pFanin) > 0 );
        if ( (int)pFanin->fPolar != fCompl && pFanin->nFouts[fCompl] == 1 )
            Area += p->fAreaInv;
        if ( --pFanin->nFouts[fCompl] + pFanin->nFouts[!fCompl] == 0 && Amap_ObjIsNode(pFanin) )
            Area += Security_Amap_CutAreaDeref( p, &pFanin->Best, pFanin );
    }
    return Area;
}


static inline void Amap_ManMatchStart( Amap_Mat_t * p, Amap_Cut_t * pCut, Amap_Set_t * pSet )
{
    memset( p, 0, sizeof(Amap_Mat_t) );
    p->pCut = pCut;
    p->pSet = pSet;
}


void RareMapMan::Security_Amap_ManMatchGetFlows( Amap_Man_t * p, Amap_Obj_t * pRoot, Amap_Mat_t * pM )
{
    Amap_Mat_t * pMFanin;
    Amap_Obj_t * pFanin;
    Amap_Gat_t * pGate;
    float AddOn; 
    int i;
    pGate = Amap_LibGate( p->pLib, pM->pSet->iGate );
    assert( pGate->nPins == pM->pCut->nFans );
    assert( pM->Area == 0.0 );
    pM->Area = pGate->dArea;
    if (switchingActivity[pRoot->Id] < switchingActivityThreshold)
        pM->Area += LARGE;
    pM->AveFan = 0.0;
    pM->Delay = 0.0;
    Amap_MatchForEachFanin( p, pM, pFanin, i )
    {
        pMFanin = &pFanin->Best;
        pM->Delay = Abc_MaxInt( pM->Delay, pMFanin->Delay );
        pM->AveFan += Amap_ObjRefsTotal(pFanin);
        AddOn = Amap_ObjRefsTotal(pFanin) == 0 ? pMFanin->Area : pMFanin->Area / pFanin->EstRefs; 
        if ( pM->Area >= (float)1e32 || AddOn >= (float)1e32 )
            pM->Area = (float)1e32;
        else 
            pM->Area += AddOn;
    }
    pM->AveFan /= pGate->nPins;
    pM->Delay += 1.0;
}


float RareMapMan::Security_Amap_CutAreaRef2( Amap_Man_t * p, Amap_Mat_t * pM, Vec_Ptr_t * vTemp, int Limit, Amap_Obj_t * pRoot )
{
    Amap_Obj_t * pFanin;
    int i, fCompl;
    float Area = Amap_LibGate( p->pLib, pM->pSet->iGate )->dArea;
    if (switchingActivity[pRoot->Id] < switchingActivityThreshold)
        Area += LARGE;
    if ( Limit == 0 ) return Area;
    Amap_MatchForEachFaninCompl( p, pM, pFanin, fCompl, i )
    {
        Vec_PtrPush( vTemp, pFanin->nFouts + fCompl );
        assert( Amap_ObjRefsTotal(pFanin) >= 0 );
        if ( (int)pFanin->fPolar != fCompl && pFanin->nFouts[fCompl] == 0 ) {
            Area += p->fAreaInv;
            if (switchingActivity[pFanin->Id] < switchingActivityThreshold)
                Area += LARGE;
        }
        if ( pFanin->nFouts[fCompl]++ + pFanin->nFouts[!fCompl] == 0 && Amap_ObjIsNode(pFanin) )
            Area += Security_Amap_CutAreaRef2( p, &pFanin->Best, vTemp, Limit-1, pFanin );
    }
    return Area;
}


float RareMapMan::Security_Amap_CutAreaDerefed2( Amap_Man_t * p, Amap_Obj_t * pNode, Amap_Mat_t * pM )
{
    int nRecurLevels = 8;
    int fComplNew, i, * pInt;
    float aResult;
    Vec_PtrClear( p->vTempP );
    aResult = Security_Amap_CutAreaRef2( p, pM, p->vTempP, nRecurLevels, pNode );
    Vec_PtrForEachEntry( int *, p->vTempP, pInt, i )
        (*pInt)--;
    // if node is needed in another polarity, add inverter
    fComplNew = pM->pCut->fInv ^ pM->pSet->fInv;
    if ( pNode->nFouts[fComplNew] == 0 && pNode->nFouts[!fComplNew] > 0 ) {
        aResult += p->fAreaInv;
        if (switchingActivity[pNode->Id] < switchingActivityThreshold)
            aResult += LARGE;
    }
    return aResult;
}


void RareMapMan::Security_Amap_ManMatchGetExacts( Amap_Man_t * p, Amap_Obj_t * pNode, Amap_Mat_t * pM ) {
    Amap_Mat_t * pMFanin;
    Amap_Obj_t * pFanin;
    Amap_Gat_t * pGate;
    int i;
    pGate = Amap_LibGate( p->pLib, pM->pSet->iGate );
    assert( pGate->nPins == pM->pCut->nFans );
    assert( pM->Area == 0.0 );
    pM->AveFan = 0.0;
    pM->Delay = 0.0;
    Amap_MatchForEachFanin( p, pM, pFanin, i )
    {
        pMFanin = &pFanin->Best;
        pM->Delay = Abc_MaxInt( pM->Delay, pMFanin->Delay );
        pM->AveFan += Amap_ObjRefsTotal(pFanin);
    }
    pM->AveFan /= pGate->nPins;
    pM->Delay += 1.0;
    pM->Area = Security_Amap_CutAreaDerefed2( p, pNode, pM );
}


static inline int Amap_CutCompareDelay( Amap_Man_t * p, Amap_Mat_t * pM0, Amap_Mat_t * pM1 )
{
    // compare delay
    if ( pM0->Delay < pM1->Delay - p->pPars->fEpsilon )
        return -1;
    if ( pM0->Delay > pM1->Delay + p->pPars->fEpsilon )
        return 1;

    // compare area flows
    if ( pM0->Area < pM1->Area - p->pPars->fEpsilon )
        return -1;
    if ( pM0->Area > pM1->Area + p->pPars->fEpsilon )
        return 1;

    // compare average fanouts
    if ( pM0->AveFan > pM1->AveFan - p->pPars->fEpsilon )
        return -1;
    if ( pM0->AveFan < pM1->AveFan + p->pPars->fEpsilon )
        return 1;
    return 1;
}
static inline int Amap_CutCompareArea( Amap_Man_t * p, Amap_Mat_t * pM0, Amap_Mat_t * pM1 )
{
    // compare area flows
    if ( pM0->Area < pM1->Area - p->pPars->fEpsilon )
        return -1;
    if ( pM0->Area > pM1->Area + p->pPars->fEpsilon )
        return 1;

    // compare average fanouts
    if ( pM0->AveFan > pM1->AveFan - p->pPars->fEpsilon )
        return -1;
    if ( pM0->AveFan < pM1->AveFan + p->pPars->fEpsilon )
        return 1;

    // compare delay
    if ( pM0->Delay < pM1->Delay - p->pPars->fEpsilon )
        return -1;
    if ( pM0->Delay > pM1->Delay + p->pPars->fEpsilon )
        return 1;
    return 1;
}


float RareMapMan::Security_Amap_CutAreaRef( Amap_Man_t * p, Amap_Mat_t * pM, Amap_Obj_t * pRoot )
{
    Amap_Obj_t * pFanin;
    int i, fCompl;
    float Area = Amap_LibGate( p->pLib, pM->pSet->iGate )->dArea;
    if (switchingActivity[pRoot->Id] < switchingActivityThreshold)
        Area += LARGE;
    Amap_MatchForEachFaninCompl( p, pM, pFanin, fCompl, i )
    {
        assert( Amap_ObjRefsTotal(pFanin) >= 0 );
        if ( (int)pFanin->fPolar != fCompl && pFanin->nFouts[fCompl] == 0 )
            Area += p->fAreaInv;
        if ( pFanin->nFouts[fCompl]++ + pFanin->nFouts[!fCompl] == 0 && Amap_ObjIsNode(pFanin) )
            Area += Security_Amap_CutAreaRef( p, &pFanin->Best, pFanin );
    }
    return Area;
}
extern "C" Amap_Cut_t * Amap_ManDupCut( Amap_Man_t * p, Amap_Cut_t * pCut );
void RareMapMan::Security_Amap_ManMatchNode( Amap_Man_t * p, Amap_Obj_t * pNode, int fFlow, int fRefs ) {
    int fVerbose = 0; //(pNode->Level == 2 || pNode->Level == 4);
    int fVeryVerbose = fVerbose;

    Amap_Mat_t MA = {0}, MD = {0}, M = {0};
    Amap_Mat_t * pMBestA = &MA, * pMBestD = &MD, * pMThis = &M, * pMBest;
    Amap_Cut_t * pCut;
    Amap_Set_t * pSet;
    Amap_Nod_t * pNod;
    int i;

    if ( fRefs )
        pNode->EstRefs = (float)((2.0 * pNode->EstRefs + Amap_ObjRefsTotal(pNode)) / 3.0);
    else
        pNode->EstRefs = (float)pNode->nRefs;
    if ( fRefs && Amap_ObjRefsTotal(pNode) > 0 )
        Security_Amap_CutAreaDeref( p, &pNode->Best, pNode ); // 1111111111111111

    if ( fVerbose )
        printf( "\nNode %d (%d)\n", pNode->Id, pNode->Level );

    pMBestA->pCut = pMBestD->pCut = NULL;
    Amap_NodeForEachCut( pNode, pCut, i )
    {
        if ( pCut->iMat == 0 )
            continue;
        pNod = Amap_LibNod( p->pLib, pCut->iMat );
        Amap_LibNodeForEachSet( pNod, pSet )
        {
            Amap_ManMatchStart( pMThis, pCut, pSet );
            if ( fFlow )
                Security_Amap_ManMatchGetFlows( p, pNode, pMThis ); // 2222222222222222
            else
                Security_Amap_ManMatchGetExacts( p, pNode, pMThis ); // 3333333333333333
            if ( pMBestD->pCut == NULL || Amap_CutCompareDelay(p, pMBestD, pMThis) == 1 )
                *pMBestD = *pMThis;
            if ( pMBestA->pCut == NULL || Amap_CutCompareArea(p, pMBestA, pMThis) == 1 )
                *pMBestA = *pMThis;

            if ( fVeryVerbose ) 
            {
                printf( "Cut %2d (%d) :  ", i, pCut->nFans );
                printf( "Gate %10s  ",      Amap_LibGate(p->pLib, pMThis->pSet->iGate)->pName );
                printf( "%s  ",             pMThis->pSet->fInv ? "inv" : "   " );
                printf( "Delay %5.2f  ",    pMThis->Delay );
                printf( "Area %5.2f  ",     pMThis->Area );
                printf( "\n" );
            }
        }
    }

    if ( Abc_AbsFloat(pMBestA->Area - pMBestD->Area) / pMBestD->Area >= p->pPars->fADratio * Abc_AbsFloat(pMBestA->Delay - pMBestD->Delay) / pMBestA->Delay )
        pMBest = pMBestA;
    else
        pMBest = pMBestD;

    if ( fVerbose )
    {
        printf( "BEST MATCHA:  " );
        printf( "Gate %10s  ",    Amap_LibGate(p->pLib, pMBestA->pSet->iGate)->pName );
        printf( "%s  ",           pMBestA->pSet->fInv ? "inv" : "   " );
        printf( "Delay %5.2f  ",  pMBestA->Delay );
        printf( "Area %5.2f  ",   pMBestA->Area );
        printf( "\n" ); 

        printf( "BEST MATCHD:  " );
        printf( "Gate %10s  ",    Amap_LibGate(p->pLib, pMBestD->pSet->iGate)->pName );
        printf( "%s  ",           pMBestD->pSet->fInv ? "inv" : "   " );
        printf( "Delay %5.2f  ",  pMBestD->Delay );
        printf( "Area %5.2f  ",   pMBestD->Area );
        printf( "\n" ); 

        printf( "BEST MATCH :  " );
        printf( "Gate %10s  ",    Amap_LibGate(p->pLib, pMBest->pSet->iGate)->pName );
        printf( "%s  ",           pMBest->pSet->fInv ? "inv" : "   " );
        printf( "Delay %5.2f  ",  pMBest->Delay );
        printf( "Area %5.2f  ",   pMBest->Area );
        printf( "\n" ); 
    }

    pNode->fPolar = pMBest->pCut->fInv ^ pMBest->pSet->fInv;
    pNode->Best = *pMBest;
    pNode->Best.pCut = Amap_ManDupCut( p, pNode->Best.pCut );
    if ( fRefs && Amap_ObjRefsTotal(pNode) > 0 )
        Security_Amap_CutAreaRef( p, &pNode->Best, pNode ); // 4444444444444444
}