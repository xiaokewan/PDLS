#pragma once

#include "header.h"
#include "my_util.h"
// namespace abc {
#include "aig/aig/aig.h"
#include "aig/gia/gia.h"
#include "aig/hop/hop.h"
#include "base/main/main.h"
#include "base/main/mainInt.h"
#include "base/cmd/cmd.h"
#include "base/io/ioAbc.h"
#include "base/abc/abc.h"
#include "bool/bdc/bdc.h"
#include "bool/kit/kit.h"
#include "bool/dec/dec.h"
#include "misc/nm/nm.h"
#include "misc/nm/nmInt.h"
#include "misc/util/abc_global.h"
#include "misc/util/util_hack.h"
#include "map/amap/amap.h"
#include "map/amap/amapInt.h"
#include "map/mio/mio.h"
#include "map/mio/mioInt.h"
#include "map/mapper/mapper.h"
#include "map/mapper/mapperInt.h"
#include "map/scl/scl.h"
#include "map/scl/sclCon.h"
#include "map/scl/sclSize.h"
#include "opt/cut/cut.h"
#include "opt/cut/cutInt.h"
#include "opt/cut/cutList.h"
#include "opt/mfs/mfs.h"
#include "opt/mfs/mfsInt.h"
#include "opt/sim/sim.h"
#include "opt/rwr/rwr.h"
#include "proof/fraig/fraig.h"
#include "proof/ssw/ssw.h"

struct Abc_ManTime_t_ {
    Abc_Time_t     tArrDef;
    Abc_Time_t     tReqDef;
    Vec_Ptr_t  *   vArrs;
    Vec_Ptr_t  *   vReqs;
    Abc_Time_t     tInDriveDef;
    Abc_Time_t     tOutLoadDef;
    Abc_Time_t *   tInDrive;
    Abc_Time_t *   tOutLoad;
};
// }


enum class NET_TYPE {
    AIG, GATE, SOP, STRASH
};


enum class ORIENT {
    AREA, DELAY
};


enum class MAP_TYPE {
    LUT, SCL
};


enum class IMPR {
    GOOD, BAD, SAME
};


std::ostream & operator << (std::ostream & os, const NET_TYPE netwType);
std::ostream & operator << (std::ostream & os, const ORIENT orient);
std::ostream & operator << (std::ostream & os, const MAP_TYPE cell);
std::ostream & operator << (std::ostream & os, const IMPR impr);


// call ABC commands
class AbcMan {
private:
    const ll LutInp = 6; 

public:
    explicit AbcMan();
    ~AbcMan() = default;
    AbcMan(const AbcMan &) = delete;
    AbcMan(AbcMan &&) = delete;
    AbcMan & operator = (const AbcMan &) = delete;
    AbcMan & operator = (AbcMan &&) = delete;

    void Comm(const std::string & cmd, bool isVerb = false);
    void ReadNet(const std::string & fileName, bool inpMapVerilog = false);
    void WriteNet(const std::string & fileName, bool isVerb = false);
    void ReadStandCell(const std::string & fileName);
    void ConvToAig();
    void ConvToGate();
    void ConvToSop();
    void ConvToStrash();
    void PrintStat();
    void TopoSort();
    void StatTimeAnal();
    void Synth(ORIENT orient, bool isVerb = false);
    void SynthWithResyn2Comm();
    void SynthAndMap(double maxDelay, bool isVerb = false);
    void Sweep();
    std::pair <double, double> Map(MAP_TYPE targ, ORIENT orient, bool isVerb = false);
    std::pair <double, double> Map2(double maxDelay, bool isVerb = false);
    IMPR UpdNetw(double oldArea, double oldDelay, Abc_Ntk_t * oldNtk, double newArea, double newDelay, ORIENT orient);
    NET_TYPE GetNetType(Abc_Ntk_t * pNtk) const;
    double GetArea(Abc_Ntk_t * pNtk) const;
    double GetDelay(Abc_Ntk_t * pNtk) const;
    bool CheckSCLNet(Abc_Ntk_t * pNtk) const;
    Abc_Obj_t * GetTwinNode( Abc_Obj_t * pNode );
    void LoadAlias();

