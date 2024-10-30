// Benchmark "epfl-original/random_control/2_router" written by ABC on Sat Nov 18 16:11:44 2023

module \epfl-original/random_control/2_router  ( 
    \dest_x[0] , \dest_x[1] , \dest_x[2] , \dest_x[3] , \dest_x[4] ,
    \dest_x[5] , \dest_x[6] , \dest_x[7] , \dest_x[8] , \dest_x[9] ,
    \dest_x[10] , \dest_x[11] , \dest_x[12] , \dest_x[13] , \dest_x[14] ,
    \dest_x[15] , \dest_x[16] , \dest_x[17] , \dest_x[18] , \dest_x[19] ,
    \dest_x[20] , \dest_x[21] , \dest_x[22] , \dest_x[23] , \dest_x[24] ,
    \dest_x[25] , \dest_x[26] , \dest_x[27] , \dest_x[28] , \dest_x[29] ,
    \dest_y[0] , \dest_y[1] , \dest_y[2] , \dest_y[3] , \dest_y[4] ,
    \dest_y[5] , \dest_y[6] , \dest_y[7] , \dest_y[8] , \dest_y[9] ,
    \dest_y[10] , \dest_y[11] , \dest_y[12] , \dest_y[13] , \dest_y[14] ,
    \dest_y[15] , \dest_y[16] , \dest_y[17] , \dest_y[18] , \dest_y[19] ,
    \dest_y[20] , \dest_y[21] , \dest_y[22] , \dest_y[23] , \dest_y[24] ,
    \dest_y[25] , \dest_y[26] , \dest_y[27] , \dest_y[28] , \dest_y[29] ,
    \outport[0] , \outport[1] , \outport[2] , \outport[3] , \outport[4] ,
    \outport[5] , \outport[6] , \outport[7] , \outport[8] , \outport[9] ,
    \outport[10] , \outport[11] , \outport[12] , \outport[13] ,
    \outport[14] , \outport[15] , \outport[16] , \outport[17] ,
    \outport[18] , \outport[19] , \outport[20] , \outport[21] ,
    \outport[22] , \outport[23] , \outport[24] , \outport[25] ,
    \outport[26] , \outport[27] , \outport[28] , \outport[29]   );
  input  \dest_x[0] , \dest_x[1] , \dest_x[2] , \dest_x[3] , \dest_x[4] ,
    \dest_x[5] , \dest_x[6] , \dest_x[7] , \dest_x[8] , \dest_x[9] ,
    \dest_x[10] , \dest_x[11] , \dest_x[12] , \dest_x[13] , \dest_x[14] ,
    \dest_x[15] , \dest_x[16] , \dest_x[17] , \dest_x[18] , \dest_x[19] ,
    \dest_x[20] , \dest_x[21] , \dest_x[22] , \dest_x[23] , \dest_x[24] ,
    \dest_x[25] , \dest_x[26] , \dest_x[27] , \dest_x[28] , \dest_x[29] ,
    \dest_y[0] , \dest_y[1] , \dest_y[2] , \dest_y[3] , \dest_y[4] ,
    \dest_y[5] , \dest_y[6] , \dest_y[7] , \dest_y[8] , \dest_y[9] ,
    \dest_y[10] , \dest_y[11] , \dest_y[12] , \dest_y[13] , \dest_y[14] ,
    \dest_y[15] , \dest_y[16] , \dest_y[17] , \dest_y[18] , \dest_y[19] ,
    \dest_y[20] , \dest_y[21] , \dest_y[22] , \dest_y[23] , \dest_y[24] ,
    \dest_y[25] , \dest_y[26] , \dest_y[27] , \dest_y[28] , \dest_y[29] ;
  output \outport[0] , \outport[1] , \outport[2] , \outport[3] , \outport[4] ,
    \outport[5] , \outport[6] , \outport[7] , \outport[8] , \outport[9] ,
    \outport[10] , \outport[11] , \outport[12] , \outport[13] ,
    \outport[14] , \outport[15] , \outport[16] , \outport[17] ,
    \outport[18] , \outport[19] , \outport[20] , \outport[21] ,
    \outport[22] , \outport[23] , \outport[24] , \outport[25] ,
    \outport[26] , \outport[27] , \outport[28] , \outport[29] ;
  wire new_n91, new_n92, new_n93, new_n94, new_n95, new_n96, new_n97,
    new_n98, new_n99, new_n100, new_n101, new_n102, new_n103, new_n104,
    new_n105, new_n106, new_n107, new_n108, new_n109, new_n110, new_n111,
    new_n112, new_n113, new_n114, new_n115, new_n116, new_n117, new_n118,
    new_n119, new_n120, new_n121, new_n122, new_n123, new_n124, new_n125,
    new_n126, new_n128, new_n129, new_n130, new_n131, new_n132, new_n133,
    new_n134, new_n135, new_n136, new_n137, new_n138, new_n139, new_n140,
    new_n141, new_n142, new_n143, new_n144, new_n145, new_n146, new_n147,
    new_n148, new_n149, new_n150, new_n151, new_n152, new_n153, new_n154,
    new_n155, new_n156, new_n157, new_n158, new_n159, new_n160, new_n161,
    new_n162, new_n163, new_n164, new_n165, new_n166, new_n167, new_n168,
    new_n169, new_n170, new_n171, new_n172, new_n173, new_n174, new_n175,
    new_n176, new_n177, new_n178, new_n180;
  NAND3_X1  g000(.A1(\dest_x[27] ), .A2(\dest_x[28] ), .A3(\dest_x[29] ), .ZN(new_n91));
  INV_X1    g001(.A(\dest_x[26] ), .ZN(new_n92));
  INV_X1    g002(.A(\dest_x[23] ), .ZN(new_n93));
  NAND2_X1  g003(.A1(\dest_x[14] ), .A2(\dest_x[15] ), .ZN(new_n94));
  OR2_X1    g004(.A1(\dest_x[9] ), .A2(\dest_x[10] ), .ZN(new_n95));
  NAND2_X1  g005(.A1(\dest_x[11] ), .A2(new_n95), .ZN(new_n96));
  NOR2_X1   g006(.A1(\dest_x[12] ), .A2(\dest_x[13] ), .ZN(new_n97));
  AOI21_X1  g007(.A(new_n94), .B1(new_n96), .B2(new_n97), .ZN(new_n98));
  OR2_X1    g008(.A1(\dest_x[16] ), .A2(new_n98), .ZN(new_n99));
  AOI21_X1  g009(.A(\dest_x[18] ), .B1(\dest_x[17] ), .B2(new_n99), .ZN(new_n100));
  NAND2_X1  g010(.A1(\dest_x[19] ), .A2(\dest_x[20] ), .ZN(new_n101));
  NOR2_X1   g011(.A1(new_n100), .A2(new_n101), .ZN(new_n102));
  NOR3_X1   g012(.A1(\dest_x[21] ), .A2(\dest_x[22] ), .A3(new_n102), .ZN(new_n103));
  NOR2_X1   g013(.A1(new_n93), .A2(new_n103), .ZN(new_n104));
  NAND3_X1  g014(.A1(\dest_x[24] ), .A2(\dest_x[25] ), .A3(new_n104), .ZN(new_n105));
  AOI21_X1  g015(.A(new_n91), .B1(new_n92), .B2(new_n105), .ZN(new_n106));
  OR4_X1    g016(.A1(\dest_x[7] ), .A2(\dest_x[8] ), .A3(\dest_x[10] ), .A4(\dest_x[16] ), .ZN(new_n107));
  OR4_X1    g017(.A1(\dest_x[3] ), .A2(\dest_x[4] ), .A3(\dest_x[5] ), .A4(\dest_x[6] ), .ZN(new_n108));
  INV_X1    g018(.A(\dest_x[17] ), .ZN(new_n109));
  OR4_X1    g019(.A1(new_n109), .A2(\dest_x[18] ), .A3(\dest_x[26] ), .A4(new_n96), .ZN(new_n110));
  OR3_X1    g020(.A1(new_n107), .A2(new_n108), .A3(new_n110), .ZN(new_n111));
  NOR2_X1   g021(.A1(\dest_x[1] ), .A2(\dest_x[2] ), .ZN(new_n112));
  NAND3_X1  g022(.A1(\dest_x[24] ), .A2(\dest_x[25] ), .A3(new_n112), .ZN(new_n113));
  INV_X1    g023(.A(new_n97), .ZN(new_n114));
  OR4_X1    g024(.A1(\dest_x[21] ), .A2(new_n94), .A3(new_n114), .A4(new_n101), .ZN(new_n115));
  OR4_X1    g025(.A1(\dest_x[22] ), .A2(new_n93), .A3(new_n113), .A4(new_n115), .ZN(new_n116));
  OAI21_X1  g026(.A(new_n106), .B1(new_n111), .B2(new_n116), .ZN(new_n117));
  NAND4_X1  g027(.A1(\dest_x[0] ), .A2(\dest_x[1] ), .A3(\dest_x[2] ), .A4(\dest_x[3] ), .ZN(new_n118));
  OR4_X1    g028(.A1(\dest_x[22] ), .A2(new_n93), .A3(new_n95), .A4(new_n118), .ZN(new_n119));
  NAND4_X1  g029(.A1(\dest_x[8] ), .A2(\dest_x[11] ), .A3(\dest_x[25] ), .A4(new_n92), .ZN(new_n120));
  NAND4_X1  g030(.A1(\dest_x[4] ), .A2(\dest_x[5] ), .A3(\dest_x[6] ), .A4(\dest_x[7] ), .ZN(new_n121));
  OR3_X1    g031(.A1(new_n120), .A2(new_n121), .A3(new_n91), .ZN(new_n122));
  AOI21_X1  g032(.A(\dest_x[17] ), .B1(\dest_x[16] ), .B2(new_n98), .ZN(new_n123));
  NOR4_X1   g033(.A1(new_n115), .A2(new_n119), .A3(new_n122), .A4(new_n123), .ZN(new_n124));
  OAI211_X1 g034(.A(new_n100), .B(new_n124), .C1(\dest_x[24] ), .C2(new_n104), .ZN(new_n125));
  INV_X1    g035(.A(new_n125), .ZN(new_n126));
  OAI21_X1  g036(.A(new_n117), .B1(new_n106), .B2(new_n126), .ZN(\outport[0] ));
  NOR2_X1   g037(.A1(new_n106), .A2(new_n126), .ZN(new_n128));
  INV_X1    g038(.A(\dest_y[20] ), .ZN(new_n129));
  INV_X1    g039(.A(\dest_y[12] ), .ZN(new_n130));
  INV_X1    g040(.A(\dest_y[11] ), .ZN(new_n131));
  NOR2_X1   g041(.A1(\dest_y[9] ), .A2(\dest_y[10] ), .ZN(new_n132));
  OAI21_X1  g042(.A(new_n130), .B1(new_n131), .B2(new_n132), .ZN(new_n133));
  OAI21_X1  g043(.A(\dest_y[14] ), .B1(\dest_y[13] ), .B2(new_n133), .ZN(new_n134));
  INV_X1    g044(.A(new_n134), .ZN(new_n135));
  AND2_X1   g045(.A1(\dest_y[15] ), .A2(new_n135), .ZN(new_n136));
  OAI21_X1  g046(.A(\dest_y[17] ), .B1(\dest_y[16] ), .B2(new_n136), .ZN(new_n137));
  INV_X1    g047(.A(new_n137), .ZN(new_n138));
  OAI21_X1  g048(.A(\dest_y[19] ), .B1(\dest_y[18] ), .B2(new_n138), .ZN(new_n139));
  NOR3_X1   g049(.A1(new_n129), .A2(\dest_y[21] ), .A3(new_n139), .ZN(new_n140));
  OR3_X1    g050(.A1(\dest_y[21] ), .A2(\dest_y[22] ), .A3(new_n140), .ZN(new_n141));
  NAND2_X1  g051(.A1(\dest_y[23] ), .A2(new_n141), .ZN(new_n142));
  INV_X1    g052(.A(\dest_y[16] ), .ZN(new_n143));
  OAI21_X1  g053(.A(new_n135), .B1(new_n143), .B2(\dest_y[17] ), .ZN(new_n144));
  NAND4_X1  g054(.A1(\dest_y[5] ), .A2(\dest_y[6] ), .A3(\dest_y[7] ), .A4(\dest_y[8] ), .ZN(new_n145));
  NAND4_X1  g055(.A1(\dest_y[1] ), .A2(\dest_y[2] ), .A3(\dest_y[3] ), .A4(\dest_y[4] ), .ZN(new_n146));
  INV_X1    g056(.A(\dest_y[13] ), .ZN(new_n147));
  AND3_X1   g057(.A1(\dest_y[27] ), .A2(\dest_y[28] ), .A3(\dest_y[29] ), .ZN(new_n148));
  NAND4_X1  g058(.A1(new_n147), .A2(\dest_y[14] ), .A3(\dest_y[15] ), .A4(new_n148), .ZN(new_n149));
  NAND2_X1  g059(.A1(\dest_y[24] ), .A2(\dest_y[25] ), .ZN(new_n150));
  INV_X1    g060(.A(\dest_y[19] ), .ZN(new_n151));
  OR4_X1    g061(.A1(\dest_y[18] ), .A2(new_n151), .A3(\dest_y[22] ), .A4(\dest_y[26] ), .ZN(new_n152));
  NOR4_X1   g062(.A1(new_n131), .A2(\dest_y[12] ), .A3(new_n150), .A4(new_n152), .ZN(new_n153));
  INV_X1    g063(.A(\dest_x[0] ), .ZN(new_n154));
  NAND3_X1  g064(.A1(new_n154), .A2(\dest_y[0] ), .A3(new_n132), .ZN(new_n155));
  NOR3_X1   g065(.A1(new_n129), .A2(\dest_y[21] ), .A3(new_n155), .ZN(new_n156));
  NAND2_X1  g066(.A1(new_n153), .A2(new_n156), .ZN(new_n157));
  NOR4_X1   g067(.A1(new_n145), .A2(new_n146), .A3(new_n149), .A4(new_n157), .ZN(new_n158));
  INV_X1    g068(.A(\dest_y[17] ), .ZN(new_n159));
  NOR2_X1   g069(.A1(\dest_y[16] ), .A2(new_n159), .ZN(new_n160));
  OAI211_X1 g070(.A(new_n144), .B(new_n158), .C1(new_n135), .C2(new_n160), .ZN(new_n161));
  INV_X1    g071(.A(new_n161), .ZN(new_n162));
  OAI211_X1 g072(.A(new_n142), .B(new_n162), .C1(\dest_y[23] ), .C2(new_n141), .ZN(new_n163));
  NOR2_X1   g073(.A1(new_n142), .A2(new_n150), .ZN(new_n164));
  OAI21_X1  g074(.A(new_n148), .B1(\dest_y[26] ), .B2(new_n164), .ZN(new_n165));
  OR4_X1    g075(.A1(\dest_y[1] ), .A2(\dest_y[2] ), .A3(\dest_y[3] ), .A4(\dest_y[4] ), .ZN(new_n166));
  INV_X1    g076(.A(\dest_y[10] ), .ZN(new_n167));
  NOR4_X1   g077(.A1(\dest_y[5] ), .A2(\dest_y[6] ), .A3(\dest_y[7] ), .A4(\dest_y[8] ), .ZN(new_n168));
  NAND4_X1  g078(.A1(\dest_y[9] ), .A2(new_n167), .A3(\dest_y[23] ), .A4(new_n168), .ZN(new_n169));
  NOR4_X1   g079(.A1(\dest_y[16] ), .A2(new_n159), .A3(new_n166), .A4(new_n169), .ZN(new_n170));
  NAND2_X1  g080(.A1(new_n153), .A2(new_n170), .ZN(new_n171));
  AOI21_X1  g081(.A(new_n171), .B1(\dest_y[13] ), .B2(new_n133), .ZN(new_n172));
  AND3_X1   g082(.A1(new_n129), .A2(\dest_y[21] ), .A3(new_n139), .ZN(new_n173));
  OAI211_X1 g083(.A(new_n136), .B(new_n172), .C1(new_n140), .C2(new_n173), .ZN(new_n174));
  NOR3_X1   g084(.A1(\dest_x[0] ), .A2(\dest_y[0] ), .A3(new_n174), .ZN(new_n175));
  OAI21_X1  g085(.A(new_n163), .B1(new_n165), .B2(new_n175), .ZN(new_n176));
  INV_X1    g086(.A(new_n176), .ZN(new_n177));
  OAI21_X1  g087(.A(new_n117), .B1(new_n128), .B2(new_n177), .ZN(new_n178));
  INV_X1    g088(.A(new_n178), .ZN(\outport[1] ));
  AOI21_X1  g089(.A(new_n174), .B1(\dest_x[0] ), .B2(\dest_y[0] ), .ZN(new_n180));
  NOR3_X1   g090(.A1(\outport[0] ), .A2(new_n180), .A3(new_n165), .ZN(\outport[2] ));
  assign    \outport[3]  = 1'b0;
  assign    \outport[4]  = 1'b0;
  assign    \outport[5]  = 1'b0;
  assign    \outport[6]  = 1'b0;
  assign    \outport[7]  = 1'b0;
  assign    \outport[8]  = 1'b0;
  assign    \outport[9]  = 1'b0;
  assign    \outport[10]  = 1'b0;
  assign    \outport[11]  = 1'b0;
  assign    \outport[12]  = 1'b0;
  assign    \outport[13]  = 1'b0;
  assign    \outport[14]  = 1'b0;
  assign    \outport[15]  = 1'b0;
  assign    \outport[16]  = 1'b0;
  assign    \outport[17]  = 1'b0;
  assign    \outport[18]  = 1'b0;
  assign    \outport[19]  = 1'b0;
  assign    \outport[20]  = 1'b0;
  assign    \outport[21]  = 1'b0;
  assign    \outport[22]  = 1'b0;
  assign    \outport[23]  = 1'b0;
  assign    \outport[24]  = 1'b0;
  assign    \outport[25]  = 1'b0;
  assign    \outport[26]  = 1'b0;
  assign    \outport[27]  = 1'b0;
  assign    \outport[28]  = 1'b0;
  assign    \outport[29]  = 1'b0;
endmodule


