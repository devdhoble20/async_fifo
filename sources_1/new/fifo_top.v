`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2022 01:19:17
// Design Name: 
// Module Name: fifo_top
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


module fifo_top(w_clk,r_clk,rst,d_in,d_out,full,empty,wd_en,rd_en,w_en,r_en,w_ptr,r_ptr,w_ptrsync,r_ptrsync);
input w_clk,r_clk,wd_en,rd_en,rst;
output full,empty,r_en,w_en;
input [7:0] d_in;
output  [7:0] d_out;
output  [5:0] w_ptr,r_ptr,w_ptrsync,r_ptrsync;
wire [5:0] r_ptrgray,w_ptrgray;
reg [5:0]  r_ptrgray1,r_ptrgray2, w_ptrgray1,w_ptrgray2;

binarytogray u1(.ip(r_ptr), .op(r_ptrgray));
binarytogray u2(.ip(w_ptr), .op(w_ptrgray));
graytobinary u3(.ip(r_ptrgray2),.op(r_ptrsync));
graytobinary u4(.ip(w_ptrgray2),.op(w_ptrsync));

write_logic u5(.w_clk(w_clk),.r_ptrsync(r_ptrsync),.wd_en(wd_en),.w_ptr(w_ptr),.full(full),.rst(rst));
read_logic u6(.r_clk(r_clk),.w_ptrsync(w_ptrsync),.r_ptr(r_ptr),.rd_en(rd_en),.rst(rst),.empty(empty));
dual_port_ram u7(.r_clk(r_clk),.w_clk(w_clk),.w_en(w_en),.r_en(r_en),.r_addr(r_ptr),.w_addr(w_ptr),.rst(rst),.d_in(d_in),.d_out(d_out));

assign w_en = (~full) & wd_en ;
assign r_en = (~empty) & rd_en;


always @(posedge w_clk or posedge rst)
    begin
    if(rst)
        begin
            r_ptrgray1 <= 6'b0;
            r_ptrgray2 <= 6'b0;
        end
    else
        begin
            r_ptrgray1 <= r_ptrgray;
            r_ptrgray2 <= r_ptrgray1;
        end
    end
    
    
always @(posedge r_clk or posedge rst)
    begin
    if(rst)
        begin
            w_ptrgray1 <= 6'b0;
            w_ptrgray2 <= 6'b0;
        end
    else
        begin
            w_ptrgray1 <= w_ptrgray;
            w_ptrgray2 <= w_ptrgray1;
        end
    end

endmodule