    inline Abc_Frame_t * GetAbcFame() const {return Abc_FrameGetGlobalFrame();}
    inline Abc_Ntk_t * GetNet() const {return Abc_FrameReadNtk(GetAbcFame());}
    inline NET_TYPE GetNetType() const {return GetNetType(GetNet());}
    inline double GetArea() const {return GetArea(GetNet());}
    inline double GetDelay() const {return GetDelay(GetNet());}
    inline bool IsLutNetw() const {return GetNetType() != NET_TYPE::GATE && Abc_NtkGetFaninMax(GetNet()) <= LutInp;}
    inline void SetMainNetw(Abc_Ntk_t * pNtk) {assert(pNtk != nullptr); if (pNtk != GetNet()) Abc_FrameReplaceCurrentNetwork(GetAbcFame(), pNtk);}
};


// call ABC functions
class NetMan: public AbcMan {
private:
    Abc_Ntk_t * pNtk;
    bool isDupl;

public:
    explicit NetMan();
    explicit NetMan(Abc_Ntk_t * p_ntk, bool is_dupl = false);
    explicit NetMan(std::string & fileName);
    ~NetMan();
    NetMan(const NetMan & net_man);
    NetMan(NetMan && net_man);
    NetMan & operator = (const NetMan & net_man);
    NetMan & operator = (NetMan && net_man);

    std::pair <ll, ll> GetConstId(bool isVerb = false);
    std::pair <ll, ll> CreateConst(bool isVerb = false);
    void MergeConst();
    void ReArrInTopoOrd();
    std::vector <Abc_Obj_t * > TopoSort() const;
    void TopoSortRec(Abc_Obj_t * pObj, std::vector <Abc_Obj_t *> & nodes) const;
    std::vector <ll> TopoSortWithIds() const;
    void TopoSortRecWithIds(Abc_Obj_t * pObj, std::vector <ll> & nodes) const;

    std::vector <Abc_Obj_t *> GetTFI(Abc_Obj_t * pObj) const;
    void GetTFIRec(Abc_Obj_t * pObj, std::vector <Abc_Obj_t *> & nodes) const;
    std::vector <ll> GetTFI(Abc_Obj_t * pObj, const std::set <ll> & critGraph) const;
    void GetTFIRec(Abc_Obj_t * pObj, std::vector <ll> & objs, const std::set <ll> & critGraph) const;

    std::vector <Abc_Obj_t *> GetTFO(Abc_Obj_t * pObj) const;
    void GetTFORec(Abc_Obj_t * pObj, std::vector <Abc_Obj_t *> & nodes) const;
    std::vector <ll> GetTFO(Abc_Obj_t * pObj, const std::set <ll> & critGraph) const;
    void GetTFORec(Abc_Obj_t * pObj, std::vector <ll> & objs, const std::set <ll> & critGraph) const;

    std::vector <Abc_Obj_t *> GetFanins(Abc_Obj_t * pObj) const;
    std::vector <Abc_Obj_t *> GetFanouts(Abc_Obj_t * pObj) const;

    Abc_Obj_t* GetObjByName(const std::string & name, bool considerPO = false) const;

    void Comm(const std::string & cmd, bool isVerb = false);
    void Sweep();
    void ConvToSopWithTwoInps();
    void SynthWithResyn2Comm();
    void SynthWithCompress2rsComm();
    void SynthAndMap(double maxDelay, bool isVerb = false);
    void Compile(double maxDelay);
    void WriteBlif(const std::string & fileName) const;
    void WriteDot(const std::string & fileName, std::vector<double>* pData = nullptr, double threshold = 0.5) const;
    void Print(bool showFunct = false) const;
    void PrintObjBas(Abc_Obj_t * pObj, std::string && endWith) const;
    void PrintObj(Abc_Obj_t * pObj, bool showFunct = false) const;
    bool IsPIOSame(NetMan & oth_net) const;
    ll GetNodeMffcSize(Abc_Obj_t * pNode) const;
    std::vector <Abc_Obj_t *> GetNodeMffc(Abc_Obj_t * pNode) const;
    ll CreateNode(const std::vector <ll> & faninIds, const std::string & sop);
    std::vector <ll> TempRepl(Abc_Obj_t * pTS, Abc_Obj_t * pSS);
    void Recov(std::vector <ll> & replTrace, bool isVerb = false);
    void PatchFanin(Abc_Obj_t * pObj, ll iFanin, Abc_Obj_t * pFaninOld, Abc_Obj_t * pFaninNew);
    void Trunc(ll truncBit);
    void SetBit(ll iBit, bool useConst1);
    bool CleanUp();
    void CleanUpPro();
    bool ProcHalfAndFullAdd();
    void ProcHalfAndFullAddNew();
    Abc_Obj_t * CreateGate(std::vector <Abc_Obj_t *> && fanins, const std::string & gateName);
    void ReplaceByComplementedObj(ll targId, ll subId);
    void SetConstantInput(Abc_Obj_t * pNode, Abc_Obj_t * pFanin, int fConst0);
    void PropagateConst(ll startId);
    
