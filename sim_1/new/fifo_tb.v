`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2022 02:35:04
// Design Name: 
// Module Name: fifo_tb
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


module fifo_tb();
reg r_clk,w_clk,rst,rd_en,wd_en;
reg [7:0] d_in;
wire [7:0] d_out;
wire full,empty,r_en,w_en;
wire [5:0] w_ptr,r_ptr,w_ptrsync,r_ptrsync;
reg [7:0] mmry[63:0];
integer i,j;
fifo_top u0(w_clk,r_clk,rst,d_in,d_out,full,empty,wd_en,rd_en,w_en,r_en,w_ptr,r_ptr,w_ptrsync,r_ptrsync);
initial
    begin
        i = 0;
        r_clk = 0;
        w_clk = 0;
        rst = 0;
        wd_en = 0;
        rd_en = 0;
        #20 rst = 1;
        #20 rst = 0;
        wd_en = 1; 
        #290 rd_en = 1;
        #1640 wd_en = 0;
    end

always@(rst)
    begin
        if(rst)
            for(j=0;j<=63;j=j+1)
                mmry[j] = j;
     end
always #10 w_clk = ~w_clk;
always #12.5 r_clk = ~r_clk;
always@(posedge w_clk)
    begin
        if((~full)&&(wd_en))
            begin
                d_in = mmry[i];
                if(i == 63)
                    i <= 0;
                else
                    i <= i+1;
            end
    end
endmodule
