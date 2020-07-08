`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 18:41:07
// Design Name: 
// Module Name: DEC5T32E
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


module DEC5T32E(I,En,Y);
input [4:0]I;
input En;
output [31:0]Y;
wire [5:0]W;

not (W[0],I[0]);
not (W[1],I[1]);
not (W[2],I[2]);
not (W[3],I[3]);
not (W[4],I[4]);
not (W[5],En);

nor (Y[0],I[4],I[3],I[2],I[1],I[0],W[5]);
nor (Y[1],I[4],I[3],I[2],I[1],W[0],W[5]);
nor (Y[2],I[4],I[3],I[2],W[1],I[0],W[5]);
nor (Y[3],I[4],I[3],I[2],W[1],W[0],W[5]);
nor (Y[4],I[4],I[3],W[2],I[1],I[0],W[5]);
nor (Y[5],I[4],I[3],W[2],I[1],W[0],W[5]);
nor (Y[6],I[4],I[3],W[2],W[1],I[0],W[5]);
nor (Y[7],I[4],I[3],W[2],W[1],W[0],W[5]);
nor (Y[8],I[4],W[3],I[2],I[2],I[0],W[5]);
nor (Y[9],I[4],W[3],I[2],I[1],W[0],W[5]);
nor (Y[10],I[4],W[3],I[2],W[1],I[0],W[5]);
nor (Y[11],I[4],W[3],I[2],W[1],W[0],W[5]);
nor (Y[12],I[4],W[3],W[2],I[1],I[0],W[5]);
nor (Y[13],I[4],W[3],W[2],I[1],W[0],W[5]);
nor (Y[14],I[4],W[3],W[2],W[1],I[0],W[5]);
nor (Y[15],I[4],W[3],W[2],W[1],W[0],W[5]);
nor (Y[16],W[4],I[3],I[2],I[1],I[0],W[5]);
nor (Y[17],W[4],I[3],I[2],I[1],W[0],W[5]);
nor (Y[18],W[4],I[3],I[2],W[1],I[0],W[5]);
nor (Y[19],W[4],I[3],I[2],W[1],W[0],W[5]);
nor (Y[20],W[4],I[3],W[2],I[1],I[0],W[5]);
nor (Y[21],W[4],I[3],W[2],I[1],W[0],W[5]);
nor (Y[22],W[4],I[3],W[2],W[1],I[0],W[5]);
nor (Y[23],W[4],I[3],W[2],W[1],W[0],W[5]);
nor (Y[24],W[4],W[3],I[2],I[1],I[0],W[5]);
nor (Y[25],W[4],W[3],I[2],I[1],W[0],W[5]);
nor (Y[26],W[4],W[3],I[2],W[1],I[0],W[5]);
nor (Y[27],W[4],W[3],I[2],W[1],W[0],W[5]);
nor (Y[28],W[4],W[3],W[2],I[1],I[0],W[5]);
nor (Y[29],W[4],W[3],W[2],I[1],W[0],W[5]);
nor (Y[30],W[4],W[3],W[2],W[1],I[0],W[5]);
nor (Y[31],W[4],W[3],W[2],W[1],W[0],W[5]);
endmodule
