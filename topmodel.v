`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:22:21 07/18/2015 
// Design Name: 
// Module Name:    topmodel 
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
module topmodel(   clk,
						 reset,
						 VGA_HSYNC,
						 VGA_VSYNC,
						 x_cor,
						 y_cor,
						  RED,
						 GREEN,
						 BLUE,
						 iRED,
						 iGREEN,
						 iBLUE)
    );

clock25MHZ clk1 (
    .CLKIN_IN(clk), 
    .RST_IN(RST_IN), 
    .CLKFX_OUT(CLKFX_OUT), 
    .CLKIN_IBUFG_OUT(CLKIN_IBUFG_OUT), 
    .CLK0_OUT(CLK0_OUT)
    );
endmodule
