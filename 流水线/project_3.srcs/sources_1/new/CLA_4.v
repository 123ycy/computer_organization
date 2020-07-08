`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 18:11:29
// Design Name: 
// Module Name: CLA_4
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


module CLA_4(X,Y,Cin,S,Cout);
input [3:0]X,Y;
input Cin;
output Cout;
output [3:0]S;
wire [3:0]A,B,C;
wire [16:0]D;

and (A[0],Y[3],X[3]);
and (A[1],Y[2],X[2]);
and (A[2],Y[1],X[1]);
and (A[3],Y[0],X[0]);
or  (B[0],Y[3],X[3]);
or  (B[1],Y[2],X[2]);
or  (B[2],Y[1],X[1]);
or  (B[3],Y[0],X[0]);
not (C[0],A[0]);
not (C[1],A[1]);
not (C[2],A[2]);
not (C[3],A[3]);
//初始值
nand (D[1],B[0],A[1]);
nand (D[2],B[0],B[1],A[2]);
nand (D[3],B[0],B[1],B[2],A[3]);
nand (D[4],B[0],B[1],B[2],B[3],Cin);
nand (Cout,C[0],D[1],D[2],D[3],D[4]);
//Cout运算
and  (D[5],C[0],B[0]);
nand (D[6],B[1],A[2]);
nand (D[7],B[1],B[2],A[3]);
nand (D[8],B[1],B[2],B[3],Cin);
nand (D[9],C[1],D[6],D[7],D[8]);
xor  (S[3],D[5],D[9]);
//S[3]运算
and  (D[10],C[1],B[1]);
nand (D[11],B[2],A[3]);
nand (D[12],B[2],B[3],Cin);
nand (D[13],C[2],D[11],D[12]);
xor  (S[2],D[10],D[13]);
//S[2]运算
and  (D[14],C[2],B[2]);
nand (D[15],B[3],Cin);
nand (D[16],C[3],D[15]);
xor  (S[1],D[14],D[16]);
//S[1]运算
and  (D[0],C[3],B[3]);
xor  (S[0],D[0],Cin);
//S[0]运算
endmodule
