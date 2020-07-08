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
    
// ×éºÏÂß¼­
always  @*  begin
    if   (!right)  begin // rightÎªÂß¼­0Ê±£¬×óÒÆ
        sh = d << sa;
    end else  if   (!arith)  begin // rightÎªÂß¼­1£¬ÇÒarithÎªÂß¼­0Ê±£¬ÓÒÒÆ¡¢0²¹¿Õ
        sh =  d  >>  sa;
    end else begin // ÓÒÒÆ¡¢1²¹¿Õ                     
        sh =  $signed(d)  >>>  sa;
    end
end
endmodule
