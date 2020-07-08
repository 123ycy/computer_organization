`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 20:04:14
// Design Name: 
// Module Name: ALU
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


module ALU(X,Y,Aluc,R,Z);//ALU´úÂë
input [31:0]X,Y;
input [1:0]Aluc;
output [31:0]R;
output Z;
wire[31:0]d_as,d_and,d_or,d_and_or;
ADDSUB_32 as(X,Y,Aluc[0],d_as);
assign d_and=X&Y;
assign d_or=X|Y;
MUX2X32 select1(d_and,d_or,Aluc[0],d_and_or);
MUX2X32 seleted(d_as,d_and_or,Aluc[1],R);
assign Z=~|R;
endmodule

