// Benchmark "Circuit499" written by ABC on Sat Nov 18 22:37:10 2023

module c499 ( 
    in1, in5, in9, in13, in17, in21, in25, in29, in33, in37, in41, in45,
    in49, in53, in57, in61, in65, in69, in73, in77, in81, in85, in89, in93,
    in97, in101, in105, in109, in113, in117, in121, in125, in129, in130,
    in131, in132, in133, in134, in135, in136, in137,
    out724, out725, out726, out727, out728, out729, out730, out731, out732,
    out733, out734, out735, out736, out737, out738, out739, out740, out741,
    out742, out743, out744, out745, out746, out747, out748, out749, out750,
    out751, out752, out753, out754, out755  );
  input  in1, in5, in9, in13, in17, in21, in25, in29, in33, in37, in41,
    in45, in49, in53, in57, in61, in65, in69, in73, in77, in81, in85, in89,
    in93, in97, in101, in105, in109, in113, in117, in121, in125, in129,
    in130, in131, in132, in133, in134, in135, in136, in137;
  output out724, out725, out726, out727, out728, out729, out730, out731,
    out732, out733, out734, out735, out736, out737, out738, out739, out740,
    out741, out742, out743, out744, out745, out746, out747, out748, out749,
    out750, out751, out752, out753, out754, out755;
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
    new_n195, new_n196, new_n198, new_n199, new_n200, new_n201, new_n203,
    new_n204, new_n205, new_n206, new_n207, new_n209, new_n210, new_n211,
    new_n212, new_n214, new_n215, new_n217, new_n219, new_n221, new_n223,
    new_n224, new_n225, new_n227, new_n228, new_n230, new_n231, new_n233,
    new_n234, new_n236, new_n238, new_n240, new_n242, new_n244, new_n245,
    new_n246, new_n247, new_n249, new_n250, new_n251, new_n253, new_n254,
    new_n255, new_n256, new_n258, new_n259, new_n260, new_n262, new_n264,
    new_n266, new_n268, new_n270, new_n271, new_n273, new_n274, new_n276,
    new_n277, new_n279, new_n280, new_n282, new_n284, new_n286, new_n288;
  INV_X1    g000(.A(in1), .ZN(new_n74));
  INV_X1    g001(.A(in5), .ZN(new_n75));
  INV_X1    g002(.A(in9), .ZN(new_n76));
  INV_X1    g003(.A(in13), .ZN(new_n77));
  INV_X1    g004(.A(in17), .ZN(new_n78));
  INV_X1    g005(.A(in21), .ZN(new_n79));
  INV_X1    g006(.A(in25), .ZN(new_n80));
  INV_X1    g007(.A(in29), .ZN(new_n81));
  INV_X1    g008(.A(in33), .ZN(new_n82));
  INV_X1    g009(.A(in37), .ZN(new_n83));
  INV_X1    g010(.A(in41), .ZN(new_n84));
  INV_X1    g011(.A(in45), .ZN(new_n85));
  INV_X1    g012(.A(in49), .ZN(new_n86));
  INV_X1    g013(.A(in53), .ZN(new_n87));
  INV_X1    g014(.A(in57), .ZN(new_n88));
  INV_X1    g015(.A(in61), .ZN(new_n89));
  INV_X1    g016(.A(in65), .ZN(new_n90));
  INV_X1    g017(.A(in69), .ZN(new_n91));
  INV_X1    g018(.A(in73), .ZN(new_n92));
  INV_X1    g019(.A(in77), .ZN(new_n93));
  INV_X1    g020(.A(in81), .ZN(new_n94));
  INV_X1    g021(.A(in85), .ZN(new_n95));
  INV_X1    g022(.A(in89), .ZN(new_n96));
  INV_X1    g023(.A(in93), .ZN(new_n97));
  INV_X1    g024(.A(in97), .ZN(new_n98));
  INV_X1    g025(.A(in101), .ZN(new_n99));
  INV_X1    g026(.A(in105), .ZN(new_n100));
  INV_X1    g027(.A(in109), .ZN(new_n101));
  INV_X1    g028(.A(in113), .ZN(new_n102));
  INV_X1    g029(.A(in117), .ZN(new_n103));
  INV_X1    g030(.A(in121), .ZN(new_n104));
  INV_X1    g031(.A(in125), .ZN(new_n105));
  NAND2_X1  g032(.A1(in130), .A2(in137), .ZN(new_n106));
  AOI22_X1  g033(.A1(in5), .A2(new_n79), .B1(new_n75), .B2(in21), .ZN(new_n107));
  XNOR2_X1  g034(.A(new_n106), .B(new_n107), .ZN(new_n108));
  OAI22_X1  g035(.A1(in37), .A2(in53), .B1(new_n83), .B2(new_n87), .ZN(new_n109));
  OAI22_X1  g036(.A1(new_n102), .A2(in117), .B1(in113), .B2(new_n103), .ZN(new_n110));
  OAI22_X1  g037(.A1(new_n104), .A2(in125), .B1(in121), .B2(new_n105), .ZN(new_n111));
  XNOR2_X1  g038(.A(new_n110), .B(new_n111), .ZN(new_n112));
  XNOR2_X1  g039(.A(new_n109), .B(new_n112), .ZN(new_n113));
  OAI22_X1  g040(.A1(new_n98), .A2(in101), .B1(in97), .B2(new_n99), .ZN(new_n114));
  OAI22_X1  g041(.A1(new_n100), .A2(in109), .B1(in105), .B2(new_n101), .ZN(new_n115));
  XOR2_X1   g042(.A(new_n114), .B(new_n115), .Z(new_n116));
  XNOR2_X1  g043(.A(new_n113), .B(new_n116), .ZN(new_n117));
  XOR2_X1   g044(.A(new_n108), .B(new_n117), .Z(new_n118));
  INV_X1    g045(.A(new_n118), .ZN(new_n119));
  NAND2_X1  g046(.A1(in129), .A2(in137), .ZN(new_n120));
  AOI22_X1  g047(.A1(in1), .A2(new_n78), .B1(new_n74), .B2(in17), .ZN(new_n121));
  XNOR2_X1  g048(.A(new_n120), .B(new_n121), .ZN(new_n122));
  OAI22_X1  g049(.A1(in33), .A2(in49), .B1(new_n82), .B2(new_n86), .ZN(new_n123));
  OAI22_X1  g050(.A1(new_n94), .A2(in85), .B1(in81), .B2(new_n95), .ZN(new_n124));
  OAI22_X1  g051(.A1(new_n96), .A2(in93), .B1(in89), .B2(new_n97), .ZN(new_n125));
  XOR2_X1   g052(.A(new_n124), .B(new_n125), .Z(new_n126));
  XOR2_X1   g053(.A(new_n123), .B(new_n126), .Z(new_n127));
  OAI22_X1  g054(.A1(new_n90), .A2(in69), .B1(in65), .B2(new_n91), .ZN(new_n128));
  OAI22_X1  g055(.A1(new_n92), .A2(in77), .B1(in73), .B2(new_n93), .ZN(new_n129));
  XOR2_X1   g056(.A(new_n128), .B(new_n129), .Z(new_n130));
  XNOR2_X1  g057(.A(new_n127), .B(new_n130), .ZN(new_n131));
  XOR2_X1   g058(.A(new_n122), .B(new_n131), .Z(new_n132));
  OR2_X1    g059(.A1(new_n119), .A2(new_n132), .ZN(new_n133));
  NAND2_X1  g060(.A1(in131), .A2(in137), .ZN(new_n134));
  OAI22_X1  g061(.A1(new_n84), .A2(in57), .B1(in41), .B2(new_n88), .ZN(new_n135));
  XOR2_X1   g062(.A(new_n134), .B(new_n135), .Z(new_n136));
  XOR2_X1   g063(.A(new_n116), .B(new_n136), .Z(new_n137));
  OAI22_X1  g064(.A1(in9), .A2(in25), .B1(new_n76), .B2(new_n80), .ZN(new_n138));
  XNOR2_X1  g065(.A(new_n130), .B(new_n138), .ZN(new_n139));
  XOR2_X1   g066(.A(new_n137), .B(new_n139), .Z(new_n140));
  INV_X1    g067(.A(new_n140), .ZN(new_n141));
  NAND2_X1  g068(.A1(in132), .A2(in137), .ZN(new_n142));
  OAI22_X1  g069(.A1(new_n85), .A2(in61), .B1(in45), .B2(new_n89), .ZN(new_n143));
  XOR2_X1   g070(.A(new_n142), .B(new_n143), .Z(new_n144));
  XNOR2_X1  g071(.A(new_n112), .B(new_n144), .ZN(new_n145));
  OAI22_X1  g072(.A1(in13), .A2(in29), .B1(new_n77), .B2(new_n81), .ZN(new_n146));
  XNOR2_X1  g073(.A(new_n126), .B(new_n146), .ZN(new_n147));
  XOR2_X1   g074(.A(new_n145), .B(new_n147), .Z(new_n148));
  NAND2_X1  g075(.A1(new_n140), .A2(new_n148), .ZN(new_n149));
  OR2_X1    g076(.A1(new_n133), .A2(new_n149), .ZN(new_n150));
  NAND2_X1  g077(.A1(in133), .A2(in137), .ZN(new_n151));
  AOI22_X1  g078(.A1(in65), .A2(new_n94), .B1(new_n90), .B2(in81), .ZN(new_n152));
  XNOR2_X1  g079(.A(new_n151), .B(new_n152), .ZN(new_n153));
  OAI22_X1  g080(.A1(in97), .A2(in113), .B1(new_n98), .B2(new_n102), .ZN(new_n154));
  OAI22_X1  g081(.A1(new_n78), .A2(in21), .B1(in17), .B2(new_n79), .ZN(new_n155));
  OAI22_X1  g082(.A1(new_n80), .A2(in29), .B1(in25), .B2(new_n81), .ZN(new_n156));
  XNOR2_X1  g083(.A(new_n155), .B(new_n156), .ZN(new_n157));
  XNOR2_X1  g084(.A(new_n154), .B(new_n157), .ZN(new_n158));
  OAI22_X1  g085(.A1(new_n74), .A2(in5), .B1(in1), .B2(new_n75), .ZN(new_n159));
  OAI22_X1  g086(.A1(new_n76), .A2(in13), .B1(in9), .B2(new_n77), .ZN(new_n160));
  XOR2_X1   g087(.A(new_n159), .B(new_n160), .Z(new_n161));
  XNOR2_X1  g088(.A(new_n158), .B(new_n161), .ZN(new_n162));
  XOR2_X1   g089(.A(new_n153), .B(new_n162), .Z(new_n163));
  NAND2_X1  g090(.A1(in134), .A2(in137), .ZN(new_n164));
  AOI22_X1  g091(.A1(in69), .A2(new_n95), .B1(new_n91), .B2(in85), .ZN(new_n165));
  XNOR2_X1  g092(.A(new_n164), .B(new_n165), .ZN(new_n166));
  OAI22_X1  g093(.A1(in101), .A2(in117), .B1(new_n99), .B2(new_n103), .ZN(new_n167));
  OAI22_X1  g094(.A1(new_n86), .A2(in53), .B1(in49), .B2(new_n87), .ZN(new_n168));
  OAI22_X1  g095(.A1(new_n88), .A2(in61), .B1(in57), .B2(new_n89), .ZN(new_n169));
  XOR2_X1   g096(.A(new_n168), .B(new_n169), .Z(new_n170));
  XOR2_X1   g097(.A(new_n167), .B(new_n170), .Z(new_n171));
  OAI22_X1  g098(.A1(new_n82), .A2(in37), .B1(in33), .B2(new_n83), .ZN(new_n172));
  OAI22_X1  g099(.A1(new_n84), .A2(in45), .B1(in41), .B2(new_n85), .ZN(new_n173));
  XOR2_X1   g100(.A(new_n172), .B(new_n173), .Z(new_n174));
  XNOR2_X1  g101(.A(new_n171), .B(new_n174), .ZN(new_n175));
  XOR2_X1   g102(.A(new_n166), .B(new_n175), .Z(new_n176));
  INV_X1    g103(.A(new_n176), .ZN(new_n177));
  OR2_X1    g104(.A1(new_n163), .A2(new_n177), .ZN(new_n178));
  OR2_X1    g105(.A1(new_n150), .A2(new_n178), .ZN(new_n179));
  NAND2_X1  g106(.A1(in136), .A2(in137), .ZN(new_n180));
  OAI22_X1  g107(.A1(new_n101), .A2(in125), .B1(in109), .B2(new_n105), .ZN(new_n181));
  XOR2_X1   g108(.A(new_n180), .B(new_n181), .Z(new_n182));
  XNOR2_X1  g109(.A(new_n157), .B(new_n182), .ZN(new_n183));
  OAI22_X1  g110(.A1(in77), .A2(in93), .B1(new_n93), .B2(new_n97), .ZN(new_n184));
  XNOR2_X1  g111(.A(new_n170), .B(new_n184), .ZN(new_n185));
  XOR2_X1   g112(.A(new_n183), .B(new_n185), .Z(new_n186));
  INV_X1    g113(.A(new_n186), .ZN(new_n187));
  NAND2_X1  g114(.A1(in135), .A2(in137), .ZN(new_n188));
  OAI22_X1  g115(.A1(new_n100), .A2(in121), .B1(in105), .B2(new_n104), .ZN(new_n189));
  XOR2_X1   g116(.A(new_n188), .B(new_n189), .Z(new_n190));
  XOR2_X1   g117(.A(new_n161), .B(new_n190), .Z(new_n191));
  OAI22_X1  g118(.A1(in73), .A2(in89), .B1(new_n92), .B2(new_n96), .ZN(new_n192));
  XNOR2_X1  g119(.A(new_n174), .B(new_n192), .ZN(new_n193));
  XOR2_X1   g120(.A(new_n191), .B(new_n193), .Z(new_n194));
  OR2_X1    g121(.A1(new_n187), .A2(new_n194), .ZN(new_n195));
  OR2_X1    g122(.A1(new_n179), .A2(new_n195), .ZN(new_n196));
  XNOR2_X1  g123(.A(in1), .B(new_n196), .ZN(out724));
  NAND2_X1  g124(.A1(new_n119), .A2(new_n132), .ZN(new_n198));
  OR2_X1    g125(.A1(new_n149), .A2(new_n198), .ZN(new_n199));
  OR2_X1    g126(.A1(new_n178), .A2(new_n199), .ZN(new_n200));
  OR2_X1    g127(.A1(new_n195), .A2(new_n200), .ZN(new_n201));
  XNOR2_X1  g128(.A(in5), .B(new_n201), .ZN(out725));
  NAND2_X1  g129(.A1(new_n118), .A2(new_n132), .ZN(new_n203));
  NAND2_X1  g130(.A1(new_n141), .A2(new_n148), .ZN(new_n204));
  OR2_X1    g131(.A1(new_n203), .A2(new_n204), .ZN(new_n205));
  OR2_X1    g132(.A1(new_n178), .A2(new_n205), .ZN(new_n206));
  OR2_X1    g133(.A1(new_n195), .A2(new_n206), .ZN(new_n207));
  XNOR2_X1  g134(.A(in9), .B(new_n207), .ZN(out726));
  OR2_X1    g135(.A1(new_n141), .A2(new_n148), .ZN(new_n209));
  OR2_X1    g136(.A1(new_n203), .A2(new_n209), .ZN(new_n210));
  OR2_X1    g137(.A1(new_n178), .A2(new_n210), .ZN(new_n211));
  OR2_X1    g138(.A1(new_n195), .A2(new_n211), .ZN(new_n212));
  XNOR2_X1  g139(.A(in13), .B(new_n212), .ZN(out727));
  NAND2_X1  g140(.A1(new_n187), .A2(new_n194), .ZN(new_n214));
  OR2_X1    g141(.A1(new_n179), .A2(new_n214), .ZN(new_n215));
  XNOR2_X1  g142(.A(in17), .B(new_n215), .ZN(out728));
  OR2_X1    g143(.A1(new_n200), .A2(new_n214), .ZN(new_n217));
  XNOR2_X1  g144(.A(in21), .B(new_n217), .ZN(out729));
  OR2_X1    g145(.A1(new_n206), .A2(new_n214), .ZN(new_n219));
  XNOR2_X1  g146(.A(in25), .B(new_n219), .ZN(out730));
  OR2_X1    g147(.A1(new_n211), .A2(new_n214), .ZN(new_n221));
  XNOR2_X1  g148(.A(in29), .B(new_n221), .ZN(out731));
  NAND2_X1  g149(.A1(new_n163), .A2(new_n177), .ZN(new_n223));
  OR2_X1    g150(.A1(new_n150), .A2(new_n223), .ZN(new_n224));
  OR2_X1    g151(.A1(new_n195), .A2(new_n224), .ZN(new_n225));
  XNOR2_X1  g152(.A(in33), .B(new_n225), .ZN(out732));
  OR2_X1    g153(.A1(new_n199), .A2(new_n223), .ZN(new_n227));
  OR2_X1    g154(.A1(new_n195), .A2(new_n227), .ZN(new_n228));
  XNOR2_X1  g155(.A(in37), .B(new_n228), .ZN(out733));
  OR2_X1    g156(.A1(new_n205), .A2(new_n223), .ZN(new_n230));
  OR2_X1    g157(.A1(new_n195), .A2(new_n230), .ZN(new_n231));
  XNOR2_X1  g158(.A(in41), .B(new_n231), .ZN(out734));
  OR2_X1    g159(.A1(new_n210), .A2(new_n223), .ZN(new_n233));
  OR2_X1    g160(.A1(new_n195), .A2(new_n233), .ZN(new_n234));
  XNOR2_X1  g161(.A(in45), .B(new_n234), .ZN(out735));
  OR2_X1    g162(.A1(new_n214), .A2(new_n224), .ZN(new_n236));
  XNOR2_X1  g163(.A(in49), .B(new_n236), .ZN(out736));
  OR2_X1    g164(.A1(new_n214), .A2(new_n227), .ZN(new_n238));
  XNOR2_X1  g165(.A(in53), .B(new_n238), .ZN(out737));
  OR2_X1    g166(.A1(new_n214), .A2(new_n230), .ZN(new_n240));
  XNOR2_X1  g167(.A(in57), .B(new_n240), .ZN(out738));
  OR2_X1    g168(.A1(new_n214), .A2(new_n233), .ZN(new_n242));
  XNOR2_X1  g169(.A(in61), .B(new_n242), .ZN(out739));
  NAND2_X1  g170(.A1(new_n186), .A2(new_n194), .ZN(new_n244));
  OR2_X1    g171(.A1(new_n178), .A2(new_n244), .ZN(new_n245));
  OR2_X1    g172(.A1(new_n133), .A2(new_n245), .ZN(new_n246));
  OR2_X1    g173(.A1(new_n204), .A2(new_n246), .ZN(new_n247));
  XNOR2_X1  g174(.A(in65), .B(new_n247), .ZN(out740));
  OR2_X1    g175(.A1(new_n223), .A2(new_n244), .ZN(new_n249));
  OR2_X1    g176(.A1(new_n133), .A2(new_n249), .ZN(new_n250));
  OR2_X1    g177(.A1(new_n204), .A2(new_n250), .ZN(new_n251));
  XNOR2_X1  g178(.A(in69), .B(new_n251), .ZN(out741));
  NAND2_X1  g179(.A1(new_n163), .A2(new_n176), .ZN(new_n253));
  OR2_X1    g180(.A1(new_n195), .A2(new_n253), .ZN(new_n254));
  OR2_X1    g181(.A1(new_n133), .A2(new_n254), .ZN(new_n255));
  OR2_X1    g182(.A1(new_n204), .A2(new_n255), .ZN(new_n256));
  XNOR2_X1  g183(.A(in73), .B(new_n256), .ZN(out742));
  OR2_X1    g184(.A1(new_n214), .A2(new_n253), .ZN(new_n258));
  OR2_X1    g185(.A1(new_n133), .A2(new_n258), .ZN(new_n259));
  OR2_X1    g186(.A1(new_n204), .A2(new_n259), .ZN(new_n260));
  XNOR2_X1  g187(.A(in77), .B(new_n260), .ZN(out743));
  OR2_X1    g188(.A1(new_n209), .A2(new_n246), .ZN(new_n262));
  XNOR2_X1  g189(.A(in81), .B(new_n262), .ZN(out744));
  OR2_X1    g190(.A1(new_n209), .A2(new_n250), .ZN(new_n264));
  XNOR2_X1  g191(.A(in85), .B(new_n264), .ZN(out745));
  OR2_X1    g192(.A1(new_n209), .A2(new_n255), .ZN(new_n266));
  XNOR2_X1  g193(.A(in89), .B(new_n266), .ZN(out746));
  OR2_X1    g194(.A1(new_n209), .A2(new_n259), .ZN(new_n268));
  XNOR2_X1  g195(.A(in93), .B(new_n268), .ZN(out747));
  OR2_X1    g196(.A1(new_n198), .A2(new_n245), .ZN(new_n270));
  OR2_X1    g197(.A1(new_n204), .A2(new_n270), .ZN(new_n271));
  XNOR2_X1  g198(.A(in97), .B(new_n271), .ZN(out748));
  OR2_X1    g199(.A1(new_n198), .A2(new_n249), .ZN(new_n273));
  OR2_X1    g200(.A1(new_n204), .A2(new_n273), .ZN(new_n274));
  XNOR2_X1  g201(.A(in101), .B(new_n274), .ZN(out749));
  OR2_X1    g202(.A1(new_n198), .A2(new_n254), .ZN(new_n276));
  OR2_X1    g203(.A1(new_n204), .A2(new_n276), .ZN(new_n277));
  XNOR2_X1  g204(.A(in105), .B(new_n277), .ZN(out750));
  OR2_X1    g205(.A1(new_n198), .A2(new_n258), .ZN(new_n279));
  OR2_X1    g206(.A1(new_n204), .A2(new_n279), .ZN(new_n280));
  XNOR2_X1  g207(.A(in109), .B(new_n280), .ZN(out751));
  OR2_X1    g208(.A1(new_n209), .A2(new_n270), .ZN(new_n282));
  XNOR2_X1  g209(.A(in113), .B(new_n282), .ZN(out752));
  OR2_X1    g210(.A1(new_n209), .A2(new_n273), .ZN(new_n284));
  XNOR2_X1  g211(.A(in117), .B(new_n284), .ZN(out753));
  OR2_X1    g212(.A1(new_n209), .A2(new_n276), .ZN(new_n286));
  XNOR2_X1  g213(.A(in121), .B(new_n286), .ZN(out754));
  OR2_X1    g214(.A1(new_n209), .A2(new_n279), .ZN(new_n288));
  XNOR2_X1  g215(.A(in125), .B(new_n288), .ZN(out755));
endmodule


