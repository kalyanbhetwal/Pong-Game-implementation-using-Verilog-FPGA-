`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:09:15 07/18/2015
// Design Name:   topmodule
// Module Name:   F:/PongGame/topmodule_tb.v
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

module topmodule_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [3:0] iRED;
	reg [3:0] iGREEN;
	reg [3:0] iBLUE;

	// Outputs
	wire VGA_HSYNC;
	wire VGA_VSYNC;
	wire [9:0] x_cor;
	wire [9:0] y_cor;
	wire [3:0] VGA_R;
	wire [3:0] VGA_G;
	wire [3:0] VGA_B;

	// Instantiate the Unit Under Test (UUT)
	topmodule uut (
		.clk(clk), 
		.reset(reset), 
		.VGA_HSYNC(VGA_HSYNC), 
		.VGA_VSYNC(VGA_VSYNC), 
		.x_cor(x_cor), 
		.y_cor(y_cor), 
		.VGA_R(VGA_R), 
		.VGA_G(VGA_G), 
		.VGA_B(VGA_B), 
		.iRED(iRED), 
		.iGREEN(iGREEN), 
		.iBLUE(iBLUE)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1'b1;
		iRED = 0;
		iGREEN = 0;
		iBLUE = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
				reset=1'b0;
		   iRED = 4'b1111;
		   iGREEN =4'b0000;
		   iBLUE = 4'b1010;

	end
	always begin
	clk=~clk;
	#10;
	end
      
endmodule

