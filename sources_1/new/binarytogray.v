`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2022 01:13:06
// Design Name: 
// Module Name: binarytogray
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


module binarytogray(ip,op);
input [5:0] ip;
output reg [5:0] op;

always @(*)
    begin
       op = ip ^ (ip >> 1);
    end
endmodule
