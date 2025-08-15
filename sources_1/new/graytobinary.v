`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2022 01:17:34
// Design Name: 
// Module Name: graytobinary
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

module graytobinary(ip,op);
input [5:0] ip;
output reg [5:0] op;
integer k;
always @* begin // combinational logic
        for (k = 0; k < 6; k = k+1) begin
            op[k] = ^(ip >> k);
        end
    end
endmodule
