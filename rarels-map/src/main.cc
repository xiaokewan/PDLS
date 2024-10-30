#include "cmdline.hpp"
#include "header.h"
#include "my_abc.h"
#include "als.h"


using namespace abc;
using namespace boost;
using namespace cmdline;
using namespace std;


parser CommPars(int argc, char * argv[]) {
    parser option;
    option.add <string> ("inputBlif", '\0', "path to accurate circuit", false, "./input/benchmark/bacs/mult8.blif");
    // option.add <string> ("appCirc", '\0', "path to approximate circuit", false, "");
    option.add <string> ("standCell", '\0', "path to standard cell library", false, "./input/standard-cell/nangate_45nm_typ.lib");
    option.add <string> ("outpPath", '\0', "path to approximate circuits", false, "tmp");
    option.add <unsigned> ("seed", '\0', "seed for randomness", false, 0);
    option.add <ll> ("nFrame", '\0', "#Monte Carlo samples, nFrame should be an integer multiple of 64", false, 100032);
    option.add <double> ("rareSignalThreshold", '\0', "threshold for rare signals", false, 0.1, cmdline::range(0.0, 0.4));
    option.add("measureMode", '\0', "whether enable measure mode or not");
    option.parse_check(argc, argv);
    return option;
}


void RareMap(ALSOpt & configurations) {
    RareMapMan RareMapMan(configurations);
    RareMapMan.SecurityAwareApproximateLogicSynthesis();
}


int main(int argc, char * argv[]) {
    GlobStartAbc();

    parser option = CommPars(argc, argv);
    ALSOpt configurations;
    string inputBlif = option.get <string> ("inputBlif");
    string standCell = option.get <string> ("standCell");
    configurations.outpPath = option.get <string> ("outpPath");
    configurations.sourceSeed = option.get <unsigned> ("seed");
    configurations.rareSignalThreshold = option.get <double> ("rareSignalThreshold");
    configurations.nFrame = option.get <ll> ("nFrame");
    bool measureMode = option.exist("measureMode");
    
    cout << endl << endl << "read circuit: " << inputBlif << endl;
    AbcMan abcMan;
    if (standCell != "")
        abcMan.ReadStandCell(standCell);
    abcMan.ReadNet(inputBlif, true);
    configurations.pNtk = abcMan.GetNet();

    
    FixPath(configurations.outpPath);
    CreatePath(configurations.outpPath);
    // find circuitName: the string between the last '/' and the last '.' in inputBlif
    assert(inputBlif.starts_with("./") || inputBlif.starts_with("/") );
    string circuitName = inputBlif.substr(inputBlif.find_last_of('/') + 1);
    circuitName = circuitName.substr(0, circuitName.find_last_of('.'));
    configurations.outpPath += (circuitName + "_");
    // cout << configurations.outpPath << endl;

    if (configurations.sourceSeed == 0) {
        random::mt19937 rng(time(0));
        boost::uniform_int <> unif(INT_MIN, INT_MAX);
        configurations.sourceSeed = static_cast <unsigned> (unif(rng));
    }

    if (measureMode) {
        NetMan net(abcMan.GetNet(), true);
        auto backUpNet = net;
        RareMapMan RareMapMan(configurations);
        vector<double> signalProbabilities;
        RareMapMan.CollectSignalProbabilities(net, signalProbabilities, true);
        net.Comm("topo; stime; ps -p; st;");
        net.WriteNet(configurations.outpPath + "init.aig", true);
        backUpNet.WriteBlif(configurations.outpPath + "init.blif");
    }
    else {
        RareMap(configurations);
    }

    GlobStopAbc();
    return 0;
}