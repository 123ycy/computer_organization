`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/06 00:22:28
// Design Name: 
// Module Name: CLA_32
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


module CLA_32(X,Y,Cin,S,Cout);
    input [31:0] X,Y;
    input Cin;
    output [31:0]S;
    output Cout;
    wire cout0,cout1,cout2,cout3,cout4,cout5,cout6;
    CLA_4 add0(X[3:0],Y[3:0],Cin,S[3:0],cout0);
    CLA_4 add1(X[7:4],Y[7:4],cout0,S[7:4],cout1);
    CLA_4 add2(X[11:8],Y[11:8],cout1,S[11:8],cout2);
    CLA_4 add3(X[15:12],Y[15:12],cout2,S[15:12],cout3);
    CLA_4 add4(X[19:16],Y[19:16],cout3,S[19:16],cout4);
    CLA_4 add5(X[23:20],Y[23:20],cout4,S[23:20],cout5);
    CLA_4 add6(X[27:24],Y[27:24],cout5,S[27:24],cout6);
    CLA_4 add7(X[31:28],Y[31:28],cout6,S[31:28],Cout);
endmodule

