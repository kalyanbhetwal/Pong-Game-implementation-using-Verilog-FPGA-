`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:11:39 07/24/2015 
// Design Name: 
// Module Name:    Ball_animation 
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
module Ball_animation(
	 input reset,
    input clk,
	 output reg[9:0] ball_x,
	 output reg[9:0] ball_y
    );
reg[9:0] x=200;
reg[9:0] y=300;
reg ytopflag;
reg xleftflag;

always@( clk)begin
ball_x=x;
ball_y=y;
end
endmodule
