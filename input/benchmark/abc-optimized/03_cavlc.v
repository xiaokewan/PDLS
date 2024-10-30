// Benchmark "epfl-original/random_control/3_cavlc" written by ABC on Sat Nov 18 16:12:44 2023

module \epfl-original/random_control/3_cavlc  ( 
    \totalcoeffs[0] , \totalcoeffs[1] , \totalcoeffs[2] , \totalcoeffs[3] ,
    \totalcoeffs[4] , \ctable[0] , \ctable[1] , \ctable[2] ,
    \trailingones[0] , \trailingones[1] ,
    \coeff_token[0] , \coeff_token[1] , \coeff_token[2] , \coeff_token[3] ,
    \coeff_token[4] , \coeff_token[5] , \ctoken_len[0] , \ctoken_len[1] ,
    \ctoken_len[2] , \ctoken_len[3] , \ctoken_len[4]   );
  input  \totalcoeffs[0] , \totalcoeffs[1] , \totalcoeffs[2] ,
    \totalcoeffs[3] , \totalcoeffs[4] , \ctable[0] , \ctable[1] ,
    \ctable[2] , \trailingones[0] , \trailingones[1] ;
  output \coeff_token[0] , \coeff_token[1] , \coeff_token[2] ,
    \coeff_token[3] , \coeff_token[4] , \coeff_token[5] , \ctoken_len[0] ,
    \ctoken_len[1] , \ctoken_len[2] , \ctoken_len[3] , \ctoken_len[4] ;
  wire new_n22, new_n23, new_n24, new_n25, new_n26, new_n27, new_n28,
    new_n29, new_n30, new_n31, new_n32, new_n33, new_n34, new_n35, new_n36,
    new_n37, new_n38, new_n39, new_n40, new_n41, new_n42, new_n43, new_n44,
    new_n45, new_n46, new_n47, new_n48, new_n49, new_n50, new_n51, new_n52,
    new_n53, new_n54, new_n55, new_n56, new_n57, new_n58, new_n59, new_n60,
    new_n61, new_n62, new_n63, new_n64, new_n65, new_n66, new_n67, new_n68,
    new_n69, new_n70, new_n71, new_n72, new_n73, new_n74, new_n75, new_n76,
    new_n77, new_n78, new_n79, new_n80, new_n81, new_n82, new_n83, new_n84,
    new_n85, new_n86, new_n87, new_n88, new_n89, new_n90, new_n91, new_n92,
    new_n93, new_n94, new_n95, new_n96, new_n97, new_n98, new_n99,
    new_n100, new_n101, new_n102, new_n103, new_n104, new_n105, new_n106,
    new_n107, new_n108, new_n109, new_n110, new_n111, new_n112, new_n113,
    new_n114, new_n116, new_n117, new_n118, new_n119, new_n120, new_n121,
    new_n122, new_n123, new_n124, new_n125, new_n126, new_n127, new_n128,
    new_n129, new_n130, new_n131, new_n132, new_n133, new_n134, new_n135,
    new_n136, new_n137, new_n138, new_n139, new_n140, new_n141, new_n142,
    new_n143, new_n144, new_n145, new_n146, new_n147, new_n148, new_n149,
    new_n150, new_n151, new_n152, new_n153, new_n154, new_n155, new_n156,
    new_n157, new_n158, new_n159, new_n160, new_n161, new_n162, new_n163,
    new_n164, new_n165, new_n166, new_n167, new_n168, new_n169, new_n170,
    new_n171, new_n172, new_n173, new_n174, new_n175, new_n176, new_n177,
    new_n178, new_n179, new_n180, new_n181, new_n182, new_n184, new_n185,
    new_n186, new_n187, new_n188, new_n189, new_n190, new_n191, new_n192,
    new_n193, new_n194, new_n195, new_n196, new_n197, new_n198, new_n199,
    new_n200, new_n201, new_n202, new_n203, new_n204, new_n205, new_n206,
    new_n207, new_n208, new_n209, new_n210, new_n211, new_n212, new_n213,
    new_n214, new_n215, new_n216, new_n217, new_n218, new_n219, new_n220,
    new_n221, new_n222, new_n223, new_n224, new_n225, new_n226, new_n227,
    new_n228, new_n229, new_n230, new_n231, new_n232, new_n233, new_n234,
    new_n235, new_n236, new_n237, new_n238, new_n239, new_n241, new_n242,
    new_n243, new_n244, new_n245, new_n246, new_n247, new_n248, new_n249,
    new_n250, new_n251, new_n252, new_n253, new_n254, new_n255, new_n256,
    new_n257, new_n258, new_n259, new_n260, new_n261, new_n262, new_n263,
    new_n264, new_n265, new_n266, new_n267, new_n268, new_n269, new_n270,
    new_n271, new_n272, new_n273, new_n274, new_n275, new_n276, new_n277,
    new_n278, new_n279, new_n281, new_n282, new_n283, new_n284, new_n286,
    new_n287, new_n288, new_n289, new_n291, new_n292, new_n293, new_n294,
    new_n295, new_n296, new_n297, new_n298, new_n299, new_n300, new_n301,
    new_n302, new_n303, new_n304, new_n305, new_n306, new_n307, new_n308,
    new_n309, new_n310, new_n311, new_n312, new_n313, new_n314, new_n315,
    new_n316, new_n317, new_n318, new_n319, new_n320, new_n321, new_n322,
    new_n323, new_n324, new_n325, new_n326, new_n327, new_n328, new_n329,
    new_n330, new_n331, new_n332, new_n333, new_n334, new_n336, new_n337,
    new_n338, new_n339, new_n340, new_n341, new_n342, new_n343, new_n344,
    new_n345, new_n346, new_n347, new_n348, new_n349, new_n350, new_n351,
    new_n352, new_n353, new_n354, new_n355, new_n356, new_n357, new_n358,
    new_n359, new_n360, new_n361, new_n362, new_n363, new_n364, new_n365,
    new_n366, new_n367, new_n368, new_n369, new_n370, new_n371, new_n373,
    new_n374, new_n375, new_n376, new_n377, new_n378, new_n379, new_n380,
    new_n381, new_n382, new_n383, new_n384, new_n385, new_n386, new_n387,
    new_n388, new_n389, new_n390, new_n391, new_n392, new_n393, new_n394,
    new_n396, new_n397, new_n398, new_n399, new_n400, new_n401, new_n402,
    new_n403, new_n404, new_n405, new_n406, new_n407, new_n408, new_n409,
    new_n410, new_n411, new_n412, new_n413, new_n414, new_n416;
  INV_X1    g000(.A(\ctable[2] ), .ZN(new_n22));
  NOR2_X1   g001(.A1(\totalcoeffs[0] ), .A2(\totalcoeffs[2] ), .ZN(new_n23));
  NOR2_X1   g002(.A1(\totalcoeffs[1] ), .A2(\totalcoeffs[3] ), .ZN(new_n24));
  INV_X1    g003(.A(\ctable[0] ), .ZN(new_n25));
  INV_X1    g004(.A(\trailingones[0] ), .ZN(new_n26));
  NOR2_X1   g005(.A1(\ctable[1] ), .A2(new_n26), .ZN(new_n27));
  INV_X1    g006(.A(\totalcoeffs[4] ), .ZN(new_n28));
  NOR2_X1   g007(.A1(new_n28), .A2(new_n26), .ZN(new_n29));
  NOR2_X1   g008(.A1(\ctable[1] ), .A2(\trailingones[1] ), .ZN(new_n30));
  NOR2_X1   g009(.A1(new_n29), .A2(new_n30), .ZN(new_n31));
  INV_X1    g010(.A(\ctable[1] ), .ZN(new_n32));
  NOR2_X1   g011(.A1(new_n25), .A2(new_n32), .ZN(new_n33));
  INV_X1    g012(.A(\trailingones[1] ), .ZN(new_n34));
  NOR2_X1   g013(.A1(new_n28), .A2(new_n34), .ZN(new_n35));
  AOI21_X1  g014(.A(new_n35), .B1(\ctable[1] ), .B2(new_n34), .ZN(new_n36));
  OAI33_X1  g015(.A1(new_n25), .A2(new_n27), .A3(new_n31), .B1(\trailingones[0] ), .B2(new_n33), .B3(new_n36), .ZN(new_n37));
  NAND4_X1  g016(.A1(new_n22), .A2(new_n23), .A3(new_n24), .A4(new_n37), .ZN(new_n38));
  NOR2_X1   g017(.A1(\totalcoeffs[1] ), .A2(new_n34), .ZN(new_n39));
  INV_X1    g018(.A(\totalcoeffs[3] ), .ZN(new_n40));
  NAND2_X1  g019(.A1(new_n40), .A2(new_n25), .ZN(new_n41));
  INV_X1    g020(.A(\totalcoeffs[1] ), .ZN(new_n42));
  NOR2_X1   g021(.A1(\totalcoeffs[0] ), .A2(new_n34), .ZN(new_n43));
  NOR2_X1   g022(.A1(new_n42), .A2(new_n43), .ZN(new_n44));
  NOR2_X1   g023(.A1(\totalcoeffs[0] ), .A2(\totalcoeffs[1] ), .ZN(new_n45));
  NOR2_X1   g024(.A1(new_n42), .A2(new_n34), .ZN(new_n46));
  NOR2_X1   g025(.A1(\totalcoeffs[1] ), .A2(\trailingones[1] ), .ZN(new_n47));
  NOR2_X1   g026(.A1(new_n46), .A2(new_n47), .ZN(new_n48));
  OAI33_X1  g027(.A1(new_n39), .A2(new_n41), .A3(new_n44), .B1(\ctable[2] ), .B2(new_n45), .B3(new_n48), .ZN(new_n49));
  INV_X1    g028(.A(new_n49), .ZN(new_n50));
  NAND2_X1  g029(.A1(\totalcoeffs[1] ), .A2(new_n34), .ZN(new_n51));
  NAND2_X1  g030(.A1(\totalcoeffs[0] ), .A2(new_n51), .ZN(new_n52));
  INV_X1    g031(.A(\totalcoeffs[2] ), .ZN(new_n53));
  NOR2_X1   g032(.A1(new_n53), .A2(\trailingones[1] ), .ZN(new_n54));
  INV_X1    g033(.A(new_n43), .ZN(new_n55));
  INV_X1    g034(.A(\totalcoeffs[0] ), .ZN(new_n56));
  NOR2_X1   g035(.A1(new_n56), .A2(\trailingones[1] ), .ZN(new_n57));
  INV_X1    g036(.A(new_n57), .ZN(new_n58));
  NAND2_X1  g037(.A1(new_n55), .A2(new_n58), .ZN(new_n59));
  NAND2_X1  g038(.A1(new_n53), .A2(\ctable[0] ), .ZN(new_n60));
  NOR2_X1   g039(.A1(new_n59), .A2(new_n60), .ZN(new_n61));
  OAI21_X1  g040(.A(new_n52), .B1(new_n54), .B2(new_n61), .ZN(new_n62));
  OAI21_X1  g041(.A(new_n62), .B1(new_n42), .B2(\totalcoeffs[3] ), .ZN(new_n63));
  NOR2_X1   g042(.A1(\totalcoeffs[2] ), .A2(\totalcoeffs[3] ), .ZN(new_n64));
  INV_X1    g043(.A(new_n64), .ZN(new_n65));
  NAND2_X1  g044(.A1(\trailingones[1] ), .A2(new_n65), .ZN(new_n66));
  NAND2_X1  g045(.A1(\totalcoeffs[0] ), .A2(\totalcoeffs[3] ), .ZN(new_n67));
  NAND2_X1  g046(.A1(new_n66), .A2(new_n67), .ZN(new_n68));
  AOI21_X1  g047(.A(new_n63), .B1(new_n42), .B2(new_n68), .ZN(new_n69));
  OAI22_X1  g048(.A1(\totalcoeffs[2] ), .A2(new_n50), .B1(\ctable[2] ), .B2(new_n69), .ZN(new_n70));
  NOR2_X1   g049(.A1(\ctable[0] ), .A2(\trailingones[1] ), .ZN(new_n71));
  OAI21_X1  g050(.A(new_n71), .B1(new_n42), .B2(\ctable[2] ), .ZN(new_n72));
  NOR2_X1   g051(.A1(new_n22), .A2(new_n26), .ZN(new_n73));
  AOI22_X1  g052(.A1(new_n25), .A2(new_n73), .B1(new_n22), .B2(\trailingones[1] ), .ZN(new_n74));
  OAI21_X1  g053(.A(new_n72), .B1(new_n42), .B2(new_n74), .ZN(new_n75));
  INV_X1    g054(.A(new_n75), .ZN(new_n76));
  NAND2_X1  g055(.A1(\totalcoeffs[0] ), .A2(new_n53), .ZN(new_n77));
  NAND2_X1  g056(.A1(new_n25), .A2(new_n73), .ZN(new_n78));
  NAND2_X1  g057(.A1(new_n45), .A2(new_n54), .ZN(new_n79));
  OAI22_X1  g058(.A1(new_n76), .A2(new_n77), .B1(new_n78), .B2(new_n79), .ZN(new_n80));
  AOI22_X1  g059(.A1(new_n26), .A2(new_n70), .B1(new_n40), .B2(new_n80), .ZN(new_n81));
  NOR3_X1   g060(.A1(\totalcoeffs[3] ), .A2(\trailingones[0] ), .A3(new_n48), .ZN(new_n82));
  NAND2_X1  g061(.A1(new_n42), .A2(new_n53), .ZN(new_n83));
  NOR2_X1   g062(.A1(\totalcoeffs[0] ), .A2(new_n83), .ZN(new_n84));
  NOR2_X1   g063(.A1(new_n53), .A2(new_n34), .ZN(new_n85));
  INV_X1    g064(.A(new_n47), .ZN(new_n86));
  NOR2_X1   g065(.A1(new_n40), .A2(\ctable[1] ), .ZN(new_n87));
  NOR2_X1   g066(.A1(new_n53), .A2(new_n40), .ZN(new_n88));
  NOR3_X1   g067(.A1(new_n86), .A2(new_n87), .A3(new_n88), .ZN(new_n89));
  OAI21_X1  g068(.A(new_n26), .B1(new_n85), .B2(new_n89), .ZN(new_n90));
  NOR2_X1   g069(.A1(new_n53), .A2(\totalcoeffs[3] ), .ZN(new_n91));
  AOI22_X1  g070(.A1(\totalcoeffs[1] ), .A2(new_n26), .B1(new_n39), .B2(new_n91), .ZN(new_n92));
  OAI21_X1  g071(.A(new_n90), .B1(\totalcoeffs[0] ), .B2(new_n92), .ZN(new_n93));
  AOI22_X1  g072(.A1(new_n82), .A2(new_n84), .B1(new_n25), .B2(new_n93), .ZN(new_n94));
  OAI21_X1  g073(.A(new_n26), .B1(\totalcoeffs[1] ), .B2(new_n43), .ZN(new_n95));
  NAND2_X1  g074(.A1(new_n42), .A2(\totalcoeffs[2] ), .ZN(new_n96));
  OAI21_X1  g075(.A(new_n95), .B1(new_n58), .B2(new_n96), .ZN(new_n97));
  NOR2_X1   g076(.A1(\ctable[1] ), .A2(new_n34), .ZN(new_n98));
  NOR3_X1   g077(.A1(\totalcoeffs[0] ), .A2(\totalcoeffs[2] ), .A3(new_n98), .ZN(new_n99));
  NOR2_X1   g078(.A1(new_n42), .A2(new_n59), .ZN(new_n100));
  NOR2_X1   g079(.A1(new_n53), .A2(new_n25), .ZN(new_n101));
  AOI221_X1 g080(.A(new_n33), .B1(new_n39), .B2(new_n99), .C1(new_n100), .C2(new_n101), .ZN(new_n102));
  INV_X1    g081(.A(new_n102), .ZN(new_n103));
  AOI22_X1  g082(.A1(new_n25), .A2(new_n97), .B1(\trailingones[0] ), .B2(new_n103), .ZN(new_n104));
  OAI21_X1  g083(.A(new_n94), .B1(new_n40), .B2(new_n104), .ZN(new_n105));
  NOR2_X1   g084(.A1(\totalcoeffs[0] ), .A2(\totalcoeffs[3] ), .ZN(new_n106));
  NOR2_X1   g085(.A1(\totalcoeffs[2] ), .A2(new_n51), .ZN(new_n107));
  OAI211_X1 g086(.A(\ctable[1] ), .B(new_n106), .C1(new_n85), .C2(new_n107), .ZN(new_n108));
  NAND2_X1  g087(.A1(new_n53), .A2(new_n58), .ZN(new_n109));
  AOI22_X1  g088(.A1(\ctable[1] ), .A2(new_n109), .B1(new_n64), .B2(new_n100), .ZN(new_n110));
  OAI21_X1  g089(.A(new_n108), .B1(new_n25), .B2(new_n110), .ZN(new_n111));
  AOI21_X1  g090(.A(new_n105), .B1(\trailingones[0] ), .B2(new_n111), .ZN(new_n112));
  OAI22_X1  g091(.A1(\ctable[1] ), .A2(new_n81), .B1(\ctable[2] ), .B2(new_n112), .ZN(new_n113));
  INV_X1    g092(.A(new_n113), .ZN(new_n114));
  OAI21_X1  g093(.A(new_n38), .B1(\totalcoeffs[4] ), .B2(new_n114), .ZN(\coeff_token[0] ));
  NOR2_X1   g094(.A1(new_n53), .A2(new_n45), .ZN(new_n116));
  AOI21_X1  g095(.A(new_n109), .B1(\totalcoeffs[0] ), .B2(\totalcoeffs[1] ), .ZN(new_n117));
  NOR3_X1   g096(.A1(\trailingones[0] ), .A2(new_n116), .A3(new_n117), .ZN(new_n118));
  AOI21_X1  g097(.A(new_n118), .B1(\trailingones[0] ), .B2(new_n107), .ZN(new_n119));
  OAI21_X1  g098(.A(new_n79), .B1(new_n22), .B2(new_n119), .ZN(new_n120));
  INV_X1    g099(.A(new_n120), .ZN(new_n121));
  NOR2_X1   g100(.A1(\ctable[1] ), .A2(new_n41), .ZN(new_n122));
  INV_X1    g101(.A(new_n122), .ZN(new_n123));
  NOR2_X1   g102(.A1(\totalcoeffs[4] ), .A2(new_n123), .ZN(new_n124));
  INV_X1    g103(.A(new_n124), .ZN(new_n125));
  NOR2_X1   g104(.A1(new_n25), .A2(\trailingones[0] ), .ZN(new_n126));
  OAI21_X1  g105(.A(new_n32), .B1(new_n29), .B2(new_n126), .ZN(new_n127));
  INV_X1    g106(.A(new_n127), .ZN(new_n128));
  OAI211_X1 g107(.A(new_n99), .B(new_n24), .C1(new_n35), .C2(new_n128), .ZN(new_n129));
  INV_X1    g108(.A(new_n129), .ZN(new_n130));
  NOR2_X1   g109(.A1(new_n42), .A2(new_n25), .ZN(new_n131));
  NOR3_X1   g110(.A1(new_n40), .A2(\trailingones[0] ), .A3(new_n83), .ZN(new_n132));
  OAI21_X1  g111(.A(\totalcoeffs[0] ), .B1(new_n131), .B2(new_n132), .ZN(new_n133));
  NOR2_X1   g112(.A1(new_n25), .A2(new_n64), .ZN(new_n134));
  INV_X1    g113(.A(new_n134), .ZN(new_n135));
  AOI21_X1  g114(.A(new_n32), .B1(new_n133), .B2(new_n135), .ZN(new_n136));
  OAI211_X1 g115(.A(\totalcoeffs[1] ), .B(new_n88), .C1(\ctable[1] ), .C2(new_n126), .ZN(new_n137));
  INV_X1    g116(.A(new_n137), .ZN(new_n138));
  OAI21_X1  g117(.A(\trailingones[1] ), .B1(new_n136), .B2(new_n138), .ZN(new_n139));
  NOR2_X1   g118(.A1(\totalcoeffs[1] ), .A2(\trailingones[0] ), .ZN(new_n140));
  AOI21_X1  g119(.A(new_n53), .B1(new_n42), .B2(\ctable[1] ), .ZN(new_n141));
  NOR2_X1   g120(.A1(\totalcoeffs[0] ), .A2(new_n26), .ZN(new_n142));
  NOR2_X1   g121(.A1(\totalcoeffs[1] ), .A2(\ctable[1] ), .ZN(new_n143));
  OAI21_X1  g122(.A(new_n53), .B1(new_n56), .B2(new_n42), .ZN(new_n144));
  OAI33_X1  g123(.A1(new_n40), .A2(new_n140), .A3(new_n141), .B1(new_n142), .B2(new_n143), .B3(new_n144), .ZN(new_n145));
  OAI211_X1 g124(.A(new_n56), .B(new_n65), .C1(\totalcoeffs[2] ), .C2(\trailingones[0] ), .ZN(new_n146));
  NOR2_X1   g125(.A1(\totalcoeffs[0] ), .A2(new_n25), .ZN(new_n147));
  NOR2_X1   g126(.A1(new_n56), .A2(\ctable[0] ), .ZN(new_n148));
  NOR3_X1   g127(.A1(\totalcoeffs[2] ), .A2(new_n26), .A3(new_n56), .ZN(new_n149));
  NOR3_X1   g128(.A1(new_n147), .A2(new_n148), .A3(new_n149), .ZN(new_n150));
  NOR2_X1   g129(.A1(\totalcoeffs[2] ), .A2(\trailingones[0] ), .ZN(new_n151));
  NOR2_X1   g130(.A1(\totalcoeffs[3] ), .A2(\trailingones[0] ), .ZN(new_n152));
  NOR2_X1   g131(.A1(\ctable[0] ), .A2(new_n26), .ZN(new_n153));
  NOR2_X1   g132(.A1(new_n152), .A2(new_n153), .ZN(new_n154));
  AOI22_X1  g133(.A1(\ctable[0] ), .A2(new_n151), .B1(\totalcoeffs[0] ), .B2(new_n154), .ZN(new_n155));
  OAI221_X1 g134(.A(new_n146), .B1(new_n42), .B2(new_n150), .C1(\totalcoeffs[1] ), .C2(new_n155), .ZN(new_n156));
  AOI22_X1  g135(.A1(new_n25), .A2(new_n145), .B1(new_n32), .B2(new_n156), .ZN(new_n157));
  NOR2_X1   g136(.A1(\trailingones[0] ), .A2(new_n34), .ZN(new_n158));
  NAND2_X1  g137(.A1(new_n147), .A2(new_n158), .ZN(new_n159));
  OAI21_X1  g138(.A(\totalcoeffs[0] ), .B1(new_n32), .B2(new_n26), .ZN(new_n160));
  AOI21_X1  g139(.A(new_n153), .B1(\ctable[1] ), .B2(\trailingones[1] ), .ZN(new_n161));
  OAI21_X1  g140(.A(new_n159), .B1(new_n160), .B2(new_n161), .ZN(new_n162));
  NOR2_X1   g141(.A1(new_n53), .A2(\ctable[0] ), .ZN(new_n163));
  NOR2_X1   g142(.A1(\ctable[1] ), .A2(new_n163), .ZN(new_n164));
  NAND2_X1  g143(.A1(new_n77), .A2(new_n153), .ZN(new_n165));
  OAI22_X1  g144(.A1(\ctable[1] ), .A2(\trailingones[0] ), .B1(new_n164), .B2(new_n165), .ZN(new_n166));
  AOI22_X1  g145(.A1(new_n53), .A2(new_n162), .B1(new_n34), .B2(new_n166), .ZN(new_n167));
  NOR2_X1   g146(.A1(new_n42), .A2(new_n167), .ZN(new_n168));
  NOR2_X1   g147(.A1(\trailingones[0] ), .A2(\trailingones[1] ), .ZN(new_n169));
  NOR2_X1   g148(.A1(new_n26), .A2(new_n34), .ZN(new_n170));
  AOI21_X1  g149(.A(new_n169), .B1(\totalcoeffs[0] ), .B2(new_n170), .ZN(new_n171));
  OR2_X1    g150(.A1(new_n25), .A2(new_n171), .ZN(new_n172));
  INV_X1    g151(.A(new_n54), .ZN(new_n173));
  NAND2_X1  g152(.A1(new_n173), .A2(new_n77), .ZN(new_n174));
  INV_X1    g153(.A(new_n71), .ZN(new_n175));
  NOR2_X1   g154(.A1(\trailingones[0] ), .A2(new_n175), .ZN(new_n176));
  NOR2_X1   g155(.A1(new_n57), .A2(new_n161), .ZN(new_n177));
  AOI21_X1  g156(.A(new_n176), .B1(new_n160), .B2(new_n177), .ZN(new_n178));
  OAI22_X1  g157(.A1(new_n172), .A2(new_n174), .B1(new_n53), .B2(new_n178), .ZN(new_n179));
  AOI221_X1 g158(.A(new_n168), .B1(new_n54), .B2(new_n27), .C1(new_n42), .C2(new_n179), .ZN(new_n180));
  OAI221_X1 g159(.A(new_n139), .B1(\trailingones[1] ), .B2(new_n157), .C1(\totalcoeffs[3] ), .C2(new_n180), .ZN(new_n181));
  AOI21_X1  g160(.A(new_n130), .B1(new_n28), .B2(new_n181), .ZN(new_n182));
  OAI22_X1  g161(.A1(new_n121), .A2(new_n125), .B1(\ctable[2] ), .B2(new_n182), .ZN(\coeff_token[1] ));
  OAI21_X1  g162(.A(new_n100), .B1(new_n56), .B2(new_n73), .ZN(new_n184));
  INV_X1    g163(.A(new_n184), .ZN(new_n185));
  NOR3_X1   g164(.A1(\trailingones[0] ), .A2(new_n86), .A3(new_n56), .ZN(new_n186));
  OAI211_X1 g165(.A(new_n53), .B(new_n124), .C1(new_n185), .C2(new_n186), .ZN(new_n187));
  NOR2_X1   g166(.A1(new_n169), .A2(new_n170), .ZN(new_n188));
  OAI21_X1  g167(.A(\totalcoeffs[2] ), .B1(new_n47), .B2(new_n188), .ZN(new_n189));
  INV_X1    g168(.A(new_n163), .ZN(new_n190));
  OAI21_X1  g169(.A(new_n172), .B1(new_n34), .B2(new_n190), .ZN(new_n191));
  INV_X1    g170(.A(new_n191), .ZN(new_n192));
  OAI21_X1  g171(.A(new_n189), .B1(new_n42), .B2(new_n192), .ZN(new_n193));
  NOR2_X1   g172(.A1(\totalcoeffs[2] ), .A2(\trailingones[1] ), .ZN(new_n194));
  OAI21_X1  g173(.A(new_n194), .B1(new_n176), .B2(new_n132), .ZN(new_n195));
  NOR2_X1   g174(.A1(\totalcoeffs[1] ), .A2(new_n26), .ZN(new_n196));
  INV_X1    g175(.A(new_n196), .ZN(new_n197));
  OAI21_X1  g176(.A(new_n195), .B1(new_n66), .B2(new_n197), .ZN(new_n198));
  AOI22_X1  g177(.A1(new_n40), .A2(new_n193), .B1(\totalcoeffs[0] ), .B2(new_n198), .ZN(new_n199));
  INV_X1    g178(.A(new_n148), .ZN(new_n200));
  OAI21_X1  g179(.A(new_n51), .B1(new_n32), .B2(new_n39), .ZN(new_n201));
  AOI21_X1  g180(.A(new_n82), .B1(\trailingones[0] ), .B2(new_n201), .ZN(new_n202));
  INV_X1    g181(.A(new_n202), .ZN(new_n203));
  NAND2_X1  g182(.A1(\totalcoeffs[2] ), .A2(new_n169), .ZN(new_n204));
  NAND2_X1  g183(.A1(\totalcoeffs[1] ), .A2(new_n26), .ZN(new_n205));
  OAI21_X1  g184(.A(new_n197), .B1(new_n53), .B2(new_n205), .ZN(new_n206));
  INV_X1    g185(.A(new_n206), .ZN(new_n207));
  OAI221_X1 g186(.A(new_n204), .B1(new_n26), .B2(new_n54), .C1(new_n32), .C2(new_n207), .ZN(new_n208));
  AOI22_X1  g187(.A1(new_n53), .A2(new_n203), .B1(\totalcoeffs[3] ), .B2(new_n208), .ZN(new_n209));
  OAI22_X1  g188(.A1(\ctable[1] ), .A2(new_n199), .B1(new_n200), .B2(new_n209), .ZN(new_n210));
  NOR2_X1   g189(.A1(\totalcoeffs[3] ), .A2(new_n34), .ZN(new_n211));
  INV_X1    g190(.A(new_n211), .ZN(new_n212));
  NOR2_X1   g191(.A1(new_n42), .A2(\totalcoeffs[3] ), .ZN(new_n213));
  OAI211_X1 g192(.A(new_n32), .B(new_n212), .C1(new_n213), .C2(new_n158), .ZN(new_n214));
  NOR2_X1   g193(.A1(new_n53), .A2(new_n27), .ZN(new_n215));
  OAI21_X1  g194(.A(new_n134), .B1(new_n196), .B2(new_n215), .ZN(new_n216));
  NOR2_X1   g195(.A1(\totalcoeffs[1] ), .A2(new_n169), .ZN(new_n217));
  NOR3_X1   g196(.A1(new_n32), .A2(new_n170), .A3(new_n217), .ZN(new_n218));
  INV_X1    g197(.A(new_n218), .ZN(new_n219));
  OAI211_X1 g198(.A(new_n214), .B(new_n216), .C1(new_n212), .C2(new_n219), .ZN(new_n220));
  INV_X1    g199(.A(new_n220), .ZN(new_n221));
  OAI221_X1 g200(.A(new_n34), .B1(\totalcoeffs[1] ), .B2(new_n32), .C1(new_n32), .C2(\trailingones[0] ), .ZN(new_n222));
  AOI22_X1  g201(.A1(new_n53), .A2(new_n222), .B1(new_n26), .B2(new_n39), .ZN(new_n223));
  INV_X1    g202(.A(new_n140), .ZN(new_n224));
  NAND3_X1  g203(.A1(new_n25), .A2(\ctable[1] ), .A3(new_n40), .ZN(new_n225));
  NOR2_X1   g204(.A1(new_n224), .A2(new_n225), .ZN(new_n226));
  OAI21_X1  g205(.A(\trailingones[0] ), .B1(new_n40), .B2(new_n163), .ZN(new_n227));
  AOI21_X1  g206(.A(new_n40), .B1(new_n53), .B2(\trailingones[0] ), .ZN(new_n228));
  OAI21_X1  g207(.A(new_n227), .B1(new_n25), .B2(new_n228), .ZN(new_n229));
  AOI21_X1  g208(.A(new_n226), .B1(\totalcoeffs[1] ), .B2(new_n229), .ZN(new_n230));
  OAI221_X1 g209(.A(new_n221), .B1(new_n40), .B2(new_n223), .C1(\trailingones[1] ), .C2(new_n230), .ZN(new_n231));
  NOR2_X1   g210(.A1(new_n32), .A2(\trailingones[0] ), .ZN(new_n232));
  OAI21_X1  g211(.A(new_n25), .B1(new_n170), .B2(new_n232), .ZN(new_n233));
  NOR2_X1   g212(.A1(\totalcoeffs[3] ), .A2(new_n28), .ZN(new_n234));
  INV_X1    g213(.A(new_n234), .ZN(new_n235));
  NOR2_X1   g214(.A1(new_n83), .A2(new_n235), .ZN(new_n236));
  AOI22_X1  g215(.A1(new_n28), .A2(new_n231), .B1(new_n233), .B2(new_n236), .ZN(new_n237));
  INV_X1    g216(.A(new_n237), .ZN(new_n238));
  AOI22_X1  g217(.A1(new_n28), .A2(new_n210), .B1(new_n56), .B2(new_n238), .ZN(new_n239));
  OAI21_X1  g218(.A(new_n187), .B1(\ctable[2] ), .B2(new_n239), .ZN(\coeff_token[2] ));
  INV_X1    g219(.A(new_n45), .ZN(new_n241));
  INV_X1    g220(.A(new_n170), .ZN(new_n242));
  NAND2_X1  g221(.A1(new_n32), .A2(new_n242), .ZN(new_n243));
  NOR2_X1   g222(.A1(\ctable[0] ), .A2(\ctable[1] ), .ZN(new_n244));
  OAI21_X1  g223(.A(new_n243), .B1(new_n33), .B2(new_n244), .ZN(new_n245));
  NAND2_X1  g224(.A1(new_n53), .A2(new_n234), .ZN(new_n246));
  NOR2_X1   g225(.A1(new_n245), .A2(new_n246), .ZN(new_n247));
  OAI22_X1  g226(.A1(new_n40), .A2(new_n98), .B1(new_n53), .B2(new_n32), .ZN(new_n248));
  AOI21_X1  g227(.A(new_n247), .B1(new_n28), .B2(new_n248), .ZN(new_n249));
  AOI21_X1  g228(.A(new_n71), .B1(new_n32), .B2(new_n26), .ZN(new_n250));
  NOR2_X1   g229(.A1(new_n25), .A2(new_n34), .ZN(new_n251));
  NOR2_X1   g230(.A1(\ctable[1] ), .A2(new_n251), .ZN(new_n252));
  INV_X1    g231(.A(new_n252), .ZN(new_n253));
  AOI21_X1  g232(.A(new_n46), .B1(\ctable[0] ), .B2(\trailingones[0] ), .ZN(new_n254));
  OAI22_X1  g233(.A1(\totalcoeffs[2] ), .A2(new_n250), .B1(new_n253), .B2(new_n254), .ZN(new_n255));
  NAND2_X1  g234(.A1(\totalcoeffs[3] ), .A2(new_n255), .ZN(new_n256));
  NAND2_X1  g235(.A1(new_n25), .A2(\ctable[1] ), .ZN(new_n257));
  NAND2_X1  g236(.A1(\totalcoeffs[2] ), .A2(new_n87), .ZN(new_n258));
  AOI21_X1  g237(.A(new_n66), .B1(new_n257), .B2(new_n258), .ZN(new_n259));
  AOI21_X1  g238(.A(\ctable[1] ), .B1(\totalcoeffs[3] ), .B2(new_n26), .ZN(new_n260));
  AOI211_X1 g239(.A(new_n153), .B(new_n260), .C1(\ctable[1] ), .C2(\trailingones[1] ), .ZN(new_n261));
  AOI21_X1  g240(.A(new_n259), .B1(new_n245), .B2(new_n261), .ZN(new_n262));
  OAI221_X1 g241(.A(new_n256), .B1(new_n257), .B2(new_n222), .C1(\totalcoeffs[1] ), .C2(new_n262), .ZN(new_n263));
  INV_X1    g242(.A(new_n143), .ZN(new_n264));
  NAND2_X1  g243(.A1(\ctable[0] ), .A2(new_n151), .ZN(new_n265));
  OAI21_X1  g244(.A(new_n225), .B1(new_n264), .B2(new_n265), .ZN(new_n266));
  AOI21_X1  g245(.A(new_n56), .B1(new_n34), .B2(new_n266), .ZN(new_n267));
  NAND2_X1  g246(.A1(new_n53), .A2(\totalcoeffs[3] ), .ZN(new_n268));
  NOR2_X1   g247(.A1(new_n40), .A2(\ctable[0] ), .ZN(new_n269));
  OAI221_X1 g248(.A(new_n268), .B1(new_n34), .B2(new_n265), .C1(new_n260), .C2(new_n269), .ZN(new_n270));
  OAI22_X1  g249(.A1(new_n53), .A2(new_n154), .B1(new_n26), .B2(new_n60), .ZN(new_n271));
  AOI21_X1  g250(.A(new_n270), .B1(new_n34), .B2(new_n271), .ZN(new_n272));
  OAI21_X1  g251(.A(new_n267), .B1(new_n42), .B2(new_n272), .ZN(new_n273));
  OAI21_X1  g252(.A(\totalcoeffs[2] ), .B1(new_n169), .B2(new_n251), .ZN(new_n274));
  OAI211_X1 g253(.A(new_n40), .B(new_n274), .C1(new_n32), .C2(\trailingones[0] ), .ZN(new_n275));
  OAI211_X1 g254(.A(\totalcoeffs[1] ), .B(new_n275), .C1(new_n25), .C2(new_n27), .ZN(new_n276));
  OAI211_X1 g255(.A(new_n56), .B(new_n276), .C1(new_n32), .C2(new_n190), .ZN(new_n277));
  AOI21_X1  g256(.A(new_n263), .B1(new_n273), .B2(new_n277), .ZN(new_n278));
  OAI22_X1  g257(.A1(new_n241), .A2(new_n249), .B1(\totalcoeffs[4] ), .B2(new_n278), .ZN(new_n279));
  AND2_X1   g258(.A1(new_n22), .A2(new_n279), .ZN(\coeff_token[3] ));
  NOR2_X1   g259(.A1(new_n40), .A2(\totalcoeffs[4] ), .ZN(new_n281));
  OAI21_X1  g260(.A(new_n84), .B1(new_n234), .B2(new_n281), .ZN(new_n282));
  INV_X1    g261(.A(new_n116), .ZN(new_n283));
  OAI21_X1  g262(.A(new_n282), .B1(\totalcoeffs[4] ), .B2(new_n283), .ZN(new_n284));
  AND3_X1   g263(.A1(new_n22), .A2(new_n33), .A3(new_n284), .ZN(\coeff_token[4] ));
  NOR2_X1   g264(.A1(new_n241), .A2(new_n246), .ZN(new_n286));
  INV_X1    g265(.A(new_n286), .ZN(new_n287));
  INV_X1    g266(.A(new_n281), .ZN(new_n288));
  OAI21_X1  g267(.A(new_n287), .B1(new_n84), .B2(new_n288), .ZN(new_n289));
  AND3_X1   g268(.A1(new_n22), .A2(new_n33), .A3(new_n289), .ZN(\coeff_token[5] ));
  OAI21_X1  g269(.A(new_n22), .B1(new_n33), .B2(new_n286), .ZN(new_n291));
  INV_X1    g270(.A(new_n291), .ZN(new_n292));
  NOR3_X1   g271(.A1(new_n53), .A2(new_n26), .A3(new_n55), .ZN(new_n293));
  NAND2_X1  g272(.A1(new_n56), .A2(new_n32), .ZN(new_n294));
  NAND2_X1  g273(.A1(new_n194), .A2(new_n294), .ZN(new_n295));
  AOI21_X1  g274(.A(new_n295), .B1(\trailingones[0] ), .B2(new_n200), .ZN(new_n296));
  OAI21_X1  g275(.A(new_n42), .B1(new_n293), .B2(new_n296), .ZN(new_n297));
  INV_X1    g276(.A(new_n164), .ZN(new_n298));
  AOI21_X1  g277(.A(new_n61), .B1(new_n43), .B2(new_n298), .ZN(new_n299));
  NOR2_X1   g278(.A1(new_n53), .A2(new_n169), .ZN(new_n300));
  AOI21_X1  g279(.A(new_n300), .B1(\totalcoeffs[0] ), .B2(new_n170), .ZN(new_n301));
  OAI22_X1  g280(.A1(\trailingones[0] ), .A2(new_n299), .B1(new_n32), .B2(new_n301), .ZN(new_n302));
  INV_X1    g281(.A(new_n302), .ZN(new_n303));
  INV_X1    g282(.A(new_n52), .ZN(new_n304));
  INV_X1    g283(.A(new_n217), .ZN(new_n305));
  OAI21_X1  g284(.A(new_n173), .B1(new_n140), .B2(new_n294), .ZN(new_n306));
  AOI22_X1  g285(.A1(new_n304), .A2(new_n305), .B1(new_n48), .B2(new_n306), .ZN(new_n307));
  NOR2_X1   g286(.A1(\ctable[0] ), .A2(new_n307), .ZN(new_n308));
  NOR2_X1   g287(.A1(\totalcoeffs[0] ), .A2(new_n53), .ZN(new_n309));
  NAND3_X1  g288(.A1(\ctable[1] ), .A2(\trailingones[0] ), .A3(\totalcoeffs[0] ), .ZN(new_n310));
  OAI22_X1  g289(.A1(new_n205), .A2(new_n309), .B1(\totalcoeffs[2] ), .B2(new_n310), .ZN(new_n311));
  NOR2_X1   g290(.A1(\totalcoeffs[0] ), .A2(\trailingones[0] ), .ZN(new_n312));
  INV_X1    g291(.A(new_n312), .ZN(new_n313));
  NOR2_X1   g292(.A1(new_n51), .A2(new_n148), .ZN(new_n314));
  AOI221_X1 g293(.A(new_n308), .B1(\trailingones[1] ), .B2(new_n311), .C1(new_n313), .C2(new_n314), .ZN(new_n315));
  OAI221_X1 g294(.A(new_n297), .B1(new_n42), .B2(new_n303), .C1(new_n40), .C2(new_n315), .ZN(new_n316));
  OR2_X1    g295(.A1(new_n32), .A2(new_n188), .ZN(new_n317));
  AOI21_X1  g296(.A(new_n151), .B1(\totalcoeffs[2] ), .B2(\trailingones[0] ), .ZN(new_n318));
  OR2_X1    g297(.A1(new_n317), .A2(new_n318), .ZN(new_n319));
  AOI22_X1  g298(.A1(new_n26), .A2(new_n47), .B1(\trailingones[1] ), .B2(new_n309), .ZN(new_n320));
  OAI21_X1  g299(.A(\totalcoeffs[2] ), .B1(\totalcoeffs[1] ), .B2(\ctable[0] ), .ZN(new_n321));
  NAND2_X1  g300(.A1(new_n30), .A2(new_n321), .ZN(new_n322));
  INV_X1    g301(.A(new_n46), .ZN(new_n323));
  OAI21_X1  g302(.A(new_n322), .B1(new_n25), .B2(new_n323), .ZN(new_n324));
  AOI22_X1  g303(.A1(\totalcoeffs[0] ), .A2(new_n324), .B1(new_n175), .B2(new_n309), .ZN(new_n325));
  OAI221_X1 g304(.A(new_n319), .B1(new_n25), .B2(new_n320), .C1(new_n26), .C2(new_n325), .ZN(new_n326));
  AOI21_X1  g305(.A(new_n316), .B1(new_n40), .B2(new_n326), .ZN(new_n327));
  OR4_X1    g306(.A1(\totalcoeffs[2] ), .A2(new_n22), .A3(new_n196), .A4(new_n171), .ZN(new_n328));
  AOI21_X1  g307(.A(new_n26), .B1(\ctable[2] ), .B2(new_n34), .ZN(new_n329));
  NOR2_X1   g308(.A1(new_n96), .A2(new_n329), .ZN(new_n330));
  NOR2_X1   g309(.A1(new_n107), .A2(new_n330), .ZN(new_n331));
  OAI21_X1  g310(.A(new_n328), .B1(\totalcoeffs[0] ), .B2(new_n331), .ZN(new_n332));
  INV_X1    g311(.A(new_n332), .ZN(new_n333));
  OAI22_X1  g312(.A1(\ctable[2] ), .A2(new_n327), .B1(new_n123), .B2(new_n333), .ZN(new_n334));
  AOI21_X1  g313(.A(new_n292), .B1(new_n28), .B2(new_n334), .ZN(\ctoken_len[0] ));
  OAI21_X1  g314(.A(new_n300), .B1(\ctable[1] ), .B2(new_n152), .ZN(new_n336));
  NAND2_X1  g315(.A1(new_n56), .A2(new_n151), .ZN(new_n337));
  AND2_X1   g316(.A1(new_n310), .A2(new_n337), .ZN(new_n338));
  OAI211_X1 g317(.A(new_n42), .B(new_n336), .C1(\trailingones[1] ), .C2(new_n338), .ZN(new_n339));
  OAI22_X1  g318(.A1(\totalcoeffs[0] ), .A2(new_n317), .B1(new_n109), .B2(new_n243), .ZN(new_n340));
  AOI21_X1  g319(.A(new_n339), .B1(\totalcoeffs[3] ), .B2(new_n340), .ZN(new_n341));
  NAND3_X1  g320(.A1(new_n32), .A2(new_n242), .A3(\totalcoeffs[3] ), .ZN(new_n342));
  OAI221_X1 g321(.A(new_n342), .B1(\totalcoeffs[3] ), .B2(new_n242), .C1(new_n215), .C2(new_n309), .ZN(new_n343));
  NAND2_X1  g322(.A1(new_n43), .A2(new_n87), .ZN(new_n344));
  OAI221_X1 g323(.A(new_n344), .B1(new_n32), .B2(\trailingones[1] ), .C1(new_n56), .C2(new_n87), .ZN(new_n345));
  AOI221_X1 g324(.A(\totalcoeffs[2] ), .B1(\ctable[1] ), .B2(new_n158), .C1(\trailingones[0] ), .C2(new_n345), .ZN(new_n346));
  INV_X1    g325(.A(new_n346), .ZN(new_n347));
  AOI221_X1 g326(.A(new_n42), .B1(new_n152), .B2(new_n30), .C1(new_n343), .C2(new_n347), .ZN(new_n348));
  OAI22_X1  g327(.A1(new_n268), .A2(new_n319), .B1(new_n341), .B2(new_n348), .ZN(new_n349));
  NOR3_X1   g328(.A1(new_n25), .A2(new_n34), .A3(new_n26), .ZN(new_n350));
  NAND2_X1  g329(.A1(new_n88), .A2(new_n350), .ZN(new_n351));
  OAI21_X1  g330(.A(new_n42), .B1(new_n67), .B2(new_n204), .ZN(new_n352));
  OAI22_X1  g331(.A1(new_n53), .A2(new_n40), .B1(new_n23), .B2(new_n188), .ZN(new_n353));
  AOI21_X1  g332(.A(new_n352), .B1(new_n134), .B2(new_n353), .ZN(new_n354));
  AOI22_X1  g333(.A1(new_n53), .A2(\totalcoeffs[3] ), .B1(\trailingones[0] ), .B2(new_n106), .ZN(new_n355));
  OR3_X1    g334(.A1(new_n25), .A2(new_n170), .A3(new_n355), .ZN(new_n356));
  AOI21_X1  g335(.A(new_n54), .B1(\totalcoeffs[3] ), .B2(\ctable[0] ), .ZN(new_n357));
  OAI211_X1 g336(.A(\totalcoeffs[1] ), .B(new_n356), .C1(new_n313), .C2(new_n357), .ZN(new_n358));
  INV_X1    g337(.A(new_n85), .ZN(new_n359));
  INV_X1    g338(.A(new_n174), .ZN(new_n360));
  NOR2_X1   g339(.A1(\totalcoeffs[0] ), .A2(new_n318), .ZN(new_n361));
  OAI21_X1  g340(.A(new_n34), .B1(new_n149), .B2(new_n361), .ZN(new_n362));
  INV_X1    g341(.A(new_n362), .ZN(new_n363));
  OAI33_X1  g342(.A1(new_n25), .A2(\trailingones[0] ), .A3(new_n359), .B1(new_n26), .B2(new_n360), .B3(new_n363), .ZN(new_n364));
  AOI21_X1  g343(.A(new_n358), .B1(new_n40), .B2(new_n364), .ZN(new_n365));
  OAI21_X1  g344(.A(new_n351), .B1(new_n354), .B2(new_n365), .ZN(new_n366));
  AOI22_X1  g345(.A1(new_n25), .A2(new_n349), .B1(new_n32), .B2(new_n366), .ZN(new_n367));
  AOI21_X1  g346(.A(new_n363), .B1(new_n85), .B2(new_n312), .ZN(new_n368));
  OAI211_X1 g347(.A(new_n24), .B(new_n244), .C1(\totalcoeffs[2] ), .C2(new_n73), .ZN(new_n369));
  OAI22_X1  g348(.A1(\ctable[2] ), .A2(new_n367), .B1(new_n368), .B2(new_n369), .ZN(new_n370));
  NOR3_X1   g349(.A1(\ctable[0] ), .A2(\ctable[2] ), .A3(new_n287), .ZN(new_n371));
  AOI22_X1  g350(.A1(new_n28), .A2(new_n370), .B1(new_n32), .B2(new_n371), .ZN(\ctoken_len[1] ));
  OAI21_X1  g351(.A(new_n48), .B1(\totalcoeffs[1] ), .B2(\ctable[0] ), .ZN(new_n373));
  NOR2_X1   g352(.A1(new_n131), .A2(new_n269), .ZN(new_n374));
  NOR3_X1   g353(.A1(\totalcoeffs[2] ), .A2(new_n47), .A3(new_n211), .ZN(new_n375));
  AOI21_X1  g354(.A(new_n44), .B1(new_n42), .B2(\totalcoeffs[2] ), .ZN(new_n376));
  AOI222_X1 g355(.A1(new_n91), .A2(new_n373), .B1(new_n374), .B2(new_n375), .C1(new_n63), .C2(new_n376), .ZN(new_n377));
  NOR2_X1   g356(.A1(\trailingones[0] ), .A2(new_n377), .ZN(new_n378));
  NAND4_X1  g357(.A1(\totalcoeffs[1] ), .A2(new_n229), .A3(\totalcoeffs[2] ), .A4(new_n200), .ZN(new_n379));
  NOR2_X1   g358(.A1(\totalcoeffs[2] ), .A2(new_n106), .ZN(new_n380));
  AOI22_X1  g359(.A1(new_n24), .A2(new_n148), .B1(new_n374), .B2(new_n380), .ZN(new_n381));
  OAI21_X1  g360(.A(new_n379), .B1(new_n26), .B2(new_n381), .ZN(new_n382));
  NAND2_X1  g361(.A1(\totalcoeffs[3] ), .A2(new_n224), .ZN(new_n383));
  AOI21_X1  g362(.A(new_n163), .B1(\totalcoeffs[3] ), .B2(\ctable[0] ), .ZN(new_n384));
  OAI33_X1  g363(.A1(new_n83), .A2(new_n147), .A3(new_n383), .B1(new_n42), .B2(new_n228), .B3(new_n384), .ZN(new_n385));
  AOI221_X1 g364(.A(new_n378), .B1(new_n34), .B2(new_n382), .C1(\trailingones[1] ), .C2(new_n385), .ZN(new_n386));
  INV_X1    g365(.A(new_n269), .ZN(new_n387));
  OR3_X1    g366(.A1(new_n283), .A2(new_n217), .A3(new_n293), .ZN(new_n388));
  OAI21_X1  g367(.A(new_n388), .B1(new_n32), .B2(new_n39), .ZN(new_n389));
  AOI221_X1 g368(.A(new_n218), .B1(new_n264), .B2(new_n215), .C1(\totalcoeffs[0] ), .C2(new_n389), .ZN(new_n390));
  OAI22_X1  g369(.A1(\ctable[1] ), .A2(new_n386), .B1(new_n387), .B2(new_n390), .ZN(new_n391));
  OAI22_X1  g370(.A1(\totalcoeffs[1] ), .A2(new_n368), .B1(new_n323), .B2(new_n337), .ZN(new_n392));
  AOI22_X1  g371(.A1(new_n22), .A2(new_n391), .B1(new_n122), .B2(new_n392), .ZN(new_n393));
  INV_X1    g372(.A(new_n393), .ZN(new_n394));
  AOI21_X1  g373(.A(new_n371), .B1(new_n28), .B2(new_n394), .ZN(\ctoken_len[2] ));
  OAI21_X1  g374(.A(\ctable[1] ), .B1(\ctable[0] ), .B2(new_n91), .ZN(new_n396));
  NOR3_X1   g375(.A1(\totalcoeffs[1] ), .A2(\totalcoeffs[3] ), .A3(\totalcoeffs[2] ), .ZN(new_n397));
  OAI221_X1 g376(.A(new_n396), .B1(new_n22), .B2(new_n91), .C1(new_n28), .C2(new_n397), .ZN(new_n398));
  INV_X1    g377(.A(new_n398), .ZN(new_n399));
  NOR2_X1   g378(.A1(\ctable[2] ), .A2(new_n397), .ZN(new_n400));
  OAI21_X1  g379(.A(new_n399), .B1(new_n56), .B2(new_n400), .ZN(new_n401));
  OAI21_X1  g380(.A(new_n22), .B1(new_n200), .B2(new_n258), .ZN(new_n402));
  OAI21_X1  g381(.A(new_n40), .B1(\ctable[1] ), .B2(new_n350), .ZN(new_n403));
  OAI211_X1 g382(.A(\totalcoeffs[1] ), .B(new_n403), .C1(new_n190), .C2(new_n342), .ZN(new_n404));
  INV_X1    g383(.A(new_n142), .ZN(new_n405));
  AOI21_X1  g384(.A(new_n40), .B1(\ctable[1] ), .B2(\trailingones[1] ), .ZN(new_n406));
  OAI22_X1  g385(.A1(\totalcoeffs[3] ), .A2(new_n71), .B1(new_n405), .B2(new_n406), .ZN(new_n407));
  AOI21_X1  g386(.A(new_n404), .B1(new_n53), .B2(new_n407), .ZN(new_n408));
  INV_X1    g387(.A(new_n408), .ZN(new_n409));
  OAI21_X1  g388(.A(new_n406), .B1(new_n405), .B2(new_n252), .ZN(new_n410));
  OAI211_X1 g389(.A(new_n53), .B(new_n410), .C1(new_n235), .C2(new_n244), .ZN(new_n411));
  INV_X1    g390(.A(new_n229), .ZN(new_n412));
  NAND3_X1  g391(.A1(new_n40), .A2(new_n175), .A3(new_n300), .ZN(new_n413));
  OAI211_X1 g392(.A(new_n42), .B(new_n411), .C1(new_n412), .C2(new_n413), .ZN(new_n414));
  AOI221_X1 g393(.A(new_n401), .B1(new_n305), .B2(new_n402), .C1(new_n409), .C2(new_n414), .ZN(\ctoken_len[3] ));
  OAI21_X1  g394(.A(new_n287), .B1(new_n288), .B2(new_n388), .ZN(new_n416));
  AND3_X1   g395(.A1(new_n22), .A2(new_n244), .A3(new_n416), .ZN(\ctoken_len[4] ));
endmodule


