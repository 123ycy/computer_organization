`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/30 20:14:57
// Design Name: 
// Module Name: MAIN
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MAIN(Clk,En,Clrn,IF_ADDR,EX_X,EX_Y,EX_R,E_Rd,M_Rd,Rs,Rt,IF_Inst,ID_Inst,EX_PC,Pcsrc);

input Clk,En,Clrn;
output[31:0] IF_ADDR,EX_R,EX_X,EX_Y,IF_Inst,ID_Inst,EX_PC;
output [4:0] E_Rd,M_Rd,Rs,Rt;
output [1:0]Pcsrc;

wire [31:0] IF_Result,IF_Addr,IF_PCadd4,D,ID_Qa,ID_Qb,ID_PCadd4,ID_Inst;
wire [31:0] E_R1,E_R2,E_I,E_I_L2,Y,E_R,M_R,M_S,Dout,W_D,W_C,ID_EXTIMM,Alu_X,E_NUM,ID_EXTIMM_L2,ID_PC;
wire[5:0] E_Op;
wire [4:0] ID_Wr,W_Wr;
wire [1:0]Aluc,E_Aluc,FwdA,FwdB,E_FwdA,E_FwdB;
wire Regrt,Se,Wreg,Aluqb,Reg2reg,Wmem,Z;
wire E_Wreg,E_Reg2reg,E_Wmem,E_Aluqb,Cout,M_Wreg,M_Reg2reg,M_Wmem,W_Wreg,W_Reg2reg,stall,condep;

//IF

MUX4X32 mux4x32(IF_PCadd4,0,EX_PC,0,Pcsrc,IF_Result);
PC pc(IF_Result,Clk,En,Clrn,IF_Addr,stall);
PCadd4 pcadd4(IF_Addr,IF_PCadd4);
INSTMEM instmem(IF_Addr,IF_Inst);

REG_IF_ID ifid(IF_PCadd4,IF_Inst,En,Clk,Clrn,ID_PCadd4,ID_Inst,stall,condep);

//ID
CONUNIT conunit(E_Op,ID_Inst[31:26],ID_Inst[5:0],Z,Regrt,Se,Wreg,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg,ID_Inst[25:21],ID_Inst[20:16],E_Rd,M_Rd,E_Wreg,M_Wreg,FwdA,FwdB,E_Reg2reg,stall,condep);

MUX2X5 mux2x5(ID_Inst[15:11],ID_Inst[20:16],Regrt,ID_Wr);
EXT16T32 ext16t32(ID_Inst[15:0],Se,ID_EXTIMM);//ID_EXTIMM对应E_I
REGFILE_Down regfile(ID_Inst[25:21],ID_Inst[20:16],D,W_Wr,W_Wreg,Clk,Clrn,ID_Qa,ID_Qb);
SHIFTER32_L2 shifter2(ID_EXTIMM,ID_EXTIMM_L2);//控制冒险
CLA_32 cla_32(ID_PCadd4,ID_EXTIMM_L2,0,ID_PC,Cout);//ID_PCadd4对应E_PC
REG_ID_EX idex(ID_PC,Wreg,Reg2reg,Wmem,ID_Inst[31:26],Aluc,Aluqb,ID_Qa,ID_Qb,ID_EXTIMM,ID_Wr,En,Clk,Clrn,E_Wreg,E_Reg2reg,E_Wmem,E_Op,E_Aluc,E_Aluqb,E_R1,E_R2,E_I,E_Rd,FwdA,FwdB,E_FwdA,E_FwdB,stall,EX_PC,condep);

//EX
//SHIFTER32_L2 shifter2(E_I,E_I_L2);
MUX4X32 mux4x32_ex_1(E_R1,D,M_R,0,E_FwdA,Alu_X);
MUX4X32 mux4x32_ex_2(E_R2,D,M_R,0,E_FwdB,E_NUM);
MUX2X32 mux2x32_1(E_I,E_NUM,E_Aluqb,Y);
ALU alu(Alu_X,Y,E_Aluc,E_R,Z);
//CLA_32 cla_32(E_PC,E_I_L2,0,EX_PC,Cout);

REG_EX_MEM exmem(E_Wreg,E_Reg2reg,E_Wmem,E_R,E_NUM,E_Rd,En,Clk,Clrn,M_Wreg,M_Reg2reg,M_Wmem,M_R,M_S,M_Rd);

//MEM
DATAMEM datamem(M_R,M_S,Clk,M_Wmem,Dout);

REG_MEM_WB memwb(M_Wreg,M_Reg2reg,M_R,Dout,M_Rd,En,Clk,Clrn,W_Wreg,W_Reg2reg,W_D,W_C,W_Wr);

//WB
MUX2X32 mux2x32_2(W_C,W_D,W_Reg2reg,D);

assign IF_ADDR=IF_Addr;
assign EX_R=E_R;
assign EX_X=Alu_X;
assign EX_Y=Y;
assign Rs=ID_Inst[25:21];
assign Rt=ID_Inst[20:16];
endmodule


