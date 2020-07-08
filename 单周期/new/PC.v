`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/06 00:11:45
// Design Name: 
// Module Name: PC
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


module PC(Clk,Clrn,newAddress,currentAddress);

    input Clk;                         // 时钟
    input Clrn;                         //清零端
    input  [31:0] newAddress;           // 新指令
    output reg [31:0] currentAddress;    // 当前指令
always@(posedge Clk or negedge Clrn )//当时钟信号处于上升沿或者清零端处于下降沿的的时候

if(Clrn==0)  begin currentAddress <= 0; 
end else begin
currentAddress<= newAddress;
end
endmodule
