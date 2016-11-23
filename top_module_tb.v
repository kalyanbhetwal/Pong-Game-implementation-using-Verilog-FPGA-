`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:33:05 07/25/2015
// Design Name:   topmodule
// Module Name:   F:/PongGame/top_module_tb.v
// Project Name:  PongGame
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: topmodule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_module_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire VGA_HSYNC;
	wire VGA_VSYNC;
	wire [3:0] VGA_R;
	wire [3:0] VGA_G;
	wire [3:0] VGA_B;

	// Instantiate the Unit Under Test (UUT)
	topmodule uut (
		.clk(clk), 
		.reset(reset), 
		.VGA_HSYNC(VGA_HSYNC), 
		.VGA_VSYNC(VGA_VSYNC), 
		.VGA_R(VGA_R), 
		.VGA_G(VGA_G), 
		.VGA_B(VGA_B)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1'b1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset =1'b0;

	end
	always begin
	clk=~clk;
	#10;
	end
      
endmodule

