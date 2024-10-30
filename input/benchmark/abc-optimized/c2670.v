// Benchmark "iscas85-original/c2670" written by ABC on Sat Nov 18 15:15:33 2023

module c2670  ( 
    G1, G2, G3, G4, G5, G6, G7, G8, G9, G10, G11, G12, G13, G14, G15, G16,
    G17, G18, G19, G20, G21, G22, G23, G24, G25, G26, G27, G28, G29, G30,
    G31, G32, G33, G34, G35, G36, G37, G38, G39, G40, G41, G42, G43, G44,
    G45, G46, G47, G48, G49, G50, G51, G52, G53, G54, G55, G56, G57, G58,
    G59, G60, G61, G62, G63, G64, G65, G66, G67, G68, G69, G70, G71, G72,
    G73, G74, G75, G76, G77, G78, G79, G80, G81, G82, G83, G84, G85, G86,
    G87, G88, G89, G90, G91, G92, G93, G94, G95, G96, G97, G98, G99, G100,
    G101, G102, G103, G104, G105, G106, G107, G108, G109, G110, G111, G112,
    G113, G114, G115, G116, G117, G118, G119, G120, G121, G122, G123, G124,
    G125, G126, G127, G128, G129, G130, G131, G132, G133, G134, G135, G136,
    G137, G138, G139, G140, G141, G142, G143, G144, G145, G146, G147, G148,
    G149, G150, G151, G152, G153, G154, G155, G156, G157,
    G2531, G2532, G2533, G2534, G2535, G2536, G2537, G2538, G2539, G2540,
    G2541, G2542, G2543, G2544, G2545, G2546, G2547, G2548, G2549, G2550,
    G2551, G2552, G2553, G2554, G2555, G2556, G2557, G2558, G2559, G2560,
    G2561, G2562, G2563, G2564, G2565, G2566, G2567, G2568, G2569, G2570,
    G2571, G2572, G2573, G2574, G2575, G2576, G2577, G2578, G2579, G2580,
    G2581, G2582, G2583, G2584, G2585, G2586, G2587, G2588, G2589, G2590,
    G2591, G2592, G2593, G2594  );
  input  G1, G2, G3, G4, G5, G6, G7, G8, G9, G10, G11, G12, G13, G14,
    G15, G16, G17, G18, G19, G20, G21, G22, G23, G24, G25, G26, G27, G28,
    G29, G30, G31, G32, G33, G34, G35, G36, G37, G38, G39, G40, G41, G42,
    G43, G44, G45, G46, G47, G48, G49, G50, G51, G52, G53, G54, G55, G56,
    G57, G58, G59, G60, G61, G62, G63, G64, G65, G66, G67, G68, G69, G70,
    G71, G72, G73, G74, G75, G76, G77, G78, G79, G80, G81, G82, G83, G84,
    G85, G86, G87, G88, G89, G90, G91, G92, G93, G94, G95, G96, G97, G98,
    G99, G100, G101, G102, G103, G104, G105, G106, G107, G108, G109, G110,
    G111, G112, G113, G114, G115, G116, G117, G118, G119, G120, G121, G122,
    G123, G124, G125, G126, G127, G128, G129, G130, G131, G132, G133, G134,
    G135, G136, G137, G138, G139, G140, G141, G142, G143, G144, G145, G146,
    G147, G148, G149, G150, G151, G152, G153, G154, G155, G156, G157;
  output G2531, G2532, G2533, G2534, G2535, G2536, G2537, G2538, G2539, G2540,
    G2541, G2542, G2543, G2544, G2545, G2546, G2547, G2548, G2549, G2550,
    G2551, G2552, G2553, G2554, G2555, G2556, G2557, G2558, G2559, G2560,
    G2561, G2562, G2563, G2564, G2565, G2566, G2567, G2568, G2569, G2570,
    G2571, G2572, G2573, G2574, G2575, G2576, G2577, G2578, G2579, G2580,
    G2581, G2582, G2583, G2584, G2585, G2586, G2587, G2588, G2589, G2590,
    G2591, G2592, G2593, G2594;
  wire new_n245, new_n246, new_n249, new_n250, new_n252, new_n253, new_n254,
    new_n255, new_n256, new_n257, new_n258, new_n259, new_n260, new_n261,
    new_n263, new_n264, new_n265, new_n266, new_n268, new_n269, new_n270,
    new_n271, new_n273, new_n274, new_n275, new_n276, new_n279, new_n280,
    new_n283, new_n284, new_n287, new_n288, new_n289, new_n290, new_n292,
    new_n293, new_n295, new_n296, new_n298, new_n299, new_n301, new_n302,
    new_n304, new_n305, new_n307, new_n308, new_n310, new_n311, new_n312,
    new_n313, new_n316, new_n319, new_n320, new_n322, new_n325, new_n326,
    new_n327, new_n328, new_n329, new_n330, new_n331, new_n333, new_n334,
    new_n335, new_n336, new_n337, new_n338, new_n339, new_n340, new_n341,
    new_n342, new_n343, new_n345, new_n346, new_n347, new_n348, new_n349,
    new_n350, new_n351, new_n352, new_n353, new_n354, new_n355, new_n357,
    new_n358, new_n359, new_n360, new_n361, new_n362, new_n363, new_n364,
    new_n365, new_n366, new_n367, new_n368, new_n369, new_n370, new_n371,
    new_n373, new_n374, new_n375, new_n376, new_n377, new_n378, new_n379,
    new_n380, new_n381, new_n382, new_n383, new_n384, new_n385, new_n386,
    new_n387, new_n388, new_n389, new_n390, new_n391, new_n392, new_n393,
    new_n394, new_n395, new_n396, new_n397, new_n398, new_n399, new_n400,
    new_n401, new_n402, new_n403, new_n404, new_n405, new_n406, new_n407,
    new_n408, new_n409, new_n410, new_n411, new_n412, new_n413, new_n414,
    new_n415, new_n416, new_n417, new_n418, new_n419, new_n420, new_n421,
    new_n422, new_n423, new_n424, new_n425, new_n426, new_n427, new_n428,
    new_n429, new_n430, new_n431, new_n432, new_n433, new_n434, new_n435,
    new_n436, new_n437, new_n438, new_n441, new_n442, new_n443, new_n444,
    new_n445, new_n446, new_n448, new_n449, new_n450, new_n451, new_n452,
    new_n453, new_n454, new_n455, new_n456, new_n457, new_n458, new_n459,
    new_n460, new_n461, new_n462, new_n463, new_n465, new_n466, new_n467,
    new_n468, new_n469, new_n470, new_n471, new_n472, new_n473, new_n474,
    new_n477, new_n478, new_n479, new_n481, new_n482, new_n483, new_n484,
    new_n485, new_n486, new_n487, new_n488, new_n489, new_n490, new_n491,
    new_n492, new_n493, new_n494, new_n495, new_n496, new_n497, new_n498,
    new_n499, new_n500, new_n501, new_n502, new_n503, new_n504, new_n505,
    new_n506, new_n507, new_n508, new_n509, new_n510, new_n511, new_n512,
    new_n513, new_n514, new_n515, new_n516, new_n519;
  INV_X1    g000(.A(G115), .ZN(G2531));
  BUF_X1    g001(.A(G2531), .Z(G2532));
  BUF_X1    g002(.A(G2531), .Z(G2533));
  INV_X1    g003(.A(G124), .ZN(G2534));
  BUF_X1    g004(.A(G2534), .Z(G2535));
  INV_X1    g005(.A(G137), .ZN(G2536));
  BUF_X1    g006(.A(G2536), .Z(G2537));
  BUF_X1    g007(.A(G2536), .Z(G2538));
  INV_X1    g008(.A(G32), .ZN(G2539));
  INV_X1    g009(.A(G106), .ZN(G2540));
  INV_X1    g010(.A(G64), .ZN(G2541));
  INV_X1    g011(.A(G76), .ZN(G2542));
  INV_X1    g012(.A(G53), .ZN(G2543));
  INV_X1    g013(.A(G96), .ZN(G2544));
  INV_X1    g014(.A(G43), .ZN(G2545));
  INV_X1    g015(.A(G86), .ZN(G2546));
  NAND4_X1  g016(.A1(G139), .A2(G140), .A3(G141), .A4(G142), .ZN(G2547));
  NAND3_X1  g017(.A1(G2), .A2(G11), .A3(G121), .ZN(G2548));
  BUF_X1    g018(.A(G115), .Z(G2549));
  AND2_X1   g019(.A1(G74), .A2(G2531), .ZN(G2550));
  NAND2_X1  g020(.A1(G7), .A2(G121), .ZN(G2551));
  NAND3_X1  g021(.A1(G7), .A2(G121), .A3(G119), .ZN(G2552));
  NAND3_X1  g022(.A1(G7), .A2(G121), .A3(G147), .ZN(G2553));
  NOR4_X1   g023(.A1(G2545), .A2(G2543), .A3(G2546), .A4(G2544), .ZN(new_n245));
  NOR4_X1   g024(.A1(G2539), .A2(G2541), .A3(G2542), .A4(G2540), .ZN(new_n246));
  NAND2_X1  g025(.A1(new_n245), .A2(new_n246), .ZN(G2554));
  BUF_X1    g026(.A(G2554), .Z(G2555));
  INV_X1    g027(.A(G147), .ZN(new_n249));
  INV_X1    g028(.A(G119), .ZN(new_n250));
  OAI22_X1  g029(.A1(new_n249), .A2(new_n246), .B1(new_n250), .B2(new_n245), .ZN(G2556));
  INV_X1    g030(.A(G145), .ZN(new_n252));
  INV_X1    g031(.A(G146), .ZN(new_n253));
  NOR2_X1   g032(.A1(new_n252), .A2(new_n253), .ZN(new_n254));
  NOR2_X1   g033(.A1(G145), .A2(new_n253), .ZN(new_n255));
  AOI22_X1  g034(.A1(G109), .A2(new_n254), .B1(G79), .B2(new_n255), .ZN(new_n256));
  INV_X1    g035(.A(G89), .ZN(new_n257));
  NAND2_X1  g036(.A1(new_n252), .A2(new_n253), .ZN(new_n258));
  INV_X1    g037(.A(G99), .ZN(new_n259));
  NAND2_X1  g038(.A1(G145), .A2(new_n253), .ZN(new_n260));
  OAI221_X1 g039(.A(new_n256), .B1(new_n257), .B2(new_n258), .C1(new_n259), .C2(new_n260), .ZN(new_n261));
  INV_X1    g040(.A(new_n261), .ZN(G2557));
  AOI22_X1  g041(.A1(G108), .A2(new_n254), .B1(G78), .B2(new_n255), .ZN(new_n263));
  INV_X1    g042(.A(G88), .ZN(new_n264));
  INV_X1    g043(.A(G98), .ZN(new_n265));
  OAI221_X1 g044(.A(new_n263), .B1(new_n264), .B2(new_n258), .C1(new_n265), .C2(new_n260), .ZN(new_n266));
  INV_X1    g045(.A(new_n266), .ZN(G2558));
  AOI22_X1  g046(.A1(G110), .A2(new_n254), .B1(G80), .B2(new_n255), .ZN(new_n268));
  INV_X1    g047(.A(G90), .ZN(new_n269));
  INV_X1    g048(.A(G100), .ZN(new_n270));
  OAI221_X1 g049(.A(new_n268), .B1(new_n269), .B2(new_n258), .C1(new_n270), .C2(new_n260), .ZN(new_n271));
  INV_X1    g050(.A(new_n271), .ZN(G2559));
  INV_X1    g051(.A(G120), .ZN(new_n273));
  INV_X1    g052(.A(G117), .ZN(new_n274));
  AOI221_X1 g053(.A(new_n273), .B1(G36), .B2(new_n274), .C1(G68), .C2(G117), .ZN(new_n275));
  AOI221_X1 g054(.A(G120), .B1(G57), .B2(new_n274), .C1(G46), .C2(G117), .ZN(new_n276));
  NOR2_X1   g055(.A1(new_n275), .A2(new_n276), .ZN(G2569));
  INV_X1    g056(.A(G2569), .ZN(G2560));
  AOI221_X1 g057(.A(new_n273), .B1(G37), .B2(new_n274), .C1(G69), .C2(G117), .ZN(new_n279));
  AOI221_X1 g058(.A(G120), .B1(G58), .B2(new_n274), .C1(G47), .C2(G117), .ZN(new_n280));
  NOR2_X1   g059(.A1(new_n279), .A2(new_n280), .ZN(G2568));
  INV_X1    g060(.A(G2568), .ZN(G2561));
  AOI221_X1 g061(.A(new_n273), .B1(G38), .B2(new_n274), .C1(G70), .C2(G117), .ZN(new_n283));
  AOI221_X1 g062(.A(G120), .B1(G59), .B2(new_n274), .C1(G48), .C2(G117), .ZN(new_n284));
  NOR2_X1   g063(.A1(new_n283), .A2(new_n284), .ZN(G2567));
  INV_X1    g064(.A(G2567), .ZN(G2562));
  AOI221_X1 g065(.A(new_n273), .B1(G31), .B2(new_n274), .C1(G63), .C2(G117), .ZN(new_n287));
  AOI221_X1 g066(.A(G120), .B1(G52), .B2(new_n274), .C1(G42), .C2(G117), .ZN(new_n288));
  NOR2_X1   g067(.A1(new_n287), .A2(new_n288), .ZN(new_n289));
  INV_X1    g068(.A(new_n289), .ZN(new_n290));
  NAND2_X1  g069(.A1(G122), .A2(new_n290), .ZN(G2563));
  INV_X1    g070(.A(G116), .ZN(new_n292));
  NOR3_X1   g071(.A1(new_n292), .A2(G121), .A3(G2556), .ZN(new_n293));
  NAND2_X1  g072(.A1(G28), .A2(new_n293), .ZN(G2564));
  INV_X1    g073(.A(G1), .ZN(new_n295));
  INV_X1    g074(.A(G3), .ZN(new_n296));
  OAI21_X1  g075(.A(new_n293), .B1(new_n295), .B2(new_n296), .ZN(G2565));
  AOI221_X1 g076(.A(new_n273), .B1(G39), .B2(new_n274), .C1(G71), .C2(G117), .ZN(new_n298));
  AOI221_X1 g077(.A(G120), .B1(G60), .B2(new_n274), .C1(G49), .C2(G117), .ZN(new_n299));
  NOR2_X1   g078(.A1(new_n298), .A2(new_n299), .ZN(G2566));
  AOI221_X1 g079(.A(new_n273), .B1(G35), .B2(new_n274), .C1(G67), .C2(G117), .ZN(new_n301));
  NOR2_X1   g080(.A1(G56), .A2(G117), .ZN(new_n302));
  AOI21_X1  g081(.A(new_n301), .B1(new_n273), .B2(new_n302), .ZN(G2570));
  AOI221_X1 g082(.A(new_n273), .B1(G34), .B2(new_n274), .C1(G66), .C2(G117), .ZN(new_n304));
  AOI221_X1 g083(.A(G120), .B1(G55), .B2(new_n274), .C1(G45), .C2(G117), .ZN(new_n305));
  NOR2_X1   g084(.A1(new_n304), .A2(new_n305), .ZN(G2571));
  AOI221_X1 g085(.A(new_n273), .B1(G33), .B2(new_n274), .C1(G65), .C2(G117), .ZN(new_n307));
  AOI221_X1 g086(.A(G120), .B1(G54), .B2(new_n274), .C1(G44), .C2(G117), .ZN(new_n308));
  NOR2_X1   g087(.A1(new_n307), .A2(new_n308), .ZN(G2572));
  AOI221_X1 g088(.A(new_n273), .B1(G40), .B2(new_n274), .C1(G72), .C2(G117), .ZN(new_n310));
  AOI221_X1 g089(.A(G120), .B1(G61), .B2(new_n274), .C1(G50), .C2(G117), .ZN(new_n311));
  NOR2_X1   g090(.A1(new_n310), .A2(new_n311), .ZN(new_n312));
  INV_X1    g091(.A(G123), .ZN(new_n313));
  OAI22_X1  g092(.A1(G123), .A2(new_n312), .B1(new_n313), .B2(G2562), .ZN(G2573));
  BUF_X1    g093(.A(G2573), .Z(G2574));
  INV_X1    g094(.A(G2566), .ZN(new_n316));
  OAI22_X1  g095(.A1(new_n313), .A2(G2568), .B1(G123), .B2(new_n316), .ZN(G2575));
  BUF_X1    g096(.A(G2575), .Z(G2576));
  NOR2_X1   g097(.A1(G118), .A2(new_n312), .ZN(new_n319));
  INV_X1    g098(.A(new_n312), .ZN(new_n320));
  AOI21_X1  g099(.A(new_n319), .B1(G122), .B2(new_n320), .ZN(G2577));
  INV_X1    g100(.A(new_n319), .ZN(new_n322));
  AOI22_X1  g101(.A1(G123), .A2(new_n322), .B1(new_n313), .B2(new_n289), .ZN(G2578));
  BUF_X1    g102(.A(G2578), .Z(G2579));
  INV_X1    g103(.A(G144), .ZN(new_n325));
  INV_X1    g104(.A(G143), .ZN(new_n326));
  AOI22_X1  g105(.A1(G107), .A2(new_n254), .B1(G77), .B2(new_n255), .ZN(new_n327));
  INV_X1    g106(.A(G87), .ZN(new_n328));
  INV_X1    g107(.A(G97), .ZN(new_n329));
  OAI221_X1 g108(.A(new_n327), .B1(new_n328), .B2(new_n258), .C1(new_n329), .C2(new_n260), .ZN(new_n330));
  INV_X1    g109(.A(new_n330), .ZN(new_n331));
  OAI221_X1 g110(.A(new_n325), .B1(new_n326), .B2(new_n331), .C1(G143), .C2(new_n330), .ZN(G2580));
  XNOR2_X1  g111(.A(G154), .B(G155), .ZN(new_n333));
  XOR2_X1   g112(.A(G150), .B(G151), .Z(new_n334));
  XOR2_X1   g113(.A(new_n333), .B(new_n334), .Z(new_n335));
  XOR2_X1   g114(.A(G152), .B(G153), .Z(new_n336));
  XOR2_X1   g115(.A(G148), .B(G149), .Z(new_n337));
  INV_X1    g116(.A(G125), .ZN(new_n338));
  INV_X1    g117(.A(G126), .ZN(new_n339));
  AOI22_X1  g118(.A1(new_n338), .A2(new_n339), .B1(G125), .B2(G126), .ZN(new_n340));
  XNOR2_X1  g119(.A(new_n337), .B(new_n340), .ZN(new_n341));
  XOR2_X1   g120(.A(new_n336), .B(new_n341), .Z(new_n342));
  NAND2_X1  g121(.A1(new_n335), .A2(new_n342), .ZN(new_n343));
  OAI211_X1 g122(.A(G10), .B(new_n343), .C1(new_n335), .C2(new_n342), .ZN(G2581));
  INV_X1    g123(.A(G138), .ZN(new_n345));
  XNOR2_X1  g124(.A(new_n345), .B(G157), .ZN(new_n346));
  INV_X1    g125(.A(G141), .ZN(new_n347));
  INV_X1    g126(.A(G142), .ZN(new_n348));
  OAI22_X1  g127(.A1(new_n347), .A2(new_n348), .B1(G141), .B2(G142), .ZN(new_n349));
  INV_X1    g128(.A(G139), .ZN(new_n350));
  INV_X1    g129(.A(G140), .ZN(new_n351));
  AOI22_X1  g130(.A1(G139), .A2(G140), .B1(new_n350), .B2(new_n351), .ZN(new_n352));
  XNOR2_X1  g131(.A(new_n349), .B(new_n352), .ZN(new_n353));
  AOI22_X1  g132(.A1(new_n326), .A2(new_n325), .B1(G143), .B2(G144), .ZN(new_n354));
  XNOR2_X1  g133(.A(new_n353), .B(new_n354), .ZN(new_n355));
  XOR2_X1   g134(.A(new_n346), .B(new_n355), .Z(G2582));
  INV_X1    g135(.A(G135), .ZN(new_n357));
  INV_X1    g136(.A(G136), .ZN(new_n358));
  OAI22_X1  g137(.A1(new_n357), .A2(G136), .B1(G135), .B2(new_n358), .ZN(new_n359));
  XNOR2_X1  g138(.A(G132), .B(new_n359), .ZN(new_n360));
  INV_X1    g139(.A(G131), .ZN(new_n361));
  INV_X1    g140(.A(G133), .ZN(new_n362));
  INV_X1    g141(.A(G134), .ZN(new_n363));
  OAI22_X1  g142(.A1(G133), .A2(G134), .B1(new_n362), .B2(new_n363), .ZN(new_n364));
  XOR2_X1   g143(.A(new_n361), .B(new_n364), .Z(new_n365));
  XNOR2_X1  g144(.A(new_n360), .B(new_n365), .ZN(new_n366));
  XNOR2_X1  g145(.A(G128), .B(G156), .ZN(new_n367));
  INV_X1    g146(.A(G130), .ZN(new_n368));
  INV_X1    g147(.A(G129), .ZN(new_n369));
  AOI22_X1  g148(.A1(G129), .A2(new_n368), .B1(new_n369), .B2(G130), .ZN(new_n370));
  XNOR2_X1  g149(.A(new_n367), .B(new_n370), .ZN(new_n371));
  XOR2_X1   g150(.A(new_n366), .B(new_n371), .Z(G2583));
  INV_X1    g151(.A(G23), .ZN(new_n373));
  AOI22_X1  g152(.A1(G105), .A2(new_n254), .B1(G75), .B2(new_n255), .ZN(new_n374));
  INV_X1    g153(.A(G85), .ZN(new_n375));
  INV_X1    g154(.A(G95), .ZN(new_n376));
  OAI221_X1 g155(.A(new_n374), .B1(new_n375), .B2(new_n258), .C1(new_n376), .C2(new_n260), .ZN(new_n377));
  AOI22_X1  g156(.A1(G19), .A2(G23), .B1(new_n373), .B2(new_n377), .ZN(new_n378));
  NOR2_X1   g157(.A1(G135), .A2(new_n378), .ZN(new_n379));
  INV_X1    g158(.A(G25), .ZN(new_n380));
  INV_X1    g159(.A(G91), .ZN(new_n381));
  INV_X1    g160(.A(G101), .ZN(new_n382));
  OAI22_X1  g161(.A1(new_n381), .A2(new_n258), .B1(new_n382), .B2(new_n260), .ZN(new_n383));
  AOI221_X1 g162(.A(new_n383), .B1(G111), .B2(new_n254), .C1(G81), .C2(new_n255), .ZN(new_n384));
  OAI22_X1  g163(.A1(new_n373), .A2(new_n380), .B1(G23), .B2(new_n384), .ZN(new_n385));
  INV_X1    g164(.A(G12), .ZN(new_n386));
  OAI22_X1  g165(.A1(G4), .A2(new_n386), .B1(G12), .B2(new_n312), .ZN(new_n387));
  AOI221_X1 g166(.A(new_n379), .B1(new_n350), .B2(new_n385), .C1(G126), .C2(new_n387), .ZN(new_n388));
  INV_X1    g167(.A(G5), .ZN(new_n389));
  OAI22_X1  g168(.A1(new_n389), .A2(new_n386), .B1(G12), .B2(G2562), .ZN(new_n390));
  OAI22_X1  g169(.A1(new_n373), .A2(G27), .B1(G23), .B2(new_n266), .ZN(new_n391));
  INV_X1    g170(.A(new_n391), .ZN(new_n392));
  AOI22_X1  g171(.A1(new_n369), .A2(new_n390), .B1(new_n348), .B2(new_n392), .ZN(new_n393));
  OAI22_X1  g172(.A1(new_n386), .A2(G15), .B1(G12), .B2(G2568), .ZN(new_n394));
  INV_X1    g173(.A(new_n394), .ZN(new_n395));
  AOI22_X1  g174(.A1(G113), .A2(new_n254), .B1(G83), .B2(new_n255), .ZN(new_n396));
  INV_X1    g175(.A(G93), .ZN(new_n397));
  INV_X1    g176(.A(G103), .ZN(new_n398));
  OAI221_X1 g177(.A(new_n396), .B1(new_n397), .B2(new_n258), .C1(new_n398), .C2(new_n260), .ZN(new_n399));
  OAI22_X1  g178(.A1(new_n373), .A2(G24), .B1(G23), .B2(new_n399), .ZN(new_n400));
  OAI221_X1 g179(.A(new_n393), .B1(new_n368), .B2(new_n395), .C1(G136), .C2(new_n400), .ZN(new_n401));
  AOI22_X1  g180(.A1(G112), .A2(new_n254), .B1(G82), .B2(new_n255), .ZN(new_n402));
  INV_X1    g181(.A(G92), .ZN(new_n403));
  INV_X1    g182(.A(G102), .ZN(new_n404));
  OAI221_X1 g183(.A(new_n402), .B1(new_n403), .B2(new_n258), .C1(new_n404), .C2(new_n260), .ZN(new_n405));
  OAI22_X1  g184(.A1(G20), .A2(new_n373), .B1(G23), .B2(new_n405), .ZN(new_n406));
  OAI22_X1  g185(.A1(new_n386), .A2(G18), .B1(G12), .B2(G2572), .ZN(new_n407));
  AOI22_X1  g186(.A1(G138), .A2(new_n406), .B1(G134), .B2(new_n407), .ZN(new_n408));
  OAI22_X1  g187(.A1(new_n386), .A2(G14), .B1(G12), .B2(G2566), .ZN(new_n409));
  AOI22_X1  g188(.A1(G21), .A2(G23), .B1(new_n373), .B2(new_n271), .ZN(new_n410));
  OAI221_X1 g189(.A(new_n408), .B1(G128), .B2(new_n409), .C1(G140), .C2(new_n410), .ZN(new_n411));
  NOR2_X1   g190(.A1(new_n401), .A2(new_n411), .ZN(new_n412));
  OAI22_X1  g191(.A1(new_n350), .A2(new_n385), .B1(G138), .B2(new_n406), .ZN(new_n413));
  OAI22_X1  g192(.A1(G6), .A2(new_n386), .B1(G12), .B2(G2571), .ZN(new_n414));
  OAI22_X1  g193(.A1(G133), .A2(new_n414), .B1(G134), .B2(new_n407), .ZN(new_n415));
  OAI21_X1  g194(.A(G9), .B1(G22), .B2(new_n373), .ZN(new_n416));
  AOI21_X1  g195(.A(new_n416), .B1(new_n373), .B2(new_n331), .ZN(new_n417));
  OAI22_X1  g196(.A1(new_n373), .A2(G26), .B1(G23), .B2(new_n261), .ZN(new_n418));
  OAI21_X1  g197(.A(new_n417), .B1(G141), .B2(new_n418), .ZN(new_n419));
  AOI22_X1  g198(.A1(G135), .A2(new_n378), .B1(G142), .B2(new_n391), .ZN(new_n420));
  INV_X1    g199(.A(G13), .ZN(new_n421));
  OAI22_X1  g200(.A1(new_n386), .A2(new_n421), .B1(G12), .B2(new_n290), .ZN(new_n422));
  OAI221_X1 g201(.A(new_n420), .B1(G126), .B2(new_n387), .C1(new_n338), .C2(new_n422), .ZN(new_n423));
  INV_X1    g202(.A(G132), .ZN(new_n424));
  OAI22_X1  g203(.A1(new_n386), .A2(G17), .B1(G12), .B2(G2570), .ZN(new_n425));
  INV_X1    g204(.A(new_n425), .ZN(new_n426));
  AOI22_X1  g205(.A1(new_n424), .A2(new_n426), .B1(new_n338), .B2(new_n422), .ZN(new_n427));
  INV_X1    g206(.A(new_n400), .ZN(new_n428));
  OAI221_X1 g207(.A(new_n427), .B1(new_n358), .B2(new_n428), .C1(new_n369), .C2(new_n390), .ZN(new_n429));
  AOI22_X1  g208(.A1(G141), .A2(new_n418), .B1(G128), .B2(new_n409), .ZN(new_n430));
  INV_X1    g209(.A(new_n414), .ZN(new_n431));
  OAI221_X1 g210(.A(new_n430), .B1(new_n424), .B2(new_n426), .C1(new_n362), .C2(new_n431), .ZN(new_n432));
  OAI22_X1  g211(.A1(new_n386), .A2(G16), .B1(G12), .B2(G2569), .ZN(new_n433));
  XOR2_X1   g212(.A(G131), .B(new_n433), .Z(new_n434));
  INV_X1    g213(.A(new_n410), .ZN(new_n435));
  OAI221_X1 g214(.A(new_n434), .B1(G130), .B2(new_n394), .C1(new_n351), .C2(new_n435), .ZN(new_n436));
  OR4_X1    g215(.A1(new_n423), .A2(new_n429), .A3(new_n432), .A4(new_n436), .ZN(new_n437));
  NOR4_X1   g216(.A1(new_n413), .A2(new_n415), .A3(new_n419), .A4(new_n437), .ZN(new_n438));
  NAND3_X1  g217(.A1(new_n388), .A2(new_n412), .A3(new_n438), .ZN(G2584));
  BUF_X1    g218(.A(G2584), .Z(G2585));
  AOI21_X1  g219(.A(G122), .B1(G118), .B2(new_n320), .ZN(new_n441));
  AOI21_X1  g220(.A(new_n441), .B1(G122), .B2(new_n290), .ZN(new_n442));
  AOI221_X1 g221(.A(new_n273), .B1(G41), .B2(new_n274), .C1(G73), .C2(G117), .ZN(new_n443));
  AOI221_X1 g222(.A(G120), .B1(G62), .B2(new_n274), .C1(G51), .C2(G117), .ZN(new_n444));
  NOR2_X1   g223(.A1(new_n443), .A2(new_n444), .ZN(new_n445));
  XOR2_X1   g224(.A(new_n289), .B(new_n445), .Z(new_n446));
  XOR2_X1   g225(.A(new_n442), .B(new_n446), .Z(G2586));
  INV_X1    g226(.A(G29), .ZN(new_n448));
  OAI22_X1  g227(.A1(new_n261), .A2(G2558), .B1(G2557), .B2(new_n266), .ZN(new_n449));
  XNOR2_X1  g228(.A(new_n330), .B(new_n449), .ZN(new_n450));
  INV_X1    g229(.A(new_n405), .ZN(new_n451));
  INV_X1    g230(.A(new_n399), .ZN(new_n452));
  OAI22_X1  g231(.A1(new_n399), .A2(new_n451), .B1(new_n452), .B2(new_n405), .ZN(new_n453));
  INV_X1    g232(.A(new_n377), .ZN(new_n454));
  XNOR2_X1  g233(.A(new_n454), .B(new_n384), .ZN(new_n455));
  INV_X1    g234(.A(G94), .ZN(new_n456));
  INV_X1    g235(.A(G104), .ZN(new_n457));
  OAI22_X1  g236(.A1(new_n456), .A2(new_n258), .B1(new_n457), .B2(new_n260), .ZN(new_n458));
  AOI221_X1 g237(.A(new_n458), .B1(G114), .B2(new_n254), .C1(G84), .C2(new_n255), .ZN(new_n459));
  XOR2_X1   g238(.A(new_n271), .B(new_n459), .Z(new_n460));
  XNOR2_X1  g239(.A(new_n455), .B(new_n460), .ZN(new_n461));
  XOR2_X1   g240(.A(new_n453), .B(new_n461), .Z(new_n462));
  NAND2_X1  g241(.A1(new_n450), .A2(new_n462), .ZN(new_n463));
  OAI211_X1 g242(.A(new_n448), .B(new_n463), .C1(new_n450), .C2(new_n462), .ZN(G2587));
  NAND2_X1  g243(.A1(G2570), .A2(G2571), .ZN(new_n465));
  OAI21_X1  g244(.A(new_n465), .B1(G2570), .B2(G2571), .ZN(new_n466));
  INV_X1    g245(.A(G2572), .ZN(new_n467));
  OAI22_X1  g246(.A1(G2560), .A2(G2572), .B1(G2569), .B2(new_n467), .ZN(new_n468));
  XNOR2_X1  g247(.A(new_n466), .B(new_n468), .ZN(new_n469));
  XOR2_X1   g248(.A(new_n316), .B(new_n446), .Z(new_n470));
  XNOR2_X1  g249(.A(new_n312), .B(new_n470), .ZN(new_n471));
  OAI22_X1  g250(.A1(new_n322), .A2(new_n470), .B1(new_n319), .B2(new_n471), .ZN(new_n472));
  XOR2_X1   g251(.A(new_n469), .B(new_n472), .Z(new_n473));
  OAI22_X1  g252(.A1(new_n313), .A2(new_n473), .B1(G123), .B2(new_n445), .ZN(new_n474));
  INV_X1    g253(.A(new_n474), .ZN(G2588));
  BUF_X1    g254(.A(G2588), .Z(G2589));
  OAI22_X1  g255(.A1(G2561), .A2(G2567), .B1(G2568), .B2(G2562), .ZN(new_n477));
  XOR2_X1   g256(.A(new_n471), .B(new_n477), .Z(new_n478));
  NAND2_X1  g257(.A1(new_n469), .A2(new_n478), .ZN(new_n479));
  OAI211_X1 g258(.A(new_n448), .B(new_n479), .C1(new_n469), .C2(new_n478), .ZN(G2590));
  NAND2_X1  g259(.A1(G132), .A2(G133), .ZN(new_n481));
  INV_X1    g260(.A(G30), .ZN(new_n482));
  NOR4_X1   g261(.A1(G127), .A2(G2559), .A3(new_n482), .A4(new_n261), .ZN(new_n483));
  INV_X1    g262(.A(new_n483), .ZN(new_n484));
  NAND3_X1  g263(.A1(G8), .A2(new_n481), .A3(new_n484), .ZN(new_n485));
  OAI221_X1 g264(.A(G8), .B1(new_n465), .B2(new_n484), .C1(new_n483), .C2(new_n481), .ZN(new_n486));
  INV_X1    g265(.A(new_n486), .ZN(new_n487));
  OAI22_X1  g266(.A1(new_n368), .A2(new_n483), .B1(new_n347), .B2(new_n484), .ZN(new_n488));
  AND3_X1   g267(.A1(G8), .A2(G2561), .A3(new_n488), .ZN(new_n489));
  AOI22_X1  g268(.A1(G129), .A2(new_n484), .B1(G140), .B2(new_n483), .ZN(new_n490));
  NOR2_X1   g269(.A1(G2567), .A2(new_n490), .ZN(new_n491));
  OAI221_X1 g270(.A(new_n290), .B1(new_n358), .B2(new_n484), .C1(new_n338), .C2(new_n483), .ZN(new_n492));
  OAI22_X1  g271(.A1(new_n339), .A2(new_n483), .B1(new_n345), .B2(new_n484), .ZN(new_n493));
  OAI21_X1  g272(.A(new_n492), .B1(new_n312), .B2(new_n493), .ZN(new_n494));
  AOI22_X1  g273(.A1(G128), .A2(new_n484), .B1(G139), .B2(new_n483), .ZN(new_n495));
  INV_X1    g274(.A(new_n493), .ZN(new_n496));
  OAI221_X1 g275(.A(new_n494), .B1(G2566), .B2(new_n495), .C1(new_n320), .C2(new_n496), .ZN(new_n497));
  INV_X1    g276(.A(new_n497), .ZN(new_n498));
  AOI221_X1 g277(.A(new_n498), .B1(G2566), .B2(new_n495), .C1(G2567), .C2(new_n490), .ZN(new_n499));
  INV_X1    g278(.A(G8), .ZN(new_n500));
  OAI33_X1  g279(.A1(new_n489), .A2(new_n491), .A3(new_n499), .B1(new_n500), .B2(G2561), .B3(new_n488), .ZN(new_n501));
  OAI22_X1  g280(.A1(new_n361), .A2(new_n483), .B1(new_n348), .B2(new_n484), .ZN(new_n502));
  NAND3_X1  g281(.A1(G8), .A2(G2560), .A3(new_n502), .ZN(new_n503));
  INV_X1    g282(.A(new_n502), .ZN(new_n504));
  NOR2_X1   g283(.A1(new_n500), .A2(G2560), .ZN(new_n505));
  AOI22_X1  g284(.A1(new_n501), .A2(new_n503), .B1(new_n504), .B2(new_n505), .ZN(new_n506));
  OAI21_X1  g285(.A(new_n485), .B1(new_n487), .B2(new_n506), .ZN(new_n507));
  OAI211_X1 g286(.A(G30), .B(G2557), .C1(G127), .C2(G2559), .ZN(new_n508));
  OAI22_X1  g287(.A1(new_n357), .A2(new_n454), .B1(new_n358), .B2(new_n452), .ZN(new_n509));
  OAI222_X1 g288(.A1(G134), .A2(new_n467), .B1(new_n345), .B2(new_n405), .C1(new_n363), .C2(G2572), .ZN(new_n510));
  AOI22_X1  g289(.A1(new_n363), .A2(G2572), .B1(new_n357), .B2(new_n454), .ZN(new_n511));
  OAI222_X1 g290(.A1(G138), .A2(new_n451), .B1(G136), .B2(new_n399), .C1(new_n509), .C2(new_n511), .ZN(new_n512));
  NOR3_X1   g291(.A1(new_n509), .A2(new_n510), .A3(new_n512), .ZN(new_n513));
  OAI21_X1  g292(.A(new_n507), .B1(new_n508), .B2(new_n513), .ZN(new_n514));
  INV_X1    g293(.A(new_n514), .ZN(new_n515));
  AOI21_X1  g294(.A(new_n508), .B1(G138), .B2(new_n451), .ZN(new_n516));
  AOI21_X1  g295(.A(new_n515), .B1(new_n512), .B2(new_n516), .ZN(G2591));
  assign    G2592 = 1'b0;
  NOR3_X1   g296(.A1(G2556), .A2(G2582), .A3(G2583), .ZN(new_n519));
  NAND4_X1  g297(.A1(G2581), .A2(new_n519), .A3(G2587), .A4(G2590), .ZN(G2593));
  BUF_X1    g298(.A(G2593), .Z(G2594));
endmodule


