`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:28:56 07/18/2015 
// Design Name: 
// Module Name:    topmodule 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module topmodule(  clk,
						 reset,
						 VGA_HSYNC,
						 VGA_VSYNC,
						  VGA_R,
						 VGA_G,
						 VGA_B
					 );
input clk;
input reset;

//vga side signal
output  VGA_HSYNC;
output  VGA_VSYNC;

output  [3:0] VGA_R;
output  [3:0] VGA_G;
output  [3:0] VGA_B;

wire con;
wire[9:0]con_x,con_y;
wire[3:0]con_R,con_G,con_B;
wire[2:0]mem_con;
wire[7:0]mem_out;


clock25MHZ clk1 (
    .CLKIN_IN(clk), 
    .RST_IN(reset), 
    .CLKFX_OUT(con), 
    .CLKIN_IBUFG_OUT(CLKIN_IBUFG_OUT), 
    .CLK0_OUT()
    );
vga_display     vga1(.clk(con),
						 .reset(reset),
						 .VGA_HSYNC(VGA_HSYNC),
						 .VGA_VSYNC(VGA_VSYNC),
						 .x_cor(con_x),
						 .y_cor(con_y),
						  .RED(VGA_R),
						 .GREEN(VGA_G),
						 .BLUE(VGA_B),
						 .iRED(con_R),
						 .iGREEN(con_G),
						 .iBLUE(con_B)
		
		);
Pixel_data  pix(
		.clk(con),
		.reset(reset),
    .x_pos(con_x),
    .y_pos(con_y),
    .RED(con_R),
    .GREEN(con_G),
    .BLUE(con_B),
	 .data(mem_out),
	 .address(mem_con)
	 );
ROM rom(
  .clka(con), // input clka
  .addra(mem_con), // input [2 : 0] addra
  .douta(mem_out) // output [7 : 0] douta
);

endmodule
