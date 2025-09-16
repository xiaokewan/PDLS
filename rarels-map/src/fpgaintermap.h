#pragma once
#include "header.h"
#include "my_abc.h"

extern "C" {
#include "base/abc/abc.h"
#include "map/if/if.h"
}



// using namespace abc;


struct FpgaInterOpt {
    int lutSize = 6;              // LUT-K
    double fanoutWeight = 1.0;    // interconnect penalty weight
    double faninWeight  = 0.3;
    Abc_Ntk_t * pNtk = nullptr;
    std::string outpPath = "./tmp/";
};

class FpgaInterMapMan {
public:
    explicit FpgaInterMapMan(FpgaInterOpt & opt);
    ~FpgaInterMapMan() = default;

    void Run();

private:
    FpgaInterOpt opt;

    Abc_Ntk_t * LutMapWithFanout( Abc_Ntk_t * pNtk );
    float CutCost( If_Man_t * pIfMan, If_Cut_t * pCut, Abc_Obj_t * pRoot );
};
