`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/14 18:31:55
// Design Name: 
// Module Name: MUX2X1
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


module MUX2X1(Q,D,S,Y);
input Q,D,S;
output Y;
function select;
       input Q,D;
       input S;
         case(S)
            1'b0:select=Q;
            1'b1:select=D;
         endcase
endfunction
assign Y=select(Q,D,S);
endmodule