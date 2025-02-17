#pragma once


#include "header.h"
#include "my_abc.h"
#include "simulator.h"


struct RareMapOpt {
    unsigned sourceSeed = 314;
    ll nFrame = 100032;
    double rareSignalThreshold = 0.02;
    abc::Abc_Ntk_t * pNtk = nullptr;
    std::string outpPath = "./tmp/";

    void Print();
};


class RareMapMan {
private:
    const double LARGE = pow(10, 7);
    unsigned sourceSeed;
    unsigned seed;
    ll nFrame;
    ll nThread;
    ll iterationRound;
    double rareSignalThreshold;
    double switchingActivityThreshold;
    double maxDelay;
    NetMan oriNet;
    std::string outpPath;
    boost::mt19937 randGen;
    std::vector<float> switchingActivity;

    RareMapMan(const RareMapMan &);
    RareMapMan(RareMapMan &&);
    RareMapMan & operator = (const RareMapMan &);
    RareMapMan & operator = (RareMapMan &&);

public:
    explicit RareMapMan(RareMapOpt & opt);
    ~RareMapMan() = default;
    void SecurityAwareApproximateLogicSynthesis();
    void DetectRareSignals(NetMan& net, std::vector<ll> & rareSignals, double rareThreshold = 0.001);
    int CollectSignalProbabilities(NetMan& net, std::vector<double> & signalProbabilities, bool enablePrint = true);
    int CollectUnhiddenRareSignals(NetMan& net, std::vector<ll> & unhiddenRareSignals, bool enablePrint = true);
    int CollectInherentRareSignals(NetMan& net, bool enablePrint = true);
    void AnalyzeRareSignal(NetMan& net, const std::string & signalName);
    unsigned NewSeed();

    int SecurityAwareTechnologyMapping(NetMan & net, int fAreaOnly);
    abc::Abc_Ntk_t * Security_NtkMap( abc::Abc_Ntk_t * pNtk, double DelayTarget, double AreaMulti, double DelayMulti, float LogFan, float Slew, float Gain, int nGatesMin, int fRecovery, int fSwitching, int fSkipFanout, int fUseProfile, int fUseBuffs, int fVerbose );
    abc::Map_Man_t * Security_NtkToMap( abc::Abc_Ntk_t * pNtk, double DelayTarget, int fRecovery, float * pSwitching, int fVerbose );
    int Security_Mapping( abc::Map_Man_t * p );
    int Security_MappingMatches( abc::Map_Man_t * p );
    int Security_MatchNodePhase( abc::Map_Man_t * p, abc::Map_Node_t * pNode, int fPhase );
    void Security_CutPrint( abc::Map_Man_t * p, abc::Map_Node_t * pRoot, abc::Map_Cut_t * pCut, int fPhase );
    int Security_MatchNodeCut( abc::Map_Man_t * p, abc::Map_Node_t * pNode, abc::Map_Cut_t * pCut, int fPhase, float fWorstLimit );
    float Security_CutGetAreaFlow_PlusNumberOfRareSignals( abc::Map_Cut_t * pCut, int fPhase, int isRareSignal );
    float Security_CutGetAreaDerefed_PlusNumberOfRareSignals( abc::Map_Cut_t * pCut, int fPhase, abc::Map_Node_t * pRoot );
    float Security_CutRefDeref( abc::Map_Cut_t * pCt, int fPhase, int fReference, abc::Map_Node_t * pRoot );
    int Security_Amap( NetMan & net );
    abc::Abc_Ntk_t * Security_NtkDarAmap( abc::Abc_Ntk_t * pNtk, abc::Amap_Par_t * pPars );
    abc::Vec_Ptr_t * Security_Amap_ManTest( abc::Aig_Man_t * pAig, abc::Amap_Par_t * pPars );
    void ComputeSwitchingActivity(abc::Amap_Man_t * pAmap);
    void Security_Amap_ManMap( abc::Amap_Man_t * p );
    void Security_Amap_ManMatch( abc::Amap_Man_t * p, int fFlow, int fRefs );
    void Security_Amap_ManMatchNode( abc::Amap_Man_t * p, abc::Amap_Obj_t * pNode, int fFlow, int fRefs );
    void Security_Amap_ManMatchGetFlows( abc::Amap_Man_t * p, abc::Amap_Obj_t * pRoot, abc::Amap_Mat_t * pM );
    void Security_Amap_ManMatchGetExacts( abc::Amap_Man_t * p, abc::Amap_Obj_t * pNode, abc::Amap_Mat_t * pM );
    float Security_Amap_CutAreaDerefed2( abc::Amap_Man_t * p, abc::Amap_Obj_t * pNode, abc::Amap_Mat_t * pM );
    float Security_Amap_CutAreaRef2( abc::Amap_Man_t * p, abc::Amap_Mat_t * pM, abc::Vec_Ptr_t * vTemp, int Limit, abc::Amap_Obj_t * pRoot );
    float Security_Amap_CutAreaDeref( abc::Amap_Man_t * p, abc::Amap_Mat_t * pM, abc::Amap_Obj_t * pRoot );
    float Security_Amap_CutAreaRef( abc::Amap_Man_t * p, abc::Amap_Mat_t * pM, abc::Amap_Obj_t * pRoot );
};