`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 20:10:32
// Design Name: 
// Module Name: REG_MEM_WB
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


module REG_MEM_WB(D0,D1,D2,D3,D4,En,Clk,Clrn,Q0,Q1,Q2,Q3,Q4);
input D0,D1;
input [31:0] D2,D3;
input [4:0] D4;
input En,Clk,Clrn;
output Q0,Q1;
output [31:0] Q2,Q3;
output [4:0] Q4;
D_FFEC q0(D0,Clk,En,Clrn,Q0);
D_FFEC q1(D1,Clk,En,Clrn,Q1);
D_FFEC32 q2(D2,Clk,En,Clrn,Q2);
D_FFEC32 q3(D3,Clk,En,Clrn,Q3);
D_FFEC5 q4(D4,Clk,En,Clrn,Q4);
endmodule

