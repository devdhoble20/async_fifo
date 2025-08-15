`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2022 19:07:01
// Design Name: 
// Module Name: dual_port_ram
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


module dual_port_ram(r_clk,w_clk,r_en,w_en,r_addr,w_addr,rst,d_in,d_out);
input r_clk,w_clk,r_en,w_en,rst;
input [5:0] r_addr,w_addr;
input [7:0] d_in;
output reg [7:0] d_out;
reg [7:0] mem[31:0];
wire [7:0] wd_out;
integer i;

assign wd_out = mem[r_addr[4:0]];

always @(posedge w_clk , posedge rst)
    begin
        if(rst)
        begin
           // wd_out <= 8'b0;
            for(i = 0; i< 32;i=i+1)
                mem[i] <= 8'b0;
        end
        else
            begin
                if(w_en)
                    mem[w_addr[4:0]] <= d_in;
            end
    end

 always @(posedge r_clk, posedge rst)
    begin
        if(rst)
            begin
                d_out <= 8'b0;
           end
        else 
            if(r_en)
                d_out <= wd_out;
     end
endmodule
