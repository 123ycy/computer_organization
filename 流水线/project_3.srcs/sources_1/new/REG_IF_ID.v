`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 19:15:38
// Design Name: 
// Module Name: REG_IF_ID
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


module REG_IF_ID(D0,D1,En,Clk,Clrn,Q0,Q1,stall,condep);
input [31:0] D0,D1;
input En,Clk,Clrn;
input stall,condep;
output [31:0] Q0,Q1;
wire En_S,Clrn_C;
assign En_S=En&~stall;
assign Clrn_C=Clrn&~condep;
D_FFEC32 q0(D0,Clk,En_S,Clrn_C,Q0);
D_FFEC32 q1(D1,Clk,En_S,Clrn_C,Q1);
endmodule

