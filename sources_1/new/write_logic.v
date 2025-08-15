`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2022 20:15:10
// Design Name: 
// Module Name: write_logic
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


module write_logic(w_clk,r_ptrsync,wd_en,w_ptr,full,rst);
input w_clk,rst,wd_en;
input [5:0] r_ptrsync; 
output reg [5:0] w_ptr;
output  full;
wire flag;

assign full =({~w_ptr[5],w_ptr[4:0]} == r_ptrsync[5:0])? 1:0;
//assign flag = full;
always @(posedge w_clk or posedge rst)
    begin
        if(rst)
            begin
                //full <= 0;
                w_ptr <= 6'b0;
            end
        else
            begin
                if(wd_en && ~full)
                    begin
                        w_ptr <= w_ptr + 1;
                    end
            end
    end
endmodule
