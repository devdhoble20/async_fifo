`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2022 01:03:21
// Design Name: 
// Module Name: read_logic
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


module read_logic(r_clk,w_ptrsync,r_ptr,rd_en,rst,empty);

input r_clk,rd_en,rst;
input [5:0] w_ptrsync;
output empty;
output reg [5:0] r_ptr;

assign empty = (w_ptrsync[5:0] == r_ptr[5:0]) ? 1:0 ;

always@(posedge r_clk, posedge rst)
    begin
        if(rst)
        begin
            r_ptr <= 6'b0;
        end
        else
            begin
                if(rd_en && ~empty)
                    begin
                        r_ptr <= r_ptr +1;
                    end
            end
    end
endmodule
