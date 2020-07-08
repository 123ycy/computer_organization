`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/10 19:22:18
// Design Name: 
// Module Name: CPU
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


module  CPU(Clk,Clrn,Inst,currentaddress,R,Dout,D,rd,rt,rs,sa,func,op,immediate,address,newaddress,Qb);
input  Clk,Clrn;
output   [31:0]Inst,currentaddress,R,Dout,D,newaddress;
output [4:0]rd,rt,rs,sa;
output [5:0]func,op;
output [15:0]immediate;
output [25:0]address;
output [31:0]Qb;
wire[31:0] newaddress,currentaddress_4,address1,currentaddress_immediate;
wire [31:0]kong;
wire [4:0]rd,rt,rs,sa;
wire [5:0]func,op;
wire [15:0]immediate;
wire [25:0]address;
wire [31:0] kuozhan;
wire Z,Regrt,Se,Wreg,Aluqb,Wmem,Reg2reg;
wire [1:0] Pcsrc,Aluc;
wire [31:0]Y;
wire [31:0]Qa,Qb;
wire [4:0]Wr;
assign rd=Inst[15:11];
assign rt=Inst[20:16];
assign rs=Inst[25:21];
assign sa=Inst[10:6];
assign func=Inst[5:0];
assign op=Inst[31:26];
assign immediate=Inst[15:0];
assign address=Inst[25:0];
CONUNIT conunit(op,func,Z,Regrt,Se,Wreg,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg);
PC pc(Clk,Clrn,newaddress,currentaddress);
INSTMEM instmem (currentaddress,Inst);
REGFILE regfile (rs,rt,D,Wr,Wreg,Clk,Clrn,Qa,Qb);
ALU alu (Qa,Y,Aluc,R,Z);
EXT16T32_ ext16t32 (immediate,Se,kuozhan);
DATAMEM datamem (R,Qb,Clk,Wmem,Dout);
CLA_32 pcplus4(currentaddress,32'h4,1'b0,currentaddress_4);
CLA_32 br_adr (currentaddress_4,(kuozhan << 2),1'b0,currentaddress_immediate); 
assign address1={currentaddress_4[31:28],address,2'b00}; 
MUX2X5 mux2x5(rd,rt,Regrt,Wr);
MUX2X32 mux2x322 (kuozhan,Qb,Aluqb,Y);
MUX2X32 mux2x323 (Dout,R,Reg2reg,D);
MUX4X32 mux4x32 (currentaddress_4,kong,currentaddress_immediate,address1,Pcsrc,newaddress);
endmodule