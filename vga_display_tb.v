`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:28:46 07/18/2015
// Design Name:   vga_display
// Module Name:   F:/PongGame/vga_display_tb.v
// Project Name:  PongGame
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vga_display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vga_display_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [9:0] VGA_HSYNC;
	wire [9:0] VGA_VSYNC;
	wire [9:0] x_cor;
	wire [9:0] y_cor;
	wire [3:0] RED;
	wire [3:0] GREEN;
	wire [3:0] BLUE;

	// Instantiate the Unit Under Test (UUT)
	vga_display uut (
		.clk(clk), 
		.reset(reset), 
		.VGA_HSYNC(VGA_HSYNC), 
		.VGA_VSYNC(VGA_VSYNC), 
		.x_cor(x_cor), 
		.y_cor(y_cor), 
		.RED(RED), 
		.GREEN(GREEN), 
		.BLUE(BLUE)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
       reset = 1'b1;
	end
	always begin
	clk=~clk;
	#20;
   end
	 
endmodule

