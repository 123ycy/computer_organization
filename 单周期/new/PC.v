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

    input Clk;                         // ʱ��
    input Clrn;                         //�����
    input  [31:0] newAddress;           // ��ָ��
    output reg [31:0] currentAddress;    // ��ǰָ��
always@(posedge Clk or negedge Clrn )//��ʱ���źŴ��������ػ�������˴����½��صĵ�ʱ��

if(Clrn==0)  begin currentAddress <= 0; 
end else begin
currentAddress<= newAddress;
end
endmodule
