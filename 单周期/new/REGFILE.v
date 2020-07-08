`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/06 00:15:07
// Design Name: 
// Module Name: REGFILE
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


module REGFILE(Ra,Rb,D,Wr,We,Clk,Clrn,Qa,Qb);
    input [4:0] Ra,Rb;
    input [31:0] D;
    input [4:0] Wr;
    input We,Clk,Clrn;
    output [31:0] Qa,Qb;
    
    integer i;
     reg [31:0]R[1:31];
    
    assign Qa=(Ra==0)?0:R[Ra];
    assign Qb=(Rb==0)?0:R[Rb];
    always @ (posedge Clk)
        if(Clrn == 0)
        begin
            for (i=0;i<32;i=i+1) R[i]<=0;
            end
        else
            if(We==1 && Wr!=0 ) R[Wr]<=D;
        
endmodule
