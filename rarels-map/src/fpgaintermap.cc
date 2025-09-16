#include "base/abc/abc.h"
#include "base/main/main.h"
#include "map/if/if.h"
// #include "map/amap/amap.h"
#include "fpgaintermap.h"
#include <iostream>
#include <string>
#include "base/abc/abc.h"
#include "map/if/if.h"
#include "base/io/ioAbc.h"

extern "C" {
    Abc_Ntk_t * Abc_NtkIf(Abc_Ntk_t * pNtk, If_Par_t * pPars);
}

using namespace std;

FpgaInterMapMan::FpgaInterMapMan(FpgaInterOpt & opt) 
    : opt(opt) 
{
    if (!opt.pNtk) {
        cerr << "Warning: empty network passed to FpgaInterMapMan" << endl;
    }
}

void FpgaInterMapMan::Run() {
    Abc_Ntk_t * pMapped = LutMapWithFanout(opt.pNtk);
    if (!pMapped) {
        cerr << "Error: LUT mapping failed in Run()." << endl;
        return;
    }

    string out_blif = opt.outpPath + "/mapped.blif";
    string out_verilog = opt.outpPath + "/mapped.v";

    Io_WriteBblif(pMapped, (char*)out_blif.c_str());
    Io_WriteVerilog(pMapped, (char*)out_verilog.c_str(), 0);

    cout << "FPGA LUT mapping done. Results written to:" << endl;
    cout << "  " << out_blif << endl;
    cout << "  " << out_verilog << endl;
}

Abc_Ntk_t * FpgaInterMapMan::LutMapWithFanout(Abc_Ntk_t * pNtk) {
    if (!pNtk) return nullptr;

    If_Par_t Pars, * pPars = &Pars;
    If_ManSetDefaultPars(pPars);
    pPars->nLutSize = opt.lutSize;
    pPars->fPreprocess = 1;
    pPars->fArea = 1;
    pPars->DelayTarget = 1.0;
    pPars->fVerbose = 1;

    Abc_Ntk_t * pMapped = Abc_NtkIf(pNtk, pPars);
    return pMapped;
}

float FpgaInterMapMan::CutCost(If_Man_t * pIfMan, If_Cut_t * pCut, Abc_Obj_t * pRoot) {
    int fanins  = If_CutLeaveNum(pCut);
    int fanouts = Abc_ObjFanoutNum(pRoot);
    return (float)(opt.faninWeight * fanins + opt.fanoutWeight * fanouts);
}

int FpgaInterMap(FpgaInterOpt & opt) {
    FpgaInterMapMan man(opt);
    man.Run();
    return 0;
}