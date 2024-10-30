// Benchmark "epfl-original/random_control/1_ctrl" written by ABC on Sat Nov 18 16:11:27 2023

module \epfl-original/random_control/1_ctrl  ( 
    \opcode[0] , \opcode[1] , \opcode[2] , \opcode[3] , \opcode[4] ,
    \op_ext[0] , \op_ext[1] ,
    \sel_reg_dst[0] , \sel_reg_dst[1] , \sel_alu_opB[0] , \sel_alu_opB[1] ,
    \alu_op[0] , \alu_op[1] , \alu_op[2] , \alu_op_ext[0] ,
    \alu_op_ext[1] , \alu_op_ext[2] , \alu_op_ext[3] , halt, reg_write,
    sel_pc_opA, sel_pc_opB, beqz, bnez, bgez, bltz, jump, Cin, invA, invB,
    sign, mem_write, sel_wb  );
  input  \opcode[0] , \opcode[1] , \opcode[2] , \opcode[3] , \opcode[4] ,
    \op_ext[0] , \op_ext[1] ;
  output \sel_reg_dst[0] , \sel_reg_dst[1] , \sel_alu_opB[0] ,
    \sel_alu_opB[1] , \alu_op[0] , \alu_op[1] , \alu_op[2] ,
    \alu_op_ext[0] , \alu_op_ext[1] , \alu_op_ext[2] , \alu_op_ext[3] ,
    halt, reg_write, sel_pc_opA, sel_pc_opB, beqz, bnez, bgez, bltz, jump,
    Cin, invA, invB, sign, mem_write, sel_wb;
  wire new_n34, new_n35, new_n36, new_n37, new_n38, new_n39, new_n40,
    new_n41, new_n42, new_n43, new_n44, new_n45, new_n46, new_n47, new_n48,
    new_n49, new_n50, new_n51, new_n52, new_n53, new_n56, new_n57, new_n58,
    new_n59, new_n61, new_n62, new_n64, new_n65, new_n66, new_n67, new_n68,
    new_n69, new_n70, new_n71, new_n72, new_n73, new_n76, new_n78, new_n80,
    new_n82, new_n83, new_n85, new_n86, new_n88, new_n90, new_n93, new_n96,
    new_n97, new_n99, new_n103, new_n104, new_n109;
  INV_X1    g00(.A(\opcode[2] ), .ZN(new_n34));
  INV_X1    g01(.A(\opcode[4] ), .ZN(new_n35));
  INV_X1    g02(.A(\opcode[3] ), .ZN(new_n36));
  OAI21_X1  g03(.A(\opcode[1] ), .B1(new_n36), .B2(\opcode[4] ), .ZN(new_n37));
  AOI21_X1  g04(.A(new_n34), .B1(new_n35), .B2(new_n37), .ZN(new_n38));
  OAI211_X1 g05(.A(\opcode[1] ), .B(new_n38), .C1(\opcode[3] ), .C2(new_n35), .ZN(new_n39));
  NOR2_X1   g06(.A1(\opcode[3] ), .A2(new_n35), .ZN(new_n40));
  NOR2_X1   g07(.A1(new_n34), .A2(new_n40), .ZN(new_n41));
  INV_X1    g08(.A(new_n41), .ZN(new_n42));
  INV_X1    g09(.A(\opcode[1] ), .ZN(new_n43));
  INV_X1    g10(.A(\opcode[0] ), .ZN(new_n44));
  NOR2_X1   g11(.A1(new_n36), .A2(new_n35), .ZN(new_n45));
  NAND2_X1  g12(.A1(new_n44), .A2(new_n45), .ZN(new_n46));
  NAND2_X1  g13(.A1(new_n43), .A2(new_n46), .ZN(new_n47));
  OAI21_X1  g14(.A(new_n47), .B1(new_n43), .B2(new_n40), .ZN(new_n48));
  INV_X1    g15(.A(new_n48), .ZN(new_n49));
  NOR2_X1   g16(.A1(\opcode[3] ), .A2(\opcode[4] ), .ZN(new_n50));
  NOR3_X1   g17(.A1(\opcode[1] ), .A2(new_n45), .A3(new_n50), .ZN(new_n51));
  OR2_X1    g18(.A1(\opcode[2] ), .A2(new_n51), .ZN(new_n52));
  OAI21_X1  g19(.A(new_n42), .B1(new_n49), .B2(new_n52), .ZN(new_n53));
  INV_X1    g20(.A(new_n53), .ZN(\sel_alu_opB[1] ));
  OAI21_X1  g21(.A(new_n39), .B1(new_n35), .B2(\sel_alu_opB[1] ), .ZN(\sel_reg_dst[0] ));
  NAND2_X1  g22(.A1(new_n34), .A2(new_n48), .ZN(new_n56));
  INV_X1    g23(.A(new_n50), .ZN(new_n57));
  NOR2_X1   g24(.A1(new_n43), .A2(new_n57), .ZN(new_n58));
  OAI21_X1  g25(.A(new_n56), .B1(new_n34), .B2(new_n58), .ZN(new_n59));
  INV_X1    g26(.A(new_n59), .ZN(\sel_reg_dst[1] ));
  NOR3_X1   g27(.A1(\opcode[0] ), .A2(new_n45), .A3(new_n35), .ZN(new_n61));
  OAI211_X1 g28(.A(new_n34), .B(new_n47), .C1(new_n37), .C2(new_n61), .ZN(new_n62));
  INV_X1    g29(.A(new_n62), .ZN(\sel_alu_opB[0] ));
  NAND3_X1  g30(.A1(\opcode[0] ), .A2(\opcode[1] ), .A3(\opcode[3] ), .ZN(new_n64));
  INV_X1    g31(.A(\op_ext[0] ), .ZN(new_n65));
  AOI21_X1  g32(.A(new_n64), .B1(\opcode[4] ), .B2(new_n65), .ZN(new_n66));
  NOR2_X1   g33(.A1(\opcode[2] ), .A2(new_n66), .ZN(new_n67));
  OAI21_X1  g34(.A(\opcode[3] ), .B1(new_n35), .B2(\op_ext[1] ), .ZN(new_n68));
  AND2_X1   g35(.A1(new_n34), .A2(new_n68), .ZN(new_n69));
  NOR2_X1   g36(.A1(new_n67), .A2(new_n69), .ZN(new_n70));
  NOR3_X1   g37(.A1(new_n43), .A2(new_n65), .A3(new_n46), .ZN(new_n71));
  NOR2_X1   g38(.A1(new_n70), .A2(new_n71), .ZN(new_n72));
  NAND2_X1  g39(.A1(\opcode[0] ), .A2(new_n40), .ZN(new_n73));
  AOI21_X1  g40(.A(new_n72), .B1(\opcode[2] ), .B2(new_n73), .ZN(\alu_op[0] ));
  NOR3_X1   g41(.A1(new_n43), .A2(new_n41), .A3(new_n69), .ZN(\alu_op[1] ));
  AOI211_X1 g42(.A(new_n36), .B(new_n35), .C1(\opcode[0] ), .C2(\opcode[1] ), .ZN(new_n76));
  OAI33_X1  g43(.A1(new_n34), .A2(new_n40), .A3(new_n35), .B1(\opcode[2] ), .B2(new_n50), .B3(new_n76), .ZN(\alu_op[2] ));
  NAND3_X1  g44(.A1(\opcode[2] ), .A2(new_n46), .A3(\sel_reg_dst[0] ), .ZN(new_n78));
  OAI21_X1  g45(.A(new_n78), .B1(new_n36), .B2(new_n59), .ZN(\alu_op_ext[0] ));
  INV_X1    g46(.A(new_n61), .ZN(new_n80));
  OAI21_X1  g47(.A(new_n39), .B1(new_n52), .B2(new_n80), .ZN(\alu_op_ext[1] ));
  AOI21_X1  g48(.A(new_n43), .B1(new_n36), .B2(new_n73), .ZN(new_n82));
  OAI21_X1  g49(.A(new_n42), .B1(new_n52), .B2(new_n82), .ZN(new_n83));
  INV_X1    g50(.A(new_n83), .ZN(\alu_op_ext[3] ));
  NAND2_X1  g51(.A1(new_n36), .A2(new_n73), .ZN(new_n85));
  OAI21_X1  g52(.A(new_n34), .B1(new_n49), .B2(new_n85), .ZN(new_n86));
  AOI21_X1  g53(.A(\alu_op_ext[3] ), .B1(new_n59), .B2(new_n86), .ZN(\alu_op_ext[2] ));
  AOI21_X1  g54(.A(\opcode[2] ), .B1(\opcode[1] ), .B2(new_n73), .ZN(new_n88));
  AND3_X1   g55(.A1(new_n44), .A2(new_n50), .A3(new_n88), .ZN(halt));
  INV_X1    g56(.A(new_n38), .ZN(new_n90));
  NAND2_X1  g57(.A1(new_n90), .A2(new_n86), .ZN(reg_write));
  NOR2_X1   g58(.A1(new_n34), .A2(new_n57), .ZN(jump));
  INV_X1    g59(.A(jump), .ZN(new_n93));
  NOR2_X1   g60(.A1(new_n44), .A2(new_n93), .ZN(sel_pc_opA));
  NOR2_X1   g61(.A1(\opcode[0] ), .A2(new_n93), .ZN(sel_pc_opB));
  NOR3_X1   g62(.A1(\opcode[0] ), .A2(new_n45), .A3(new_n36), .ZN(new_n96));
  INV_X1    g63(.A(new_n96), .ZN(new_n97));
  AOI211_X1 g64(.A(new_n34), .B(new_n97), .C1(\opcode[1] ), .C2(new_n96), .ZN(beqz));
  NOR4_X1   g65(.A1(new_n36), .A2(\opcode[4] ), .A3(new_n44), .A4(\opcode[1] ), .ZN(new_n99));
  AND2_X1   g66(.A1(\opcode[2] ), .A2(new_n99), .ZN(bnez));
  NOR2_X1   g67(.A1(new_n64), .A2(\alu_op[2] ), .ZN(bgez));
  NOR3_X1   g68(.A1(new_n43), .A2(new_n97), .A3(new_n34), .ZN(bltz));
  NOR2_X1   g69(.A1(new_n34), .A2(new_n76), .ZN(new_n103));
  NOR3_X1   g70(.A1(\opcode[2] ), .A2(new_n66), .A3(new_n99), .ZN(new_n104));
  NOR2_X1   g71(.A1(new_n103), .A2(new_n104), .ZN(Cin));
  NOR2_X1   g72(.A1(new_n70), .A2(new_n104), .ZN(invA));
  NOR3_X1   g73(.A1(new_n67), .A2(new_n69), .A3(new_n103), .ZN(invB));
  assign    sign = 1'b1;
  OAI21_X1  g74(.A(new_n88), .B1(\opcode[1] ), .B2(new_n61), .ZN(new_n109));
  INV_X1    g75(.A(new_n109), .ZN(mem_write));
  NOR2_X1   g76(.A1(new_n56), .A2(new_n73), .ZN(sel_wb));
endmodule


