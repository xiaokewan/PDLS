// Benchmark "iscas85-original/c1355" written by ABC on Sat Nov 18 15:14:57 2023

module c1355  ( 
    G1, G2, G3, G4, G5, G6, G7, G8, G9, G10, G11, G12, G13, G14, G15, G16,
    G17, G18, G19, G20, G21, G22, G23, G24, G25, G26, G27, G28, G29, G30,
    G31, G32, G33, G34, G35, G36, G37, G38, G39, G40, G41,
    G1324, G1325, G1326, G1327, G1328, G1329, G1330, G1331, G1332, G1333,
    G1334, G1335, G1336, G1337, G1338, G1339, G1340, G1341, G1342, G1343,
    G1344, G1345, G1346, G1347, G1348, G1349, G1350, G1351, G1352, G1353,
    G1354, G1355  );
  input  G1, G2, G3, G4, G5, G6, G7, G8, G9, G10, G11, G12, G13, G14,
    G15, G16, G17, G18, G19, G20, G21, G22, G23, G24, G25, G26, G27, G28,
    G29, G30, G31, G32, G33, G34, G35, G36, G37, G38, G39, G40, G41;
  output G1324, G1325, G1326, G1327, G1328, G1329, G1330, G1331, G1332, G1333,
    G1334, G1335, G1336, G1337, G1338, G1339, G1340, G1341, G1342, G1343,
    G1344, G1345, G1346, G1347, G1348, G1349, G1350, G1351, G1352, G1353,
    G1354, G1355;
  wire new_n74, new_n75, new_n76, new_n77, new_n78, new_n79, new_n80,
    new_n81, new_n82, new_n83, new_n84, new_n85, new_n86, new_n87, new_n88,
    new_n89, new_n90, new_n91, new_n92, new_n93, new_n94, new_n95, new_n96,
    new_n97, new_n98, new_n99, new_n100, new_n101, new_n102, new_n103,
    new_n104, new_n105, new_n106, new_n107, new_n108, new_n109, new_n110,
    new_n111, new_n112, new_n113, new_n114, new_n115, new_n116, new_n117,
    new_n118, new_n119, new_n120, new_n121, new_n122, new_n123, new_n124,
    new_n125, new_n126, new_n127, new_n128, new_n129, new_n130, new_n131,
    new_n132, new_n133, new_n134, new_n135, new_n136, new_n137, new_n138,
    new_n139, new_n140, new_n141, new_n142, new_n143, new_n144, new_n145,
    new_n146, new_n147, new_n148, new_n149, new_n150, new_n151, new_n152,
    new_n153, new_n154, new_n155, new_n156, new_n157, new_n158, new_n159,
    new_n160, new_n161, new_n162, new_n163, new_n164, new_n165, new_n166,
    new_n167, new_n168, new_n169, new_n170, new_n171, new_n172, new_n173,
    new_n174, new_n175, new_n176, new_n177, new_n178, new_n179, new_n180,
    new_n181, new_n182, new_n183, new_n184, new_n185, new_n186, new_n187,
    new_n188, new_n189, new_n190, new_n191, new_n192, new_n193, new_n194,
    new_n195, new_n196, new_n197, new_n198, new_n199, new_n200, new_n201,
    new_n202, new_n203, new_n205, new_n207, new_n209, new_n211, new_n212,
    new_n213, new_n215, new_n217, new_n219, new_n221, new_n222, new_n223,
    new_n225, new_n227, new_n229, new_n231, new_n232, new_n234, new_n236,
    new_n238, new_n240, new_n241, new_n242, new_n243, new_n244, new_n245,
    new_n247, new_n249, new_n251, new_n253, new_n254, new_n255, new_n257,
    new_n259, new_n261, new_n263, new_n264, new_n266, new_n268, new_n270,
    new_n272, new_n273, new_n275, new_n277, new_n279;
  INV_X1    g000(.A(G1), .ZN(new_n74));
  INV_X1    g001(.A(G2), .ZN(new_n75));
  INV_X1    g002(.A(G3), .ZN(new_n76));
  INV_X1    g003(.A(G4), .ZN(new_n77));
  INV_X1    g004(.A(G5), .ZN(new_n78));
  INV_X1    g005(.A(G6), .ZN(new_n79));
  INV_X1    g006(.A(G7), .ZN(new_n80));
  INV_X1    g007(.A(G8), .ZN(new_n81));
  INV_X1    g008(.A(G9), .ZN(new_n82));
  INV_X1    g009(.A(G10), .ZN(new_n83));
  INV_X1    g010(.A(G11), .ZN(new_n84));
  INV_X1    g011(.A(G12), .ZN(new_n85));
  INV_X1    g012(.A(G13), .ZN(new_n86));
  INV_X1    g013(.A(G14), .ZN(new_n87));
  INV_X1    g014(.A(G15), .ZN(new_n88));
  INV_X1    g015(.A(G16), .ZN(new_n89));
  INV_X1    g016(.A(G17), .ZN(new_n90));
  INV_X1    g017(.A(G18), .ZN(new_n91));
  INV_X1    g018(.A(G19), .ZN(new_n92));
  INV_X1    g019(.A(G20), .ZN(new_n93));
  INV_X1    g020(.A(G21), .ZN(new_n94));
  INV_X1    g021(.A(G22), .ZN(new_n95));
  INV_X1    g022(.A(G23), .ZN(new_n96));
  INV_X1    g023(.A(G24), .ZN(new_n97));
  INV_X1    g024(.A(G25), .ZN(new_n98));
  INV_X1    g025(.A(G26), .ZN(new_n99));
  INV_X1    g026(.A(G27), .ZN(new_n100));
  INV_X1    g027(.A(G28), .ZN(new_n101));
  INV_X1    g028(.A(G29), .ZN(new_n102));
  INV_X1    g029(.A(G30), .ZN(new_n103));
  INV_X1    g030(.A(G31), .ZN(new_n104));
  INV_X1    g031(.A(G32), .ZN(new_n105));
  OAI22_X1  g032(.A1(G23), .A2(G24), .B1(new_n96), .B2(new_n97), .ZN(new_n106));
  OAI22_X1  g033(.A1(new_n94), .A2(G22), .B1(G21), .B2(new_n95), .ZN(new_n107));
  XNOR2_X1  g034(.A(new_n106), .B(new_n107), .ZN(new_n108));
  NAND2_X1  g035(.A1(G33), .A2(G41), .ZN(new_n109));
  XNOR2_X1  g036(.A(G9), .B(new_n109), .ZN(new_n110));
  OAI22_X1  g037(.A1(new_n74), .A2(G5), .B1(G1), .B2(new_n78), .ZN(new_n111));
  OAI22_X1  g038(.A1(G19), .A2(G20), .B1(new_n92), .B2(new_n93), .ZN(new_n112));
  OAI22_X1  g039(.A1(new_n90), .A2(G18), .B1(G17), .B2(new_n91), .ZN(new_n113));
  XOR2_X1   g040(.A(new_n112), .B(new_n113), .Z(new_n114));
  XNOR2_X1  g041(.A(new_n111), .B(new_n114), .ZN(new_n115));
  XOR2_X1   g042(.A(new_n110), .B(new_n115), .Z(new_n116));
  XNOR2_X1  g043(.A(new_n86), .B(new_n116), .ZN(new_n117));
  XOR2_X1   g044(.A(new_n108), .B(new_n117), .Z(new_n118));
  INV_X1    g045(.A(new_n118), .ZN(new_n119));
  NAND2_X1  g046(.A1(G40), .A2(G41), .ZN(new_n120));
  AOI22_X1  g047(.A1(G20), .A2(new_n97), .B1(new_n93), .B2(G24), .ZN(new_n121));
  XNOR2_X1  g048(.A(new_n120), .B(new_n121), .ZN(new_n122));
  OAI22_X1  g049(.A1(G28), .A2(G32), .B1(new_n101), .B2(new_n105), .ZN(new_n123));
  OAI22_X1  g050(.A1(G15), .A2(G16), .B1(new_n88), .B2(new_n89), .ZN(new_n124));
  OAI22_X1  g051(.A1(new_n86), .A2(G14), .B1(G13), .B2(new_n87), .ZN(new_n125));
  XNOR2_X1  g052(.A(new_n124), .B(new_n125), .ZN(new_n126));
  XNOR2_X1  g053(.A(new_n123), .B(new_n126), .ZN(new_n127));
  OAI22_X1  g054(.A1(G7), .A2(G8), .B1(new_n80), .B2(new_n81), .ZN(new_n128));
  OAI22_X1  g055(.A1(new_n78), .A2(G6), .B1(G5), .B2(new_n79), .ZN(new_n129));
  XOR2_X1   g056(.A(new_n128), .B(new_n129), .Z(new_n130));
  XNOR2_X1  g057(.A(new_n127), .B(new_n130), .ZN(new_n131));
  XOR2_X1   g058(.A(new_n122), .B(new_n131), .Z(new_n132));
  NAND2_X1  g059(.A1(G39), .A2(G41), .ZN(new_n133));
  AOI22_X1  g060(.A1(G19), .A2(new_n96), .B1(new_n92), .B2(G23), .ZN(new_n134));
  XNOR2_X1  g061(.A(new_n133), .B(new_n134), .ZN(new_n135));
  OAI22_X1  g062(.A1(G27), .A2(G31), .B1(new_n100), .B2(new_n104), .ZN(new_n136));
  OAI22_X1  g063(.A1(G11), .A2(G12), .B1(new_n84), .B2(new_n85), .ZN(new_n137));
  OAI22_X1  g064(.A1(new_n82), .A2(G10), .B1(G9), .B2(new_n83), .ZN(new_n138));
  XOR2_X1   g065(.A(new_n137), .B(new_n138), .Z(new_n139));
  XOR2_X1   g066(.A(new_n136), .B(new_n139), .Z(new_n140));
  OAI22_X1  g067(.A1(G3), .A2(G4), .B1(new_n76), .B2(new_n77), .ZN(new_n141));
  OAI22_X1  g068(.A1(new_n74), .A2(G2), .B1(G1), .B2(new_n75), .ZN(new_n142));
  XOR2_X1   g069(.A(new_n141), .B(new_n142), .Z(new_n143));
  XNOR2_X1  g070(.A(new_n140), .B(new_n143), .ZN(new_n144));
  XOR2_X1   g071(.A(new_n135), .B(new_n144), .Z(new_n145));
  INV_X1    g072(.A(new_n145), .ZN(new_n146));
  AND2_X1   g073(.A1(new_n132), .A2(new_n146), .ZN(new_n147));
  NAND2_X1  g074(.A1(G37), .A2(G41), .ZN(new_n148));
  XNOR2_X1  g075(.A(G25), .B(new_n148), .ZN(new_n149));
  OAI22_X1  g076(.A1(new_n90), .A2(G21), .B1(G17), .B2(new_n94), .ZN(new_n150));
  XNOR2_X1  g077(.A(new_n143), .B(new_n150), .ZN(new_n151));
  XOR2_X1   g078(.A(new_n149), .B(new_n151), .Z(new_n152));
  XNOR2_X1  g079(.A(new_n102), .B(new_n152), .ZN(new_n153));
  XOR2_X1   g080(.A(new_n130), .B(new_n153), .Z(new_n154));
  NAND2_X1  g081(.A1(G38), .A2(G41), .ZN(new_n155));
  XNOR2_X1  g082(.A(G26), .B(new_n155), .ZN(new_n156));
  OAI22_X1  g083(.A1(new_n91), .A2(G22), .B1(G18), .B2(new_n95), .ZN(new_n157));
  XNOR2_X1  g084(.A(new_n139), .B(new_n157), .ZN(new_n158));
  XOR2_X1   g085(.A(new_n156), .B(new_n158), .Z(new_n159));
  XNOR2_X1  g086(.A(new_n103), .B(new_n159), .ZN(new_n160));
  XOR2_X1   g087(.A(new_n126), .B(new_n160), .Z(new_n161));
  INV_X1    g088(.A(new_n161), .ZN(new_n162));
  NOR2_X1   g089(.A1(new_n154), .A2(new_n161), .ZN(new_n163));
  OAI22_X1  g090(.A1(G27), .A2(G28), .B1(new_n100), .B2(new_n101), .ZN(new_n164));
  OAI22_X1  g091(.A1(new_n98), .A2(G26), .B1(G25), .B2(new_n99), .ZN(new_n165));
  XOR2_X1   g092(.A(new_n164), .B(new_n165), .Z(new_n166));
  NAND2_X1  g093(.A1(G34), .A2(G41), .ZN(new_n167));
  OAI22_X1  g094(.A1(new_n83), .A2(G14), .B1(G10), .B2(new_n87), .ZN(new_n168));
  XOR2_X1   g095(.A(new_n167), .B(new_n168), .Z(new_n169));
  XOR2_X1   g096(.A(new_n166), .B(new_n169), .Z(new_n170));
  OAI22_X1  g097(.A1(G2), .A2(G6), .B1(new_n75), .B2(new_n79), .ZN(new_n171));
  OAI22_X1  g098(.A1(G31), .A2(G32), .B1(new_n104), .B2(new_n105), .ZN(new_n172));
  OAI22_X1  g099(.A1(new_n102), .A2(G30), .B1(G29), .B2(new_n103), .ZN(new_n173));
  XOR2_X1   g100(.A(new_n172), .B(new_n173), .Z(new_n174));
  XNOR2_X1  g101(.A(new_n171), .B(new_n174), .ZN(new_n175));
  XOR2_X1   g102(.A(new_n170), .B(new_n175), .Z(new_n176));
  NOR2_X1   g103(.A1(new_n118), .A2(new_n176), .ZN(new_n177));
  INV_X1    g104(.A(new_n177), .ZN(new_n178));
  NAND2_X1  g105(.A1(new_n118), .A2(new_n176), .ZN(new_n179));
  INV_X1    g106(.A(new_n179), .ZN(new_n180));
  NAND2_X1  g107(.A1(G35), .A2(G41), .ZN(new_n181));
  OAI22_X1  g108(.A1(new_n84), .A2(G15), .B1(G11), .B2(new_n88), .ZN(new_n182));
  XOR2_X1   g109(.A(new_n181), .B(new_n182), .Z(new_n183));
  XOR2_X1   g110(.A(new_n114), .B(new_n183), .Z(new_n184));
  OAI22_X1  g111(.A1(G3), .A2(G7), .B1(new_n76), .B2(new_n80), .ZN(new_n185));
  XNOR2_X1  g112(.A(new_n166), .B(new_n185), .ZN(new_n186));
  XOR2_X1   g113(.A(new_n184), .B(new_n186), .Z(new_n187));
  NAND2_X1  g114(.A1(G36), .A2(G41), .ZN(new_n188));
  OAI22_X1  g115(.A1(new_n85), .A2(G16), .B1(G12), .B2(new_n89), .ZN(new_n189));
  XOR2_X1   g116(.A(new_n188), .B(new_n189), .Z(new_n190));
  XNOR2_X1  g117(.A(new_n108), .B(new_n190), .ZN(new_n191));
  OAI22_X1  g118(.A1(G4), .A2(G8), .B1(new_n77), .B2(new_n81), .ZN(new_n192));
  XNOR2_X1  g119(.A(new_n174), .B(new_n192), .ZN(new_n193));
  XOR2_X1   g120(.A(new_n191), .B(new_n193), .Z(new_n194));
  INV_X1    g121(.A(new_n194), .ZN(new_n195));
  OAI211_X1 g122(.A(new_n187), .B(new_n194), .C1(new_n177), .C2(new_n180), .ZN(new_n196));
  NAND2_X1  g123(.A1(new_n187), .A2(new_n195), .ZN(new_n197));
  INV_X1    g124(.A(new_n197), .ZN(new_n198));
  NOR2_X1   g125(.A1(new_n187), .A2(new_n195), .ZN(new_n199));
  OAI21_X1  g126(.A(new_n176), .B1(new_n198), .B2(new_n199), .ZN(new_n200));
  OAI21_X1  g127(.A(new_n196), .B1(new_n118), .B2(new_n200), .ZN(new_n201));
  NAND3_X1  g128(.A1(new_n163), .A2(new_n201), .A3(new_n147), .ZN(new_n202));
  NOR2_X1   g129(.A1(new_n119), .A2(new_n202), .ZN(new_n203));
  XOR2_X1   g130(.A(new_n74), .B(new_n203), .Z(G1324));
  NOR2_X1   g131(.A1(new_n176), .A2(new_n202), .ZN(new_n205));
  XOR2_X1   g132(.A(new_n75), .B(new_n205), .Z(G1325));
  NOR2_X1   g133(.A1(new_n187), .A2(new_n202), .ZN(new_n207));
  XOR2_X1   g134(.A(new_n76), .B(new_n207), .Z(G1326));
  NOR2_X1   g135(.A1(new_n194), .A2(new_n202), .ZN(new_n209));
  XOR2_X1   g136(.A(new_n77), .B(new_n209), .Z(G1327));
  NOR2_X1   g137(.A1(new_n132), .A2(new_n146), .ZN(new_n211));
  NAND3_X1  g138(.A1(new_n163), .A2(new_n201), .A3(new_n211), .ZN(new_n212));
  NOR2_X1   g139(.A1(new_n119), .A2(new_n212), .ZN(new_n213));
  XOR2_X1   g140(.A(new_n78), .B(new_n213), .Z(G1328));
  NOR2_X1   g141(.A1(new_n176), .A2(new_n212), .ZN(new_n215));
  XOR2_X1   g142(.A(new_n79), .B(new_n215), .Z(G1329));
  NOR2_X1   g143(.A1(new_n187), .A2(new_n212), .ZN(new_n217));
  XOR2_X1   g144(.A(new_n80), .B(new_n217), .Z(G1330));
  NOR2_X1   g145(.A1(new_n194), .A2(new_n212), .ZN(new_n219));
  XOR2_X1   g146(.A(new_n81), .B(new_n219), .Z(G1331));
  AND2_X1   g147(.A1(new_n154), .A2(new_n161), .ZN(new_n221));
  NAND3_X1  g148(.A1(new_n147), .A2(new_n221), .A3(new_n201), .ZN(new_n222));
  NOR2_X1   g149(.A1(new_n119), .A2(new_n222), .ZN(new_n223));
  XOR2_X1   g150(.A(new_n82), .B(new_n223), .Z(G1332));
  NOR2_X1   g151(.A1(new_n176), .A2(new_n222), .ZN(new_n225));
  XOR2_X1   g152(.A(new_n83), .B(new_n225), .Z(G1333));
  NOR2_X1   g153(.A1(new_n187), .A2(new_n222), .ZN(new_n227));
  XOR2_X1   g154(.A(new_n84), .B(new_n227), .Z(G1334));
  NOR2_X1   g155(.A1(new_n194), .A2(new_n222), .ZN(new_n229));
  XOR2_X1   g156(.A(new_n85), .B(new_n229), .Z(G1335));
  NAND3_X1  g157(.A1(new_n211), .A2(new_n221), .A3(new_n201), .ZN(new_n231));
  NOR2_X1   g158(.A1(new_n119), .A2(new_n231), .ZN(new_n232));
  XOR2_X1   g159(.A(new_n86), .B(new_n232), .Z(G1336));
  NOR2_X1   g160(.A1(new_n176), .A2(new_n231), .ZN(new_n234));
  XOR2_X1   g161(.A(new_n87), .B(new_n234), .Z(G1337));
  NOR2_X1   g162(.A1(new_n187), .A2(new_n231), .ZN(new_n236));
  XOR2_X1   g163(.A(new_n88), .B(new_n236), .Z(G1338));
  NOR2_X1   g164(.A1(new_n194), .A2(new_n231), .ZN(new_n238));
  XOR2_X1   g165(.A(new_n89), .B(new_n238), .Z(G1339));
  OAI211_X1 g166(.A(new_n154), .B(new_n162), .C1(new_n147), .C2(new_n211), .ZN(new_n240));
  OAI211_X1 g167(.A(new_n132), .B(new_n145), .C1(new_n163), .C2(new_n221), .ZN(new_n241));
  AND2_X1   g168(.A1(new_n240), .A2(new_n241), .ZN(new_n242));
  OR3_X1    g169(.A1(new_n187), .A2(new_n195), .A3(new_n242), .ZN(new_n243));
  OR2_X1    g170(.A1(new_n179), .A2(new_n243), .ZN(new_n244));
  NOR2_X1   g171(.A1(new_n154), .A2(new_n244), .ZN(new_n245));
  XOR2_X1   g172(.A(new_n90), .B(new_n245), .Z(G1340));
  NOR2_X1   g173(.A1(new_n162), .A2(new_n244), .ZN(new_n247));
  XOR2_X1   g174(.A(new_n91), .B(new_n247), .Z(G1341));
  NOR2_X1   g175(.A1(new_n145), .A2(new_n244), .ZN(new_n249));
  XOR2_X1   g176(.A(new_n92), .B(new_n249), .Z(G1342));
  NOR2_X1   g177(.A1(new_n132), .A2(new_n244), .ZN(new_n251));
  XOR2_X1   g178(.A(new_n93), .B(new_n251), .Z(G1343));
  OR2_X1    g179(.A1(new_n197), .A2(new_n242), .ZN(new_n253));
  OR2_X1    g180(.A1(new_n179), .A2(new_n253), .ZN(new_n254));
  NOR2_X1   g181(.A1(new_n154), .A2(new_n254), .ZN(new_n255));
  XOR2_X1   g182(.A(new_n94), .B(new_n255), .Z(G1344));
  NOR2_X1   g183(.A1(new_n162), .A2(new_n254), .ZN(new_n257));
  XOR2_X1   g184(.A(new_n95), .B(new_n257), .Z(G1345));
  NOR2_X1   g185(.A1(new_n145), .A2(new_n254), .ZN(new_n259));
  XOR2_X1   g186(.A(new_n96), .B(new_n259), .Z(G1346));
  NOR2_X1   g187(.A1(new_n132), .A2(new_n254), .ZN(new_n261));
  XOR2_X1   g188(.A(new_n97), .B(new_n261), .Z(G1347));
  OR2_X1    g189(.A1(new_n178), .A2(new_n243), .ZN(new_n263));
  NOR2_X1   g190(.A1(new_n154), .A2(new_n263), .ZN(new_n264));
  XOR2_X1   g191(.A(new_n98), .B(new_n264), .Z(G1348));
  NOR2_X1   g192(.A1(new_n162), .A2(new_n263), .ZN(new_n266));
  XOR2_X1   g193(.A(new_n99), .B(new_n266), .Z(G1349));
  NOR2_X1   g194(.A1(new_n145), .A2(new_n263), .ZN(new_n268));
  XOR2_X1   g195(.A(new_n100), .B(new_n268), .Z(G1350));
  NOR2_X1   g196(.A1(new_n132), .A2(new_n263), .ZN(new_n270));
  XOR2_X1   g197(.A(new_n101), .B(new_n270), .Z(G1351));
  OR2_X1    g198(.A1(new_n178), .A2(new_n253), .ZN(new_n272));
  NOR2_X1   g199(.A1(new_n154), .A2(new_n272), .ZN(new_n273));
  XOR2_X1   g200(.A(new_n102), .B(new_n273), .Z(G1352));
  NOR2_X1   g201(.A1(new_n162), .A2(new_n272), .ZN(new_n275));
  XOR2_X1   g202(.A(new_n103), .B(new_n275), .Z(G1353));
  NOR2_X1   g203(.A1(new_n145), .A2(new_n272), .ZN(new_n277));
  XOR2_X1   g204(.A(new_n104), .B(new_n277), .Z(G1354));
  NOR2_X1   g205(.A1(new_n132), .A2(new_n272), .ZN(new_n279));
  XOR2_X1   g206(.A(new_n105), .B(new_n279), .Z(G1355));
endmodule