    void DumpCFile(std::string&& fileName);
    
    inline Abc_Ntk_t * GetNet() const {return pNtk;}
    inline NET_TYPE GetNetType() const {return AbcMan::GetNetType(GetNet());}
    inline ll Check() const {return Abc_NtkDoCheck(GetNet());}
    inline double GetArea() const {return AbcMan::GetArea(GetNet());}
    inline double GetDelay() const {return AbcMan::GetDelay(GetNet());}
    inline void WriteNet(const std::string & fileName, bool isVerb = false) {AbcMan::SetMainNetw(Abc_NtkDup(GetNet())); AbcMan::WriteNet(fileName, isVerb);}
    inline void WriteNet(const std::string && fileName, bool isVerb = false) {AbcMan::SetMainNetw(Abc_NtkDup(GetNet())); AbcMan::WriteNet(fileName, isVerb);}
    inline void PrintStat() {AbcMan::SetMainNetw(Abc_NtkDup(GetNet())); AbcMan::PrintStat();}

    inline void ConvToSop() {Abc_NtkToSop(GetNet(), -1, ABC_INFINITY);}
    inline Abc_Ntk_t* StartSopNet() {pNtk = Abc_NtkAlloc(ABC_NTK_LOGIC, ABC_FUNC_SOP, 1); return pNtk;}

    inline bool IsInTopoOrd() const {auto type = GetNetType(); assert(type == NET_TYPE::AIG || type == NET_TYPE::GATE || type == NET_TYPE::SOP); return Abc_SclCheckNtk(GetNet(), 0);}

    inline ll GetPiNum() const {return Abc_NtkPiNum(GetNet());}
    inline ll GetObjNumMax() const {return Abc_NtkObjNumMax(GetNet());}
    inline ll GetObjNum() const {return Abc_NtkObjNum(GetNet());}
    inline ll GetPoNum() const {return Abc_NtkPoNum(GetNet());}
    inline ll GetNodeNum() const {return Abc_NtkNodeNum(GetNet());}

    inline Abc_Obj_t * GetPi(ll i) const {return Abc_NtkPi(GetNet(), i);}
    inline Abc_Obj_t * GetObj(ll i) const {return Abc_NtkObj(GetNet(), i);}
    inline Abc_Obj_t * GetPo(ll i) const {return Abc_NtkPo(GetNet(), i);}

    inline ll GetIdMaxPlus1() const {return Abc_NtkObjNumMax(GetNet());}
    inline ll GetIdMax() const {return Abc_NtkObjNumMax(GetNet()) - 1;}
    inline ll GetId(Abc_Obj_t * pObj) const {return Abc_ObjId(pObj);}
    inline ll GetPiId(ll i) const {return GetId(GetPi(i));}
    inline ll GetPoId(ll i) const {return GetId(GetPo(i));}

