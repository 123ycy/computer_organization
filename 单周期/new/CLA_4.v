`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/06 00:23:28
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
    input[3:0]X,Y;
    input Cin;
    output[3:0]S;
    output Cout;
     wire Cout0,Cout1,Cout2;
    and p0(G0,X[0],Y[0]);
    and p1(G1,X[1],Y[1]);
    and p2(G2,X[2],Y[2]);
    and p3(G3,X[3],Y[3]);
    or g0(P0,X[0],Y[0]);
    or g1(P1,X[1],Y[1]);
    or g2(P2,X[2],Y[2]);
    or g3(P3,X[3],Y[3]);
    and t1(T1,P3,G2);
    and t2(T2,P3,P2,G1);
    and t3(T3,P3,P2,P1,G0);
    and t4(T4,P3,P2,P1,P0,Cin);
    or f (Cout,G3,T1,T2,T3,T4);
    assign Cout0=G0|(P0&Cin);
    assign Cout1=G1|(P1&G0)|(P1&P0&Cin);
    assign Cout2=G2|(P2&G1)|(P2&P1&G0)|(P2&P1&P0&Cin);
    assign S[0]=((P0&(!G0))&(!Cin))|((!(P0&(!G0)))&(Cin));
    assign S[1]=((P1&(!G1))&(!Cout0))|((!(P1&(!G1)))&(Cout0));
    assign S[2]=((P2&(!G2))&(!Cout1))|((!(P2&(!G2)))&(Cout1));
    assign S[3]=((P3&(!G3))&(!Cout2))|((!(P3&(!G3)))&(Cout2));
endmodule

