// Benchmark "iscas85-original/c0880" written by ABC on Sat Nov 18 15:14:12 2023

module c0880  ( 
    G1, G2, G3, G4, G5, G6, G7, G8, G9, G10, G11, G12, G13, G14, G15, G16,
    G17, G18, G19, G20, G21, G22, G23, G24, G25, G26, G27, G28, G29, G30,
    G31, G32, G33, G34, G35, G36, G37, G38, G39, G40, G41, G42, G43, G44,
    G45, G46, G47, G48, G49, G50, G51, G52, G53, G54, G55, G56, G57, G58,
    G59, G60,
    G855, G856, G857, G858, G859, G860, G861, G862, G863, G864, G865, G866,
    G867, G868, G869, G870, G871, G872, G873, G874, G875, G876, G877, G878,
    G879, G880  );
  input  G1, G2, G3, G4, G5, G6, G7, G8, G9, G10, G11, G12, G13, G14,
    G15, G16, G17, G18, G19, G20, G21, G22, G23, G24, G25, G26, G27, G28,
    G29, G30, G31, G32, G33, G34, G35, G36, G37, G38, G39, G40, G41, G42,
    G43, G44, G45, G46, G47, G48, G49, G50, G51, G52, G53, G54, G55, G56,
    G57, G58, G59, G60;
  output G855, G856, G857, G858, G859, G860, G861, G862, G863, G864, G865,
    G866, G867, G868, G869, G870, G871, G872, G873, G874, G875, G876, G877,
    G878, G879, G880;
  wire new_n87, new_n88, new_n89, new_n90, new_n91, new_n92, new_n93,
    new_n94, new_n95, new_n96, new_n97, new_n98, new_n99, new_n100,
    new_n101, new_n102, new_n103, new_n104, new_n105, new_n106, new_n107,
    new_n108, new_n109, new_n110, new_n111, new_n112, new_n113, new_n114,
    new_n115, new_n116, new_n117, new_n118, new_n121, new_n124, new_n126,
    new_n134, new_n136, new_n139, new_n140, new_n141, new_n142, new_n143,
    new_n144, new_n145, new_n146, new_n148, new_n149, new_n150, new_n151,
    new_n152, new_n153, new_n154, new_n155, new_n157, new_n158, new_n159,
    new_n160, new_n161, new_n162, new_n163, new_n164, new_n165, new_n166,
    new_n167, new_n168, new_n169, new_n170, new_n171, new_n172, new_n173,
    new_n174, new_n175, new_n176, new_n177, new_n179, new_n180, new_n181,
    new_n182, new_n183, new_n184, new_n185, new_n186, new_n187, new_n188,
    new_n189, new_n190, new_n191, new_n192, new_n193, new_n194, new_n195,
    new_n196, new_n197, new_n199, new_n200, new_n201, new_n202, new_n203,
    new_n205, new_n206, new_n207, new_n208, new_n209, new_n211, new_n212,
    new_n213, new_n214, new_n215, new_n216, new_n217, new_n218, new_n219,
    new_n220, new_n221, new_n222, new_n223, new_n224, new_n225, new_n226,
    new_n227, new_n228, new_n229, new_n230, new_n231, new_n232, new_n233,
    new_n234, new_n235, new_n236, new_n237, new_n238, new_n240, new_n241,
    new_n242, new_n243, new_n245, new_n246, new_n247, new_n248, new_n250,
    new_n251, new_n252, new_n253, new_n255, new_n256, new_n257, new_n258;
  INV_X1    g000(.A(G2), .ZN(new_n87));
  INV_X1    g001(.A(G4), .ZN(new_n88));
  INV_X1    g002(.A(G6), .ZN(new_n89));
  INV_X1    g003(.A(G7), .ZN(new_n90));
  INV_X1    g004(.A(G8), .ZN(new_n91));
  INV_X1    g005(.A(G9), .ZN(new_n92));
  INV_X1    g006(.A(G10), .ZN(new_n93));
  INV_X1    g007(.A(G11), .ZN(new_n94));
  INV_X1    g008(.A(G12), .ZN(new_n95));
  INV_X1    g009(.A(G16), .ZN(new_n96));
  INV_X1    g010(.A(G17), .ZN(new_n97));
  INV_X1    g011(.A(G25), .ZN(new_n98));
  INV_X1    g012(.A(G26), .ZN(new_n99));
  INV_X1    g013(.A(G27), .ZN(new_n100));
  INV_X1    g014(.A(G32), .ZN(new_n101));
  INV_X1    g015(.A(G34), .ZN(new_n102));
  INV_X1    g016(.A(G35), .ZN(new_n103));
  INV_X1    g017(.A(G36), .ZN(new_n104));
  INV_X1    g018(.A(G37), .ZN(new_n105));
  INV_X1    g019(.A(G38), .ZN(new_n106));
  INV_X1    g020(.A(G39), .ZN(new_n107));
  INV_X1    g021(.A(G41), .ZN(new_n108));
  INV_X1    g022(.A(G42), .ZN(new_n109));
  INV_X1    g023(.A(G43), .ZN(new_n110));
  INV_X1    g024(.A(G44), .ZN(new_n111));
  INV_X1    g025(.A(G45), .ZN(new_n112));
  INV_X1    g026(.A(G46), .ZN(new_n113));
  INV_X1    g027(.A(G47), .ZN(new_n114));
  INV_X1    g028(.A(G48), .ZN(new_n115));
  INV_X1    g029(.A(G50), .ZN(new_n116));
  INV_X1    g030(.A(G51), .ZN(new_n117));
  INV_X1    g031(.A(G52), .ZN(new_n118));
  NAND3_X1  g032(.A1(G6), .A2(G16), .A3(G8), .ZN(G855));
  NAND3_X1  g033(.A1(G6), .A2(G7), .A3(G17), .ZN(G856));
  NOR3_X1   g034(.A1(new_n89), .A2(new_n90), .A3(new_n91), .ZN(new_n121));
  INV_X1    g035(.A(new_n121), .ZN(G857));
  NAND2_X1  g036(.A1(G18), .A2(G19), .ZN(G858));
  NAND2_X1  g037(.A1(G1), .A2(G2), .ZN(new_n124));
  NAND4_X1  g038(.A1(G1), .A2(G2), .A3(G3), .A4(G4), .ZN(G859));
  NAND4_X1  g039(.A1(G3), .A2(G4), .A3(G1), .A4(G5), .ZN(new_n126));
  NOR2_X1   g040(.A1(new_n121), .A2(new_n126), .ZN(G860));
  NOR3_X1   g041(.A1(new_n94), .A2(new_n96), .A3(new_n97), .ZN(G861));
  NOR3_X1   g042(.A1(new_n90), .A2(new_n94), .A3(new_n97), .ZN(G862));
  NOR3_X1   g043(.A1(new_n90), .A2(new_n94), .A3(new_n91), .ZN(G863));
  OAI21_X1  g044(.A(G23), .B1(G20), .B2(G21), .ZN(G864));
  NOR2_X1   g045(.A1(G857), .A2(new_n126), .ZN(G865));
  NAND3_X1  g046(.A1(G1), .A2(G5), .A3(G9), .ZN(G866));
  NAND4_X1  g047(.A1(G1), .A2(G2), .A3(G3), .A4(G10), .ZN(new_n134));
  OR3_X1    g048(.A1(new_n89), .A2(new_n95), .A3(new_n134), .ZN(G867));
  NOR3_X1   g049(.A1(new_n94), .A2(new_n95), .A3(new_n134), .ZN(new_n136));
  NAND2_X1  g050(.A1(G15), .A2(new_n136), .ZN(G868));
  OAI21_X1  g051(.A(G22), .B1(G20), .B2(G21), .ZN(G869));
  OAI22_X1  g052(.A1(new_n99), .A2(G27), .B1(G26), .B2(new_n100), .ZN(new_n139));
  XOR2_X1   g053(.A(new_n101), .B(G33), .Z(new_n140));
  XNOR2_X1  g054(.A(new_n139), .B(new_n140), .ZN(new_n141));
  XNOR2_X1  g055(.A(G30), .B(G31), .ZN(new_n142));
  XOR2_X1   g056(.A(G28), .B(G29), .Z(new_n143));
  XOR2_X1   g057(.A(G24), .B(new_n98), .Z(new_n144));
  XOR2_X1   g058(.A(new_n143), .B(new_n144), .Z(new_n145));
  XNOR2_X1  g059(.A(new_n142), .B(new_n145), .ZN(new_n146));
  XOR2_X1   g060(.A(new_n141), .B(new_n146), .Z(G870));
  OAI22_X1  g061(.A1(new_n110), .A2(G44), .B1(G43), .B2(new_n111), .ZN(new_n148));
  XOR2_X1   g062(.A(new_n101), .B(G49), .Z(new_n149));
  XNOR2_X1  g063(.A(new_n148), .B(new_n149), .ZN(new_n150));
  OAI22_X1  g064(.A1(G47), .A2(G48), .B1(new_n114), .B2(new_n115), .ZN(new_n151));
  OAI22_X1  g065(.A1(new_n112), .A2(G46), .B1(G45), .B2(new_n113), .ZN(new_n152));
  AOI22_X1  g066(.A1(G41), .A2(new_n109), .B1(new_n108), .B2(G42), .ZN(new_n153));
  XOR2_X1   g067(.A(new_n152), .B(new_n153), .Z(new_n154));
  XNOR2_X1  g068(.A(new_n151), .B(new_n154), .ZN(new_n155));
  XOR2_X1   g069(.A(new_n150), .B(new_n155), .Z(G871));
  AND2_X1   g070(.A1(G11), .A2(G40), .ZN(new_n157));
  OAI221_X1 g071(.A(new_n157), .B1(new_n88), .B2(new_n91), .C1(G4), .C2(G8), .ZN(new_n158));
  NOR3_X1   g072(.A1(new_n94), .A2(new_n96), .A3(new_n91), .ZN(new_n159));
  OR4_X1    g073(.A1(new_n88), .A2(new_n92), .A3(new_n124), .A4(new_n159), .ZN(new_n160));
  OAI21_X1  g074(.A(new_n160), .B1(G866), .B2(new_n158), .ZN(new_n161));
  OR2_X1    g075(.A1(G866), .A2(new_n157), .ZN(new_n162));
  OAI21_X1  g076(.A(G1), .B1(new_n88), .B2(new_n162), .ZN(new_n163));
  INV_X1    g077(.A(new_n163), .ZN(new_n164));
  OR4_X1    g078(.A1(new_n89), .A2(new_n96), .A3(new_n97), .A4(G866), .ZN(new_n165));
  OR3_X1    g079(.A1(new_n93), .A2(G60), .A3(new_n165), .ZN(new_n166));
  OAI21_X1  g080(.A(new_n166), .B1(new_n107), .B2(new_n164), .ZN(new_n167));
  AOI21_X1  g081(.A(new_n167), .B1(G31), .B2(new_n161), .ZN(new_n168));
  XOR2_X1   g082(.A(new_n115), .B(new_n168), .Z(new_n169));
  NAND2_X1  g083(.A1(G58), .A2(new_n169), .ZN(new_n170));
  OAI211_X1 g084(.A(G51), .B(new_n170), .C1(G58), .C2(new_n169), .ZN(new_n171));
  INV_X1    g085(.A(new_n171), .ZN(new_n172));
  AOI21_X1  g086(.A(G54), .B1(G48), .B2(G53), .ZN(new_n173));
  NAND4_X1  g087(.A1(G8), .A2(G13), .A3(G14), .A4(new_n136), .ZN(new_n174));
  INV_X1    g088(.A(new_n174), .ZN(new_n175));
  AOI22_X1  g089(.A1(G30), .A2(G50), .B1(G55), .B2(G59), .ZN(new_n176));
  OAI221_X1 g090(.A(new_n176), .B1(new_n115), .B2(new_n174), .C1(new_n168), .C2(new_n173), .ZN(new_n177));
  AOI211_X1 g091(.A(new_n177), .B(new_n172), .C1(G52), .C2(new_n169), .ZN(G872));
  OAI21_X1  g092(.A(new_n166), .B1(new_n103), .B2(new_n164), .ZN(new_n179));
  AOI21_X1  g093(.A(new_n179), .B1(G28), .B2(new_n161), .ZN(new_n180));
  XOR2_X1   g094(.A(new_n112), .B(new_n180), .Z(new_n181));
  OAI21_X1  g095(.A(new_n166), .B1(new_n104), .B2(new_n164), .ZN(new_n182));
  AOI21_X1  g096(.A(new_n182), .B1(G29), .B2(new_n161), .ZN(new_n183));
  XOR2_X1   g097(.A(new_n113), .B(new_n183), .Z(new_n184));
  OAI21_X1  g098(.A(new_n166), .B1(new_n105), .B2(new_n164), .ZN(new_n185));
  AOI21_X1  g099(.A(new_n185), .B1(G30), .B2(new_n161), .ZN(new_n186));
  XOR2_X1   g100(.A(new_n114), .B(new_n186), .Z(new_n187));
  OAI21_X1  g101(.A(new_n170), .B1(new_n115), .B2(new_n168), .ZN(new_n188));
  NAND2_X1  g102(.A1(new_n187), .A2(new_n188), .ZN(new_n189));
  OAI21_X1  g103(.A(new_n189), .B1(new_n114), .B2(new_n186), .ZN(new_n190));
  NAND2_X1  g104(.A1(new_n184), .A2(new_n190), .ZN(new_n191));
  OAI21_X1  g105(.A(new_n191), .B1(new_n113), .B2(new_n183), .ZN(new_n192));
  NAND2_X1  g106(.A1(new_n181), .A2(new_n192), .ZN(new_n193));
  OAI211_X1 g107(.A(G51), .B(new_n193), .C1(new_n181), .C2(new_n192), .ZN(new_n194));
  INV_X1    g108(.A(new_n194), .ZN(new_n195));
  AOI21_X1  g109(.A(G54), .B1(G45), .B2(G53), .ZN(new_n196));
  OAI222_X1 g110(.A1(new_n112), .A2(new_n174), .B1(new_n100), .B2(new_n116), .C1(new_n180), .C2(new_n196), .ZN(new_n197));
  AOI211_X1 g111(.A(new_n197), .B(new_n195), .C1(G52), .C2(new_n181), .ZN(G873));
  OAI211_X1 g112(.A(G51), .B(new_n191), .C1(new_n184), .C2(new_n190), .ZN(new_n199));
  INV_X1    g113(.A(new_n199), .ZN(new_n200));
  AOI21_X1  g114(.A(G54), .B1(G46), .B2(G53), .ZN(new_n201));
  AOI22_X1  g115(.A1(G28), .A2(G50), .B1(G55), .B2(G56), .ZN(new_n202));
  OAI221_X1 g116(.A(new_n202), .B1(new_n113), .B2(new_n174), .C1(new_n183), .C2(new_n201), .ZN(new_n203));
  AOI211_X1 g117(.A(new_n203), .B(new_n200), .C1(G52), .C2(new_n184), .ZN(G874));
  OAI211_X1 g118(.A(G51), .B(new_n189), .C1(new_n187), .C2(new_n188), .ZN(new_n205));
  INV_X1    g119(.A(new_n205), .ZN(new_n206));
  AOI21_X1  g120(.A(G54), .B1(G47), .B2(G53), .ZN(new_n207));
  AOI22_X1  g121(.A1(G29), .A2(G50), .B1(G55), .B2(G57), .ZN(new_n208));
  OAI221_X1 g122(.A(new_n208), .B1(new_n114), .B2(new_n174), .C1(new_n186), .C2(new_n207), .ZN(new_n209));
  AOI211_X1 g123(.A(new_n209), .B(new_n206), .C1(G52), .C2(new_n187), .ZN(G875));
  OR2_X1    g124(.A1(new_n93), .A2(new_n162), .ZN(new_n211));
  OR3_X1    g125(.A1(new_n88), .A2(G60), .A3(new_n165), .ZN(new_n212));
  OAI221_X1 g126(.A(new_n212), .B1(new_n87), .B2(new_n102), .C1(new_n103), .C2(new_n211), .ZN(new_n213));
  AOI21_X1  g127(.A(new_n213), .B1(G24), .B2(new_n161), .ZN(new_n214));
  NOR2_X1   g128(.A1(new_n108), .A2(new_n214), .ZN(new_n215));
  AOI21_X1  g129(.A(new_n215), .B1(new_n108), .B2(new_n214), .ZN(new_n216));
  INV_X1    g130(.A(new_n216), .ZN(new_n217));
  OAI221_X1 g131(.A(new_n212), .B1(new_n92), .B2(new_n102), .C1(new_n104), .C2(new_n211), .ZN(new_n218));
  AOI21_X1  g132(.A(new_n218), .B1(G25), .B2(new_n161), .ZN(new_n219));
  NOR2_X1   g133(.A1(new_n109), .A2(new_n219), .ZN(new_n220));
  OAI221_X1 g134(.A(new_n212), .B1(new_n88), .B2(new_n102), .C1(new_n105), .C2(new_n211), .ZN(new_n221));
  AOI21_X1  g135(.A(new_n221), .B1(G26), .B2(new_n161), .ZN(new_n222));
  INV_X1    g136(.A(new_n222), .ZN(new_n223));
  NOR2_X1   g137(.A1(new_n110), .A2(new_n222), .ZN(new_n224));
  INV_X1    g138(.A(new_n224), .ZN(new_n225));
  OAI221_X1 g139(.A(new_n212), .B1(new_n102), .B2(new_n106), .C1(new_n107), .C2(new_n211), .ZN(new_n226));
  AOI21_X1  g140(.A(new_n226), .B1(G27), .B2(new_n161), .ZN(new_n227));
  NOR2_X1   g141(.A1(new_n111), .A2(new_n227), .ZN(new_n228));
  OAI21_X1  g142(.A(new_n193), .B1(new_n112), .B2(new_n180), .ZN(new_n229));
  AOI21_X1  g143(.A(new_n228), .B1(new_n111), .B2(new_n227), .ZN(new_n230));
  AOI21_X1  g144(.A(new_n228), .B1(new_n229), .B2(new_n230), .ZN(new_n231));
  AOI21_X1  g145(.A(new_n231), .B1(new_n110), .B2(new_n222), .ZN(new_n232));
  NOR2_X1   g146(.A1(new_n224), .A2(new_n232), .ZN(new_n233));
  AOI21_X1  g147(.A(new_n220), .B1(new_n109), .B2(new_n219), .ZN(new_n234));
  INV_X1    g148(.A(new_n234), .ZN(new_n235));
  NOR2_X1   g149(.A1(new_n233), .A2(new_n235), .ZN(new_n236));
  NOR2_X1   g150(.A1(new_n220), .A2(new_n236), .ZN(new_n237));
  NOR2_X1   g151(.A1(new_n217), .A2(new_n237), .ZN(new_n238));
  NOR2_X1   g152(.A1(new_n215), .A2(new_n238), .ZN(G876));
  NOR2_X1   g153(.A1(new_n229), .A2(new_n230), .ZN(new_n240));
  AOI211_X1 g154(.A(new_n117), .B(new_n240), .C1(new_n229), .C2(new_n230), .ZN(new_n241));
  AOI21_X1  g155(.A(G54), .B1(G44), .B2(G53), .ZN(new_n242));
  OAI222_X1 g156(.A1(new_n111), .A2(new_n174), .B1(new_n99), .B2(new_n116), .C1(new_n227), .C2(new_n242), .ZN(new_n243));
  AOI211_X1 g157(.A(new_n243), .B(new_n241), .C1(G52), .C2(new_n230), .ZN(G877));
  AOI211_X1 g158(.A(new_n117), .B(new_n238), .C1(new_n217), .C2(new_n237), .ZN(new_n245));
  AOI21_X1  g159(.A(G54), .B1(G41), .B2(G53), .ZN(new_n246));
  AOI22_X1  g160(.A1(G41), .A2(new_n175), .B1(G50), .B2(G60), .ZN(new_n247));
  OAI21_X1  g161(.A(new_n247), .B1(new_n214), .B2(new_n246), .ZN(new_n248));
  AOI211_X1 g162(.A(new_n248), .B(new_n245), .C1(G52), .C2(new_n216), .ZN(G878));
  AOI211_X1 g163(.A(new_n117), .B(new_n236), .C1(new_n233), .C2(new_n235), .ZN(new_n250));
  AOI21_X1  g164(.A(G54), .B1(G42), .B2(G53), .ZN(new_n251));
  AOI22_X1  g165(.A1(G42), .A2(new_n175), .B1(G24), .B2(G50), .ZN(new_n252));
  OAI21_X1  g166(.A(new_n252), .B1(new_n219), .B2(new_n251), .ZN(new_n253));
  AOI211_X1 g167(.A(new_n253), .B(new_n250), .C1(G52), .C2(new_n234), .ZN(G879));
  OAI22_X1  g168(.A1(G43), .A2(new_n223), .B1(G53), .B2(new_n225), .ZN(new_n255));
  OAI21_X1  g169(.A(new_n255), .B1(new_n117), .B2(new_n231), .ZN(new_n256));
  OAI211_X1 g170(.A(new_n118), .B(new_n225), .C1(new_n117), .C2(new_n232), .ZN(new_n257));
  OAI22_X1  g171(.A1(new_n110), .A2(new_n174), .B1(new_n98), .B2(new_n116), .ZN(new_n258));
  AOI221_X1 g172(.A(new_n258), .B1(G54), .B2(new_n223), .C1(new_n256), .C2(new_n257), .ZN(G880));
endmodule


