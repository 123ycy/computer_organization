`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/06 00:14:02
// Design Name: 
// Module Name: INSTMEM
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


module INSTMEM(
    input [31:0] Addr,
    output [31:0] Inst
    );
    //写入只读指令
    wire [31:0] Rom [31:0];
    assign Rom[5'h00]=32'h20010008;           //addi r1,r0,8  [r1=8];
    assign Rom[5'h01]=32'h3402000c;           //ori r2,r0,12  [r2=12];
    assign Rom[5'h02]=32'h00411822;           //sub r3,r2,r1  [r3=4];
    assign Rom[5'h03]=32'h2004000a;           //addi r4,r0,10 [r4=10];
    assign Rom[5'h04]=32'h00442825;           //or r5,r2,r4  [r5=14];
    assign Rom[5'h05]=32'h00443024;           //and r6,r2,r4  [r6=8];
    assign Rom[5'h06]=32'h00223820;           //add r7,r1,r2  [r7=20];
    assign Rom[5'h07]=32'h08000009;           //j 9;
    assign Rom[5'h08]=32'h14220001;           //bne r1 r2 不等跳转到 10;
    assign Rom[5'h09]=32'h1026fffe;            //beq r1 r6 相等跳转到 8;
    assign Rom[5'h0a]=32'hac03000c;          //sw r3,12(r0)  [0000000c=4]; dout=4 
    assign Rom[5'h0b]=32'h8c04000c;          //lw r4,12(r0)  [r4=4];
    assign Rom[5'h0c]=32'h3048000a;          //andi r8,r2,10 [r8=8];
 assign Inst=Rom[Addr[6:2]];   
endmodule
