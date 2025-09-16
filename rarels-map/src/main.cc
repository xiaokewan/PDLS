#include "cmdline.hpp"
#include "header.h"
#include "my_abc.h"
// #include "raremap.h"
#include "fpgaintermap.h"


// using namespace abc;
using namespace boost;
using namespace cmdline;
using namespace std;


parser CommPars(int argc, char * argv[]) {
    parser option;
    option.add <string> ("inputBlif", '\0', "path to accurate circuit", false, "./input/benchmark/bacs/mult8.blif");
    // option.add <string> ("standCell", '\0', "path to standard cell library", false, "./input/standard-cell/nangate_45nm_typ.lib");
    option.add <string> ("outpPath", '\0', "path to approximate circuits", false, "tmp");
    option.add<int>("lutSize", '\0', "LUT size for FPGA mapping", false, 6);
    option.add<double>("fanoutWeight", '\0', "penalty weight for fanout", false, 1.0);
    option.add<double>("faninWeight", '\0', "reward weight for slack inputs", false, 0.3);

    option.parse_check(argc, argv);
    return option;
}

int main(int argc, char * argv[]) {
    GlobStartAbc();

    parser option = CommPars(argc, argv);

    // parse options
    string inputBlif = option.get<string>("inputBlif");
    string outpPath  = option.get<string>("outpPath");
    int lutSize      = option.get<int>("lutSize");
    double fanoutW   = option.get<double>("fanoutWeight");
    double faninW    = option.get<double>("faninWeight");

    cout << endl << "read circuit: " << inputBlif << endl;
    AbcMan abcMan;
    abcMan.ReadNet(inputBlif, true);

    FpgaInterOpt opt;
    opt.pNtk         = abcMan.GetNet();
    opt.outpPath     = outpPath;
    opt.lutSize      = lutSize;
    opt.fanoutWeight = fanoutW;
    opt.faninWeight  = faninW;

    // run FPGA interconnect-aware mapping
    FpgaInterMapMan mapper(opt);
    mapper.Run();

    GlobStopAbc();
    return 0;
}

// void RareMap(RareMapOpt & configurations) {
//     RareMapMan rareMapMan(configurations);
//     rareMapMan.Run();
// }


// int main(int argc, char * argv[]) {
//     GlobStartAbc();

//     parser option = CommPars(argc, argv);
//     RareMapOpt configurations;
//     string inputBlif = option.get <string> ("inputBlif");
//     string standCell = option.get <string> ("standCell");
//     configurations.outpPath = option.get <string> ("outpPath");
//     configurations.sourceSeed = option.get <unsigned> ("seed");
//     configurations.rareSignalThreshold = option.get <double> ("rareSignalThreshold");
//     configurations.nFrame = option.get <ll> ("nFrame");
//     bool measureMode = option.exist("measureMode");
    
//     cout << endl << endl << "read circuit: " << inputBlif << endl;
//     AbcMan abcMan;
//     if (standCell != "")
//         abcMan.ReadStandCell(standCell);
//     abcMan.ReadNet(inputBlif, true);
//     configurations.pNtk = abcMan.GetNet();

    
//     FixPath(configurations.outpPath);
//     CreatePath(configurations.outpPath);
//     // find circuitName: the string between the last '/' and the last '.' in inputBlif
//     assert(inputBlif.starts_with("./") || inputBlif.starts_with("/") );
//     string circuitName = inputBlif.substr(inputBlif.find_last_of('/') + 1);
//     circuitName = circuitName.substr(0, circuitName.find_last_of('.'));
//     configurations.outpPath += (circuitName + "_");
//     // cout << configurations.outpPath << endl;

//     if (configurations.sourceSeed == 0) {
//         random::mt19937 rng(time(0));
//         boost::uniform_int <> unif(INT_MIN, INT_MAX);
//         configurations.sourceSeed = static_cast <unsigned> (unif(rng));
//     }

//     if (measureMode) {
//         NetMan net(abcMan.GetNet(), true);
//         auto backUpNet = net;
//         RareMapMan RareMapMan(configurations);
//         vector<double> signalProbabilities;
//         RareMapMan.CollectSignalProbabilities(net, signalProbabilities, true);
//         net.Comm("topo; stime; ps -p; st;");
//         net.WriteNet(configurations.outpPath + "init.aig", true);
//         backUpNet.WriteBlif(configurations.outpPath + "init.blif");
//     }
//     else {
//         RareMap(configurations);
//     }

//     GlobStopAbc();
//     return 0;
// }