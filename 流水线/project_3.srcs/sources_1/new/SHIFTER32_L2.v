`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 19:58:11
// Design Name: 
// Module Name: SHIFTER32_L2
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


module SHIFTER32_L2(X,Sh);
input [31:0] X;
output [31:0] Sh;
parameter z=2'b00;
assign Sh={X[29:0],z};
endmodule