    inline bool IsObj(Abc_Obj_t * pObj) const {return pObj != nullptr;}
    inline bool IsObj(ll id) const {return IsObj(GetObj(id));}
    inline bool IsNode(Abc_Obj_t * pObj) const {return pObj != nullptr && Abc_ObjIsNode(pObj);}
    inline bool IsNode(ll id) const {return IsNode(GetObj(id));}
    inline bool IsObjPi(Abc_Obj_t * pObj) const {return Abc_ObjIsPi(pObj);}
    inline bool IsObjPi(ll id) const {return IsObjPi(GetObj(id));}
    inline bool IsObjPo(Abc_Obj_t * pObj) const {return Abc_ObjIsPo(pObj);}
    inline bool IsObjPo(ll id) const {return IsObjPo(GetObj(id));}
    inline bool IsNonPoObj(Abc_Obj_t * pObj) const {return IsObj(pObj) && !IsObjPo(pObj);}
    inline bool IsNonPoObj(ll id) const {return IsNonPoObj(GetObj(id));}
    inline bool IsConst(Abc_Obj_t * pObj) const {return IsNode(pObj) && Abc_NodeIsConst(pObj);}
    inline bool IsConst(ll id) const {return IsConst(GetObj(id));}
    inline bool IsConst0(Abc_Obj_t * pObj) const {return IsNode(pObj) && Abc_NodeIsConst0(pObj);}
    inline bool IsConst0(ll id) const {return IsConst0(GetObj(id));}
    inline bool IsConst1(Abc_Obj_t * pObj) const {return IsNode(pObj) && Abc_NodeIsConst1(pObj);}
    inline bool IsConst1(ll id) const {return IsConst1(GetObj(id));}
    inline bool IsInv(Abc_Obj_t * pObj) const {return IsNode(pObj) && Abc_NodeIsInv(pObj);}
    inline bool IsInv(ll id) const {return IsInv(GetObj(id));}
    inline bool IsBuffer(Abc_Obj_t * pObj) const {return IsNode(pObj) && Abc_NodeIsBuf(pObj);}
    inline bool IsBuffer(ll id) const {return IsBuffer(GetObj(id));}

    inline ll GetFaninNum(Abc_Obj_t * pObj) const {return Abc_ObjFaninNum(pObj);}
    inline ll GetFaninNum(ll id) const {return GetFaninNum(GetObj(id));}
    inline Abc_Obj_t * GetFanin(Abc_Obj_t * pObj, ll i) const {return Abc_ObjFanin(pObj, i);}
    inline Abc_Obj_t * GetFanin(ll id, ll i) const {return GetFanin(GetObj(id), i);}
    inline ll GetFaninId(Abc_Obj_t * pObj, ll i) const {return GetId(GetFanin(pObj, i));}
    inline ll GetFaninId(ll nodeId, ll i) const {return GetFaninId(GetObj(nodeId), i);}

    inline ll GetFanoutNum(Abc_Obj_t * pObj) const {return Abc_ObjFanoutNum(pObj);}
    inline ll GetFanoutNum(ll id) const {return GetFanoutNum(GetObj(id));}
    inline Abc_Obj_t * GetFanout(Abc_Obj_t * pObj, ll i) const {return Abc_ObjFanout(pObj, i);}
    inline Abc_Obj_t * GetFanout(ll id, ll i) const {return GetFanout(GetObj(id), i);}
    inline ll GetFanoutId(Abc_Obj_t * pObj, ll i) {return GetId(GetFanout(pObj, i));}
    inline ll GetFanoutId(ll id, ll i) {return GetFanoutId(GetObj(id), i);}
    inline std::vector <Abc_Obj_t *> GetFanoutsThatArePos(Abc_Obj_t * pObj) {
        std::vector <Abc_Obj_t *> pos;
        for (ll i = 0; i < GetFanoutNum(pObj); ++i) {
            auto fanout = GetFanout(pObj, i);
            if (IsObjPo(fanout))
                pos.emplace_back(fanout);
        }
        return pos;
    }
    inline std::vector <Abc_Obj_t *> GetFanoutsThatArePos(ll id) {return GetFanoutsThatArePos(GetObj(id));}

    inline std::string GetName(Abc_Obj_t * pObj) const {return std::string(Abc_ObjName(pObj));}
    inline std::string GetName(ll i) const {return GetName(GetObj(i));}
    inline std::string GetPiName(ll i) const {return std::string(Abc_ObjName(GetPi(i)));}
    inline std::string GetPoName(ll i) const {return std::string(Abc_ObjName(GetPo(i)));}
    inline char * GetSOP(Abc_Obj_t * pObj) const {return (char *)(pObj->pData);}
    inline char * GetSOP(ll id) const {return GetSOP(GetObj(id));}

    inline ll GetLev() const {return Abc_NtkLevel(GetNet());}
    inline ll GetObjLev(Abc_Obj_t * pObj) const {
        if (IsObjPo(pObj)) {
            assert(GetFaninNum(pObj) == 1);
            return Abc_ObjLevel(GetFanin(pObj, 0)) + 1;
        }
        else
            return Abc_ObjLevel(pObj);
    }
    inline ll GetObjLev(ll i) const {return Abc_ObjLevel(GetObj(i));}

