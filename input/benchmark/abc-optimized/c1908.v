// Benchmark "iscas85-original/c1908" written by ABC on Sat Nov 18 15:15:10 2023

module c1908  ( 
    G1, G2, G3, G4, G5, G6, G7, G8, G9, G10, G11, G12, G13, G14, G15, G16,
    G17, G18, G19, G20, G21, G22, G23, G24, G25, G26, G27, G28, G29, G30,
    G31, G32, G33,
    G1884, G1885, G1886, G1887, G1888, G1889, G1890, G1891, G1892, G1893,
    G1894, G1895, G1896, G1897, G1898, G1899, G1900, G1901, G1902, G1903,
    G1904, G1905, G1906, G1907, G1908  );
  input  G1, G2, G3, G4, G5, G6, G7, G8, G9, G10, G11, G12, G13, G14,
    G15, G16, G17, G18, G19, G20, G21, G22, G23, G24, G25, G26, G27, G28,
    G29, G30, G31, G32, G33;
  output G1884, G1885, G1886, G1887, G1888, G1889, G1890, G1891, G1892, G1893,
    G1894, G1895, G1896, G1897, G1898, G1899, G1900, G1901, G1902, G1903,
    G1904, G1905, G1906, G1907, G1908;
  wire new_n59, new_n60, new_n61, new_n62, new_n63, new_n64, new_n65,
    new_n66, new_n67, new_n68, new_n69, new_n70, new_n71, new_n72, new_n73,
    new_n74, new_n75, new_n76, new_n77, new_n78, new_n79, new_n80, new_n81,
    new_n82, new_n83, new_n84, new_n85, new_n86, new_n87, new_n88, new_n89,
    new_n90, new_n91, new_n92, new_n93, new_n94, new_n95, new_n96, new_n97,
    new_n98, new_n99, new_n100, new_n101, new_n102, new_n103, new_n104,
    new_n105, new_n106, new_n107, new_n108, new_n109, new_n110, new_n111,
    new_n112, new_n113, new_n114, new_n115, new_n116, new_n117, new_n118,
    new_n119, new_n120, new_n121, new_n122, new_n123, new_n124, new_n125,
    new_n126, new_n127, new_n128, new_n129, new_n130, new_n131, new_n132,
    new_n133, new_n134, new_n135, new_n136, new_n137, new_n138, new_n139,
    new_n140, new_n141, new_n142, new_n143, new_n144, new_n145, new_n146,
    new_n147, new_n148, new_n149, new_n150, new_n151, new_n152, new_n153,
    new_n154, new_n155, new_n156, new_n157, new_n158, new_n159, new_n164,
    new_n165, new_n166, new_n167, new_n171, new_n172, new_n177, new_n179,
    new_n180, new_n185, new_n186, new_n187, new_n189, new_n190, new_n191,
    new_n193, new_n194, new_n196, new_n197, new_n199, new_n200, new_n202,
    new_n203, new_n205, new_n206, new_n207, new_n208, new_n210, new_n211,
    new_n212, new_n213;
  INV_X1    g000(.A(G1), .ZN(new_n59));
  INV_X1    g001(.A(G2), .ZN(new_n60));
  INV_X1    g002(.A(G3), .ZN(new_n61));
  INV_X1    g003(.A(G4), .ZN(new_n62));
  INV_X1    g004(.A(G5), .ZN(new_n63));
  INV_X1    g005(.A(G6), .ZN(new_n64));
  INV_X1    g006(.A(G7), .ZN(new_n65));
  INV_X1    g007(.A(G8), .ZN(new_n66));
  INV_X1    g008(.A(G9), .ZN(new_n67));
  INV_X1    g009(.A(G10), .ZN(new_n68));
  INV_X1    g010(.A(G12), .ZN(new_n69));
  INV_X1    g011(.A(G13), .ZN(new_n70));
  INV_X1    g012(.A(G14), .ZN(new_n71));
  INV_X1    g013(.A(G15), .ZN(new_n72));
  INV_X1    g014(.A(G16), .ZN(new_n73));
  INV_X1    g015(.A(G22), .ZN(new_n74));
  INV_X1    g016(.A(G23), .ZN(new_n75));
  INV_X1    g017(.A(G24), .ZN(new_n76));
  INV_X1    g018(.A(G27), .ZN(new_n77));
  INV_X1    g019(.A(G30), .ZN(new_n78));
  INV_X1    g020(.A(G31), .ZN(new_n79));
  INV_X1    g021(.A(G32), .ZN(new_n80));
  INV_X1    g022(.A(G33), .ZN(new_n81));
  OAI21_X1  g023(.A(new_n79), .B1(G23), .B2(new_n76), .ZN(new_n82));
  NOR3_X1   g024(.A1(G29), .A2(G33), .A3(new_n82), .ZN(new_n83));
  NOR2_X1   g025(.A1(G32), .A2(G33), .ZN(new_n84));
  INV_X1    g026(.A(new_n84), .ZN(new_n85));
  AOI21_X1  g027(.A(new_n85), .B1(new_n75), .B2(G24), .ZN(new_n86));
  OAI22_X1  g028(.A1(G5), .A2(G8), .B1(new_n63), .B2(new_n66), .ZN(new_n87));
  XNOR2_X1  g029(.A(G2), .B(new_n87), .ZN(new_n88));
  OAI22_X1  g030(.A1(G9), .A2(G14), .B1(new_n67), .B2(new_n71), .ZN(new_n89));
  INV_X1    g031(.A(new_n89), .ZN(new_n90));
  OAI22_X1  g032(.A1(G16), .A2(new_n90), .B1(new_n73), .B2(new_n89), .ZN(new_n91));
  NAND3_X1  g033(.A1(G18), .A2(new_n76), .A3(new_n81), .ZN(new_n92));
  XNOR2_X1  g034(.A(G11), .B(new_n92), .ZN(new_n93));
  XOR2_X1   g035(.A(new_n72), .B(new_n93), .Z(new_n94));
  XNOR2_X1  g036(.A(new_n91), .B(new_n94), .ZN(new_n95));
  XOR2_X1   g037(.A(new_n88), .B(new_n95), .Z(new_n96));
  NOR2_X1   g038(.A1(G31), .A2(new_n96), .ZN(new_n97));
  INV_X1    g039(.A(new_n97), .ZN(new_n98));
  OAI22_X1  g040(.A1(new_n64), .A2(G8), .B1(G6), .B2(new_n66), .ZN(new_n99));
  OAI22_X1  g041(.A1(G10), .A2(G15), .B1(new_n68), .B2(new_n72), .ZN(new_n100));
  NAND3_X1  g042(.A1(G19), .A2(new_n75), .A3(new_n81), .ZN(new_n101));
  OAI22_X1  g043(.A1(new_n61), .A2(G12), .B1(G3), .B2(new_n69), .ZN(new_n102));
  XOR2_X1   g044(.A(new_n101), .B(new_n102), .Z(new_n103));
  XNOR2_X1  g045(.A(new_n100), .B(new_n103), .ZN(new_n104));
  XOR2_X1   g046(.A(new_n99), .B(new_n104), .Z(new_n105));
  INV_X1    g047(.A(new_n105), .ZN(new_n106));
  NOR2_X1   g048(.A1(G31), .A2(new_n105), .ZN(new_n107));
  XNOR2_X1  g049(.A(G28), .B(new_n107), .ZN(new_n108));
  OAI221_X1 g050(.A(new_n108), .B1(new_n77), .B2(new_n97), .C1(G27), .C2(new_n98), .ZN(new_n109));
  OAI22_X1  g051(.A1(new_n65), .A2(G10), .B1(G7), .B2(new_n68), .ZN(new_n110));
  NAND3_X1  g052(.A1(G20), .A2(new_n75), .A3(new_n81), .ZN(new_n111));
  XNOR2_X1  g053(.A(G4), .B(new_n111), .ZN(new_n112));
  XOR2_X1   g054(.A(G13), .B(new_n91), .Z(new_n113));
  XNOR2_X1  g055(.A(new_n112), .B(new_n113), .ZN(new_n114));
  XOR2_X1   g056(.A(new_n110), .B(new_n114), .Z(new_n115));
  NOR2_X1   g057(.A1(G31), .A2(new_n115), .ZN(new_n116));
  OAI21_X1  g058(.A(G19), .B1(G23), .B2(G31), .ZN(new_n117));
  XNOR2_X1  g059(.A(new_n116), .B(new_n117), .ZN(new_n118));
  OAI22_X1  g060(.A1(new_n64), .A2(G7), .B1(G6), .B2(new_n65), .ZN(new_n119));
  XOR2_X1   g061(.A(new_n63), .B(new_n119), .Z(new_n120));
  XNOR2_X1  g062(.A(new_n59), .B(new_n120), .ZN(new_n121));
  OAI22_X1  g063(.A1(new_n72), .A2(G16), .B1(G15), .B2(new_n73), .ZN(new_n122));
  XOR2_X1   g064(.A(new_n68), .B(new_n122), .Z(new_n123));
  OAI22_X1  g065(.A1(new_n69), .A2(G13), .B1(G12), .B2(new_n70), .ZN(new_n124));
  XNOR2_X1  g066(.A(G11), .B(new_n124), .ZN(new_n125));
  XOR2_X1   g067(.A(new_n123), .B(new_n125), .Z(new_n126));
  INV_X1    g068(.A(new_n126), .ZN(new_n127));
  NAND3_X1  g069(.A1(G17), .A2(new_n76), .A3(new_n81), .ZN(new_n128));
  XNOR2_X1  g070(.A(new_n127), .B(new_n128), .ZN(new_n129));
  XOR2_X1   g071(.A(new_n121), .B(new_n129), .Z(new_n130));
  NOR2_X1   g072(.A1(G31), .A2(new_n130), .ZN(new_n131));
  XOR2_X1   g073(.A(G26), .B(new_n131), .Z(new_n132));
  OR3_X1    g074(.A1(new_n118), .A2(new_n132), .A3(new_n109), .ZN(new_n133));
  OAI21_X1  g075(.A(G20), .B1(G23), .B2(G31), .ZN(new_n134));
  INV_X1    g076(.A(new_n134), .ZN(new_n135));
  OAI22_X1  g077(.A1(new_n60), .A2(G3), .B1(G2), .B2(new_n61), .ZN(new_n136));
  XNOR2_X1  g078(.A(new_n59), .B(new_n136), .ZN(new_n137));
  NOR2_X1   g079(.A1(new_n74), .A2(G33), .ZN(new_n138));
  XNOR2_X1  g080(.A(new_n137), .B(new_n138), .ZN(new_n139));
  AOI22_X1  g081(.A1(G4), .A2(new_n71), .B1(new_n62), .B2(G14), .ZN(new_n140));
  XNOR2_X1  g082(.A(new_n126), .B(new_n140), .ZN(new_n141));
  XOR2_X1   g083(.A(new_n139), .B(new_n141), .Z(new_n142));
  NOR2_X1   g084(.A1(G31), .A2(new_n142), .ZN(new_n143));
  XOR2_X1   g085(.A(G25), .B(new_n143), .Z(new_n144));
  OAI21_X1  g086(.A(G18), .B1(G24), .B2(G31), .ZN(new_n145));
  INV_X1    g087(.A(new_n145), .ZN(new_n146));
  OAI21_X1  g088(.A(G17), .B1(G24), .B2(G31), .ZN(new_n147));
  OAI22_X1  g089(.A1(new_n62), .A2(G8), .B1(G4), .B2(new_n66), .ZN(new_n148));
  XNOR2_X1  g090(.A(new_n120), .B(new_n137), .ZN(new_n149));
  XOR2_X1   g091(.A(new_n148), .B(new_n149), .Z(new_n150));
  AND2_X1   g092(.A1(G21), .A2(new_n81), .ZN(new_n151));
  XNOR2_X1  g093(.A(new_n67), .B(new_n151), .ZN(new_n152));
  XNOR2_X1  g094(.A(new_n123), .B(new_n152), .ZN(new_n153));
  XNOR2_X1  g095(.A(new_n150), .B(new_n153), .ZN(new_n154));
  NAND2_X1  g096(.A1(new_n79), .A2(new_n154), .ZN(new_n155));
  XOR2_X1   g097(.A(new_n147), .B(new_n155), .Z(new_n156));
  AOI221_X1 g098(.A(new_n133), .B1(new_n135), .B2(new_n144), .C1(new_n146), .C2(new_n156), .ZN(new_n157));
  OAI21_X1  g099(.A(new_n157), .B1(new_n83), .B2(new_n86), .ZN(new_n158));
  INV_X1    g100(.A(new_n158), .ZN(new_n159));
  AOI22_X1  g101(.A1(G1), .A2(new_n158), .B1(new_n59), .B2(new_n159), .ZN(G1884));
  AOI22_X1  g102(.A1(G2), .A2(new_n158), .B1(new_n60), .B2(new_n159), .ZN(G1885));
  AOI22_X1  g103(.A1(G3), .A2(new_n158), .B1(new_n61), .B2(new_n159), .ZN(G1886));
  AOI22_X1  g104(.A1(G4), .A2(new_n158), .B1(new_n62), .B2(new_n159), .ZN(G1887));
  NAND2_X1  g105(.A1(new_n78), .A2(new_n81), .ZN(new_n164));
  NOR2_X1   g106(.A1(new_n82), .A2(new_n164), .ZN(new_n165));
  OAI21_X1  g107(.A(new_n157), .B1(new_n86), .B2(new_n165), .ZN(new_n166));
  INV_X1    g108(.A(new_n166), .ZN(new_n167));
  AOI22_X1  g109(.A1(G10), .A2(new_n166), .B1(new_n68), .B2(new_n167), .ZN(G1888));
  AOI22_X1  g110(.A1(G15), .A2(new_n166), .B1(new_n72), .B2(new_n167), .ZN(G1889));
  AOI22_X1  g111(.A1(G16), .A2(new_n166), .B1(new_n73), .B2(new_n167), .ZN(G1890));
  NOR2_X1   g112(.A1(new_n134), .A2(new_n158), .ZN(new_n171));
  INV_X1    g113(.A(new_n171), .ZN(new_n172));
  AOI22_X1  g114(.A1(G5), .A2(new_n172), .B1(new_n63), .B2(new_n171), .ZN(G1891));
  AOI22_X1  g115(.A1(G6), .A2(new_n172), .B1(new_n64), .B2(new_n171), .ZN(G1892));
  AOI22_X1  g116(.A1(G7), .A2(new_n172), .B1(new_n65), .B2(new_n171), .ZN(G1893));
  AOI22_X1  g117(.A1(G8), .A2(new_n172), .B1(new_n66), .B2(new_n171), .ZN(G1894));
  NOR2_X1   g118(.A1(new_n134), .A2(new_n166), .ZN(new_n177));
  XNOR2_X1  g119(.A(G9), .B(new_n177), .ZN(G1895));
  NOR2_X1   g120(.A1(new_n145), .A2(new_n166), .ZN(new_n179));
  INV_X1    g121(.A(new_n179), .ZN(new_n180));
  XOR2_X1   g122(.A(G11), .B(new_n180), .Z(G1896));
  AOI22_X1  g123(.A1(G12), .A2(new_n180), .B1(new_n69), .B2(new_n179), .ZN(G1897));
  AOI22_X1  g124(.A1(G13), .A2(new_n180), .B1(new_n70), .B2(new_n179), .ZN(G1898));
  AOI22_X1  g125(.A1(G14), .A2(new_n180), .B1(new_n71), .B2(new_n179), .ZN(G1899));
  NOR2_X1   g126(.A1(new_n159), .A2(new_n167), .ZN(new_n185));
  INV_X1    g127(.A(new_n185), .ZN(new_n186));
  OR4_X1    g128(.A1(new_n135), .A2(new_n146), .A3(new_n144), .A4(new_n156), .ZN(new_n187));
  OAI221_X1 g129(.A(new_n81), .B1(new_n133), .B2(new_n187), .C1(new_n80), .C2(new_n185), .ZN(G1900));
  NAND2_X1  g130(.A1(new_n79), .A2(new_n186), .ZN(new_n189));
  NOR2_X1   g131(.A1(new_n147), .A2(new_n189), .ZN(new_n190));
  NOR2_X1   g132(.A1(new_n154), .A2(new_n190), .ZN(new_n191));
  AOI211_X1 g133(.A(new_n84), .B(new_n191), .C1(new_n154), .C2(new_n190), .ZN(G1901));
  NAND3_X1  g134(.A1(new_n79), .A2(new_n186), .A3(G25), .ZN(new_n193));
  OAI21_X1  g135(.A(new_n85), .B1(new_n142), .B2(new_n193), .ZN(new_n194));
  AOI21_X1  g136(.A(new_n194), .B1(new_n142), .B2(new_n193), .ZN(G1902));
  NOR2_X1   g137(.A1(new_n77), .A2(new_n189), .ZN(new_n196));
  NOR2_X1   g138(.A1(new_n96), .A2(new_n196), .ZN(new_n197));
  AOI211_X1 g139(.A(new_n84), .B(new_n197), .C1(new_n96), .C2(new_n196), .ZN(G1903));
  NAND3_X1  g140(.A1(new_n79), .A2(new_n186), .A3(G28), .ZN(new_n199));
  OAI21_X1  g141(.A(new_n85), .B1(new_n106), .B2(new_n199), .ZN(new_n200));
  AOI21_X1  g142(.A(new_n200), .B1(new_n106), .B2(new_n199), .ZN(G1904));
  NOR2_X1   g143(.A1(new_n117), .A2(new_n189), .ZN(new_n202));
  OAI21_X1  g144(.A(new_n85), .B1(new_n115), .B2(new_n202), .ZN(new_n203));
  AOI21_X1  g145(.A(new_n203), .B1(new_n115), .B2(new_n202), .ZN(G1905));
  OAI21_X1  g146(.A(new_n150), .B1(G29), .B2(G33), .ZN(new_n205));
  NAND2_X1  g147(.A1(G21), .A2(G29), .ZN(new_n206));
  OAI21_X1  g148(.A(new_n81), .B1(new_n159), .B2(new_n206), .ZN(new_n207));
  AOI21_X1  g149(.A(new_n207), .B1(new_n159), .B2(new_n206), .ZN(new_n208));
  XNOR2_X1  g150(.A(new_n205), .B(new_n208), .ZN(G1906));
  NOR2_X1   g151(.A1(new_n74), .A2(new_n78), .ZN(new_n210));
  INV_X1    g152(.A(new_n210), .ZN(new_n211));
  AOI221_X1 g153(.A(G33), .B1(new_n166), .B2(new_n210), .C1(new_n167), .C2(new_n211), .ZN(new_n212));
  OAI221_X1 g154(.A(new_n164), .B1(new_n89), .B2(new_n127), .C1(new_n90), .C2(new_n126), .ZN(new_n213));
  XNOR2_X1  g155(.A(new_n212), .B(new_n213), .ZN(G1907));
  AOI211_X1 g156(.A(new_n84), .B(new_n130), .C1(G26), .C2(new_n186), .ZN(G1908));
endmodule


