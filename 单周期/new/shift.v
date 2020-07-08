`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/28 21:24:18
// Design Name: 
// Module Name: shift
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


module shift (d,sa,right,arith,sh);
input  [31:0]  d;
input  [4:0]     sa;
input  right,arith;
output [31:0] sh;
reg  [31:0] sh;
    
// ����߼�
always  @*  begin
    if   (!right)  begin // rightΪ�߼�0ʱ������
        sh = d << sa;
    end else  if   (!arith)  begin // rightΪ�߼�1����arithΪ�߼�0ʱ�����ơ�0����
        sh =  d  >>  sa;
    end else begin // ���ơ�1����                     
        sh =  $signed(d)  >>>  sa;
    end
end
endmodule