    inline double GetArrTime(Abc_Obj_t * pNode) const {
        if (static_cast <SC_Lib *> (GetAbcFame()->pLibScl) == nullptr)
            return static_cast <Abc_Time_t *> (pNode->pNtk->pManTime->vArrs->pArray[pNode->Id])->Rise;
        else
            return pNode->dTemp;
    }
    inline double GetArrTime(ll id) const {return GetArrTime(GetObj(id));}
    inline double GetGateDelay(Abc_Obj_t * pNode) const {return Mio_GateReadDelayMax(static_cast <Mio_Gate_t *> (pNode->pData));}
    inline double GetGateDelay(ll id) const {return GetGateDelay(GetObj(id));}
    inline double GetInvDelay() const {return Mio_LibraryReadDelayInvMax(static_cast <Mio_Library_t *> (GetNet()->pManFunc));}
    inline std::string GetGateName(Abc_Obj_t * pNode) const {
        assert(NetMan::GetNetType() == NET_TYPE::GATE);
        if (IsNode(pNode))
            return std::string(Mio_GateReadName(static_cast <Mio_Gate_t *> (pNode->pData)));
        else
            return std::string("");
    }

    inline ll GetNodeMffcSize(ll i) const {return GetNodeMffcSize(GetObj(i));}

    inline void SetNetNotTrav() const {Abc_NtkIncrementTravId(GetNet());}
    inline bool GetObjTrav(Abc_Obj_t * pObj) const {return Abc_NodeIsTravIdCurrent(pObj);}
    inline void SetObjTrav(Abc_Obj_t * pObj) const {Abc_NodeSetTravIdCurrent(pObj);}

    inline void Replace(Abc_Obj_t * pTS, Abc_Obj_t * pSS) {Abc_ObjReplace(pTS, pSS);}
    inline void Replace(ll tsId, ll ssId) {Replace(GetObj(tsId), GetObj(ssId));}
    inline void TransfFanout(Abc_Obj_t * pTS, Abc_Obj_t * pSS) {Abc_ObjTransferFanout(pTS, pSS);}
    inline void TransfFanout(ll tsId, ll ssId) {TransfFanout(GetObj(tsId), GetObj(ssId));}
    inline void DelObj(Abc_Obj_t * pObj) {Abc_NtkDeleteObj(pObj);}
    inline void DelObj(ll id) {DelObj(GetObj(id));}
    inline void DelObjRec(Abc_Obj_t * pObj) {Abc_NtkDeleteObj_rec(pObj, 1);}
    inline void DelObjRec(ll id) {DelObjRec(GetObj(id));}
    inline Abc_Obj_t * CreateInv(Abc_Obj_t * pFanin) {assert(pFanin->pNtk == GetNet()); return Abc_NtkCreateNodeInv(GetNet(), pFanin);}
    inline ll CreateInv(ll faninId) {return GetId(CreateInv(GetObj(faninId)));}

    inline void PrintObj(ll id, bool showFunct = false) const {PrintObj(GetObj(id), showFunct);}
    inline void PrintObjBas(ll id, std::string && endWith = "") const {PrintObjBas(GetObj(id), std::move(endWith));}

    inline bool CheckSCLNet() const {return AbcMan::CheckSCLNet(GetNet());}
};


void GlobStartAbc();
void GlobStopAbc();
void EvalNetw(NetMan & net, const std::string & outpPath, double err,  ll round);


static inline std::ostream & operator << (std::ostream & os, Abc_Obj_t * pObj) {
    assert(pObj != nullptr);
    os << Abc_ObjName(pObj) << "(" << Abc_ObjId(pObj) << ")";
    return os;
}


static inline void RenameAbcObj(Abc_Obj_t* pObj, const std::string& name) {
    auto pNameMan = pObj->pNtk->pManName;
    auto pEntry = Nm_ManTableLookupId(pNameMan, pObj->Id);
    if (pEntry != nullptr)
        Nm_ManDeleteIdName(pNameMan, pObj->Id);
    Abc_ObjAssignName(pObj, const_cast<char*>(name.c_str()), nullptr);
}
