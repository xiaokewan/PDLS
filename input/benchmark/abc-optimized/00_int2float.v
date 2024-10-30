// Benchmark "epfl-original/random_control/0_int2float" written by ABC on Sat Nov 18 16:11:08 2023

module \epfl-original/random_control/0_int2float  ( 
    \B[0] , \B[1] , \B[2] , \B[3] , \B[4] , \B[5] , \B[6] , \B[7] , \B[8] ,
    \B[9] , \B[10] ,
    \M[0] , \M[1] , \M[2] , \M[3] , \E[0] , \E[1] , \E[2]   );
  input  \B[0] , \B[1] , \B[2] , \B[3] , \B[4] , \B[5] , \B[6] , \B[7] ,
    \B[8] , \B[9] , \B[10] ;
  output \M[0] , \M[1] , \M[2] , \M[3] , \E[0] , \E[1] , \E[2] ;
  wire new_n19, new_n20, new_n21, new_n22, new_n23, new_n24, new_n25,
    new_n26, new_n27, new_n28, new_n29, new_n30, new_n31, new_n32, new_n33,
    new_n34, new_n35, new_n36, new_n37, new_n38, new_n39, new_n40, new_n41,
    new_n42, new_n43, new_n44, new_n45, new_n46, new_n47, new_n48, new_n49,
    new_n50, new_n51, new_n52, new_n53, new_n54, new_n55, new_n56, new_n57,
    new_n58, new_n59, new_n60, new_n61, new_n62, new_n63, new_n64, new_n65,
    new_n67, new_n68, new_n69, new_n70, new_n71, new_n72, new_n73, new_n74,
    new_n75, new_n76, new_n77, new_n78, new_n79, new_n80, new_n81, new_n82,
    new_n83, new_n84, new_n85, new_n86, new_n87, new_n88, new_n89, new_n90,
    new_n91, new_n92, new_n93, new_n94, new_n96, new_n97, new_n98, new_n99,
    new_n100, new_n101, new_n102, new_n103, new_n104, new_n105, new_n106,
    new_n107, new_n108, new_n109, new_n110, new_n111, new_n112, new_n113,
    new_n114, new_n115, new_n116, new_n117, new_n118, new_n119, new_n120,
    new_n121, new_n122, new_n123, new_n125, new_n126, new_n127, new_n128,
    new_n129, new_n131, new_n132, new_n133, new_n134, new_n135, new_n136,
    new_n137, new_n138, new_n139, new_n140, new_n141, new_n143, new_n144,
    new_n145, new_n146, new_n147;
  INV_X1    g000(.A(\B[7] ), .ZN(new_n19));
  NOR2_X1   g001(.A1(\B[6] ), .A2(new_n19), .ZN(new_n20));
  NOR2_X1   g002(.A1(\B[8] ), .A2(\B[9] ), .ZN(new_n21));
  INV_X1    g003(.A(new_n21), .ZN(new_n22));
  NOR2_X1   g004(.A1(\B[2] ), .A2(\B[3] ), .ZN(new_n23));
  INV_X1    g005(.A(\B[3] ), .ZN(new_n24));
  NOR2_X1   g006(.A1(new_n24), .A2(\B[8] ), .ZN(new_n25));
  AOI211_X1 g007(.A(new_n22), .B(new_n23), .C1(\B[2] ), .C2(new_n25), .ZN(new_n26));
  OAI21_X1  g008(.A(new_n19), .B1(\B[10] ), .B2(new_n26), .ZN(new_n27));
  INV_X1    g009(.A(\B[9] ), .ZN(new_n28));
  INV_X1    g010(.A(\B[8] ), .ZN(new_n29));
  INV_X1    g011(.A(\B[10] ), .ZN(new_n30));
  NOR2_X1   g012(.A1(new_n29), .A2(new_n30), .ZN(new_n31));
  INV_X1    g013(.A(new_n31), .ZN(new_n32));
  OAI21_X1  g014(.A(new_n27), .B1(new_n28), .B2(new_n32), .ZN(new_n33));
  AOI22_X1  g015(.A1(\B[10] ), .A2(new_n20), .B1(\B[6] ), .B2(new_n33), .ZN(new_n34));
  INV_X1    g016(.A(\B[5] ), .ZN(new_n35));
  NOR2_X1   g017(.A1(new_n35), .A2(\B[6] ), .ZN(new_n36));
  INV_X1    g018(.A(new_n36), .ZN(new_n37));
  INV_X1    g019(.A(\B[2] ), .ZN(new_n38));
  NOR2_X1   g020(.A1(\B[7] ), .A2(\B[8] ), .ZN(new_n39));
  INV_X1    g021(.A(new_n39), .ZN(new_n40));
  NOR3_X1   g022(.A1(\B[1] ), .A2(new_n38), .A3(new_n40), .ZN(new_n41));
  INV_X1    g023(.A(\B[4] ), .ZN(new_n42));
  NOR2_X1   g024(.A1(new_n42), .A2(new_n29), .ZN(new_n43));
  NOR2_X1   g025(.A1(new_n24), .A2(new_n42), .ZN(new_n44));
  OAI211_X1 g026(.A(\B[1] ), .B(new_n38), .C1(\B[4] ), .C2(new_n19), .ZN(new_n45));
  NOR3_X1   g027(.A1(new_n43), .A2(new_n44), .A3(new_n45), .ZN(new_n46));
  NOR3_X1   g028(.A1(\B[9] ), .A2(new_n41), .A3(new_n46), .ZN(new_n47));
  NOR2_X1   g029(.A1(new_n37), .A2(new_n47), .ZN(new_n48));
  INV_X1    g030(.A(\B[6] ), .ZN(new_n49));
  NOR2_X1   g031(.A1(\B[5] ), .A2(new_n49), .ZN(new_n50));
  INV_X1    g032(.A(new_n43), .ZN(new_n51));
  NOR2_X1   g033(.A1(\B[4] ), .A2(new_n29), .ZN(new_n52));
  INV_X1    g034(.A(\B[1] ), .ZN(new_n53));
  NOR2_X1   g035(.A1(new_n53), .A2(new_n42), .ZN(new_n54));
  OAI21_X1  g036(.A(\B[0] ), .B1(new_n52), .B2(new_n54), .ZN(new_n55));
  INV_X1    g037(.A(new_n55), .ZN(new_n56));
  OAI211_X1 g038(.A(new_n49), .B(new_n19), .C1(\B[0] ), .C2(new_n54), .ZN(new_n57));
  OAI211_X1 g039(.A(new_n35), .B(new_n51), .C1(new_n56), .C2(new_n57), .ZN(new_n58));
  OAI21_X1  g040(.A(new_n58), .B1(new_n35), .B2(new_n52), .ZN(new_n59));
  NAND4_X1  g041(.A1(new_n38), .A2(new_n19), .A3(\B[1] ), .A4(\B[5] ), .ZN(new_n60));
  OAI21_X1  g042(.A(new_n60), .B1(\B[4] ), .B2(new_n19), .ZN(new_n61));
  NOR2_X1   g043(.A1(\B[3] ), .A2(new_n42), .ZN(new_n62));
  AOI22_X1  g044(.A1(\B[3] ), .A2(new_n61), .B1(\B[7] ), .B2(new_n62), .ZN(new_n63));
  OAI21_X1  g045(.A(new_n59), .B1(\B[8] ), .B2(new_n63), .ZN(new_n64));
  AOI221_X1 g046(.A(new_n48), .B1(\B[9] ), .B2(new_n50), .C1(new_n28), .C2(new_n64), .ZN(new_n65));
  OAI21_X1  g047(.A(new_n34), .B1(\B[10] ), .B2(new_n65), .ZN(\M[0] ));
  NOR2_X1   g048(.A1(new_n49), .A2(new_n19), .ZN(new_n67));
  NAND2_X1  g049(.A1(new_n28), .A2(new_n67), .ZN(new_n68));
  NAND2_X1  g050(.A1(\B[6] ), .A2(new_n28), .ZN(new_n69));
  NOR2_X1   g051(.A1(\B[4] ), .A2(new_n69), .ZN(new_n70));
  NOR2_X1   g052(.A1(\B[1] ), .A2(new_n37), .ZN(new_n71));
  OAI21_X1  g053(.A(new_n24), .B1(new_n70), .B2(new_n71), .ZN(new_n72));
  NAND2_X1  g054(.A1(\B[2] ), .A2(new_n44), .ZN(new_n73));
  AOI21_X1  g055(.A(new_n70), .B1(new_n24), .B2(new_n36), .ZN(new_n74));
  OAI221_X1 g056(.A(new_n72), .B1(new_n69), .B2(new_n73), .C1(\B[2] ), .C2(new_n74), .ZN(new_n75));
  AOI21_X1  g057(.A(\B[10] ), .B1(new_n19), .B2(new_n75), .ZN(new_n76));
  OAI33_X1  g058(.A1(new_n29), .A2(new_n30), .A3(new_n68), .B1(\B[8] ), .B2(new_n67), .B3(new_n76), .ZN(new_n77));
  INV_X1    g059(.A(new_n44), .ZN(new_n78));
  NAND3_X1  g060(.A1(\B[7] ), .A2(new_n78), .A3(new_n21), .ZN(new_n79));
  INV_X1    g061(.A(\B[0] ), .ZN(new_n80));
  AOI211_X1 g062(.A(new_n42), .B(\B[7] ), .C1(new_n80), .C2(\B[2] ), .ZN(new_n81));
  NOR2_X1   g063(.A1(new_n53), .A2(new_n38), .ZN(new_n82));
  OAI21_X1  g064(.A(new_n81), .B1(new_n80), .B2(new_n82), .ZN(new_n83));
  INV_X1    g065(.A(new_n83), .ZN(new_n84));
  OAI22_X1  g066(.A1(\B[2] ), .A2(\B[7] ), .B1(\B[4] ), .B2(\B[9] ), .ZN(new_n85));
  AOI221_X1 g067(.A(new_n84), .B1(new_n53), .B2(new_n85), .C1(\B[8] ), .C2(new_n28), .ZN(new_n86));
  OAI221_X1 g068(.A(new_n79), .B1(\B[7] ), .B2(new_n28), .C1(\B[6] ), .C2(new_n86), .ZN(new_n87));
  NAND2_X1  g069(.A1(new_n35), .A2(new_n87), .ZN(new_n88));
  AOI22_X1  g070(.A1(new_n19), .A2(\B[9] ), .B1(new_n28), .B2(new_n52), .ZN(new_n89));
  NAND2_X1  g071(.A1(new_n19), .A2(new_n82), .ZN(new_n90));
  OAI33_X1  g072(.A1(\B[4] ), .A2(\B[6] ), .A3(new_n90), .B1(new_n41), .B2(new_n22), .B3(new_n85), .ZN(new_n91));
  NOR2_X1   g073(.A1(new_n49), .A2(new_n21), .ZN(new_n92));
  AOI22_X1  g074(.A1(\B[3] ), .A2(new_n91), .B1(new_n89), .B2(new_n92), .ZN(new_n93));
  OAI221_X1 g075(.A(new_n88), .B1(\B[6] ), .B2(new_n89), .C1(new_n35), .C2(new_n93), .ZN(new_n94));
  AOI21_X1  g076(.A(new_n77), .B1(new_n30), .B2(new_n94), .ZN(\M[1] ));
  NOR3_X1   g077(.A1(new_n35), .A2(\B[8] ), .A3(new_n28), .ZN(new_n96));
  OAI21_X1  g078(.A(new_n67), .B1(new_n31), .B2(new_n96), .ZN(new_n97));
  AOI21_X1  g079(.A(new_n29), .B1(\B[5] ), .B2(\B[7] ), .ZN(new_n98));
  OAI21_X1  g080(.A(\B[9] ), .B1(\B[10] ), .B2(new_n98), .ZN(new_n99));
  NOR2_X1   g081(.A1(new_n42), .A2(new_n35), .ZN(new_n100));
  INV_X1    g082(.A(new_n100), .ZN(new_n101));
  NOR3_X1   g083(.A1(new_n49), .A2(\B[7] ), .A3(new_n101), .ZN(new_n102));
  OAI21_X1  g084(.A(\B[8] ), .B1(new_n20), .B2(new_n102), .ZN(new_n103));
  NOR2_X1   g085(.A1(new_n49), .A2(\B[7] ), .ZN(new_n104));
  AOI22_X1  g086(.A1(\B[3] ), .A2(new_n20), .B1(new_n38), .B2(new_n104), .ZN(new_n105));
  NOR2_X1   g087(.A1(new_n101), .A2(new_n105), .ZN(new_n106));
  OAI21_X1  g088(.A(\B[3] ), .B1(\B[2] ), .B2(\B[6] ), .ZN(new_n107));
  OAI21_X1  g089(.A(new_n107), .B1(new_n44), .B2(new_n100), .ZN(new_n108));
  INV_X1    g090(.A(new_n62), .ZN(new_n109));
  OAI33_X1  g091(.A1(new_n24), .A2(\B[4] ), .A3(new_n35), .B1(new_n80), .B2(\B[6] ), .B3(new_n109), .ZN(new_n110));
  NAND2_X1  g092(.A1(\B[0] ), .A2(\B[1] ), .ZN(new_n111));
  NAND2_X1  g093(.A1(new_n44), .A2(new_n111), .ZN(new_n112));
  OAI21_X1  g094(.A(new_n112), .B1(\B[4] ), .B2(\B[6] ), .ZN(new_n113));
  AOI22_X1  g095(.A1(\B[1] ), .A2(new_n110), .B1(new_n35), .B2(new_n113), .ZN(new_n114));
  OAI21_X1  g096(.A(new_n108), .B1(new_n38), .B2(new_n114), .ZN(new_n115));
  NAND2_X1  g097(.A1(new_n19), .A2(new_n115), .ZN(new_n116));
  NOR2_X1   g098(.A1(new_n35), .A2(new_n49), .ZN(new_n117));
  INV_X1    g099(.A(new_n117), .ZN(new_n118));
  AOI21_X1  g100(.A(new_n71), .B1(\B[2] ), .B2(new_n50), .ZN(new_n119));
  OAI221_X1 g101(.A(new_n116), .B1(new_n44), .B2(new_n118), .C1(new_n78), .C2(new_n119), .ZN(new_n120));
  AOI221_X1 g102(.A(new_n106), .B1(new_n67), .B2(new_n101), .C1(new_n29), .C2(new_n120), .ZN(new_n121));
  OAI21_X1  g103(.A(new_n103), .B1(\B[9] ), .B2(new_n121), .ZN(new_n122));
  NAND2_X1  g104(.A1(new_n30), .A2(new_n122), .ZN(new_n123));
  NAND3_X1  g105(.A1(new_n97), .A2(new_n99), .A3(new_n123), .ZN(\M[2] ));
  NOR2_X1   g106(.A1(\B[9] ), .A2(\B[10] ), .ZN(new_n125));
  NAND2_X1  g107(.A1(\B[7] ), .A2(new_n117), .ZN(new_n126));
  NOR2_X1   g108(.A1(\B[5] ), .A2(\B[6] ), .ZN(new_n127));
  INV_X1    g109(.A(new_n127), .ZN(new_n128));
  OAI33_X1  g110(.A1(\B[2] ), .A2(new_n51), .A3(new_n126), .B1(\B[4] ), .B2(new_n40), .B3(new_n128), .ZN(new_n129));
  NAND3_X1  g111(.A1(new_n24), .A2(new_n125), .A3(new_n129), .ZN(\M[3] ));
  OR4_X1    g112(.A1(new_n25), .A2(new_n23), .A3(new_n101), .A4(new_n68), .ZN(new_n131));
  NOR2_X1   g113(.A1(new_n29), .A2(new_n126), .ZN(new_n132));
  OAI21_X1  g114(.A(new_n131), .B1(new_n28), .B2(new_n132), .ZN(new_n133));
  NOR2_X1   g115(.A1(new_n111), .A2(new_n128), .ZN(new_n134));
  OAI211_X1 g116(.A(\B[2] ), .B(\B[3] ), .C1(new_n102), .C2(new_n134), .ZN(new_n135));
  AOI21_X1  g117(.A(new_n24), .B1(new_n90), .B2(new_n118), .ZN(new_n136));
  NOR2_X1   g118(.A1(\B[5] ), .A2(\B[7] ), .ZN(new_n137));
  OAI21_X1  g119(.A(\B[4] ), .B1(new_n136), .B2(new_n137), .ZN(new_n138));
  INV_X1    g120(.A(new_n138), .ZN(new_n139));
  OAI21_X1  g121(.A(new_n135), .B1(new_n104), .B2(new_n139), .ZN(new_n140));
  AOI21_X1  g122(.A(new_n133), .B1(new_n29), .B2(new_n140), .ZN(new_n141));
  OR2_X1    g123(.A1(\B[10] ), .A2(new_n141), .ZN(\E[0] ));
  OAI21_X1  g124(.A(new_n39), .B1(new_n73), .B2(new_n118), .ZN(new_n143));
  INV_X1    g125(.A(new_n137), .ZN(new_n144));
  NAND2_X1  g126(.A1(\B[2] ), .A2(new_n25), .ZN(new_n145));
  OAI33_X1  g127(.A1(new_n29), .A2(new_n126), .A3(new_n23), .B1(new_n111), .B2(new_n144), .B3(new_n145), .ZN(new_n146));
  INV_X1    g128(.A(new_n146), .ZN(new_n147));
  OAI221_X1 g129(.A(new_n125), .B1(new_n127), .B2(new_n143), .C1(new_n42), .C2(new_n147), .ZN(\E[1] ));
  OR3_X1    g130(.A1(\B[9] ), .A2(\B[10] ), .A3(new_n143), .ZN(\E[2] ));
endmodule


