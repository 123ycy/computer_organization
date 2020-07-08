`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 20:05:51
// Design Name: 
// Module Name: ADDSUB_32
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


module ADDSUB_32(X,Y,Sub,S,Cout);
input [31:0]X,Y;
input Sub;
output [31:0]S;
output Cout;
CLA_32 ADD(X,Y^{32{Sub}},Sub,S,Cout);
endmodule
