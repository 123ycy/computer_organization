`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 18:13:53
// Design Name: 
// Module Name: PCadd4
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


module PCadd4(PC_o,PCadd4);
input [31:0] PC_o;
//偏移量
output [31:0] PCadd4;
//新指令地址
CLA_32 cla32(PC_o,4,0, PCadd4, Cout);
endmodule