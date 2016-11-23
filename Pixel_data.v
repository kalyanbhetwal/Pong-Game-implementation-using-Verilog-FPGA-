`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:18:11 07/19/2015 
// Design Name: 
// Module Name:    Pixel_data 
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
module Pixel_data(
	 input clk,
	 input reset,
    input [9:0] x_pos,
    input [9:0] y_pos,
	 input [7:0] data,
    output reg [3:0] RED,
    output reg [3:0] GREEN,
    output reg [3:0] BLUE,
	 output reg [2:0]address
    );
//
reg[2:0]x;
/////////////////////////////////////////////////////
///////// ball parameters and screen edges///////////
/////////////////////////////////////////////////////
wire[9:0]ball_x_left;
wire[9:0]ball_x_right;
wire[9:0]ball_y_top;
wire[9:0]ball_y_buttom;
reg signed[31:0] delta_x;
reg signed[31:0] delta_y;
wire[9:0]ball_x;
wire[9:0]ball_y;
reg [9:0]ball_rx;
reg [9:0]ball_ry;
//////////////////////////////////////////////////////////

parameter[3:0]ball_size=8;

localparam xinc1 = +1;
localparam xdec1 = -1;
localparam yinc1 = +1;
localparam ydec1 =-1;

wire refresh_clk;
////////////////////////////////////////////////////////////

assign ball_x_left   = ball_rx;
assign ball_x_right  = ball_x_left + 8- 1;
assign ball_y_top    = ball_ry;
assign ball_y_buttom = ball_y_top + 8- 1;


/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
always@(*)
begin
if(ball_ry<1)
delta_y=yinc1;
else if(ball_ry>479)
delta_y=ydec1;
else if(ball_rx<1)
delta_x=xinc1;
else if(ball_rx>638)
delta_x=xdec1;
end

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
always@(posedge clk or posedge reset)begin
	if(reset)begin
		ball_rx=300;
		ball_ry=400;
		//delta_x=-1;
		//delta_y=+1;
	end
else 
   begin
	ball_rx=ball_x;
	ball_ry=ball_y;
	end
end
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
always@(posedge clk )
begin
    if(  y_pos >=ball_y_top && y_pos <=ball_y_buttom  && x_pos>=ball_x_left && x_pos<=ball_x_right)
	 begin
	 address<=y_pos[2:0]-ball_y_top[2:0];
	 x<=x_pos[2:0]-ball_x_left[2:0];
	      if(data[x]==1'b1)
			begin
			RED=4'b1111;
	      GREEN=4'b0000;
	      BLUE=4'b1111;
			end
			else begin
	      RED=4'b0000;
	      GREEN=4'b0000;
	      BLUE=4'b0000;
	      end
	end
 else begin
	 RED=4'b0000;
	 GREEN=4'b0000;
	 BLUE=4'b0000;
	 end	 	 
end

/////////////////////////////////////////////////////////////
assign refresh_clk = (x_pos==0 && y_pos==460);
assign ball_x = refresh_clk?( ball_rx + delta_x):ball_rx;
assign ball_y = refresh_clk?(ball_ry + delta_y):ball_ry;
////////////////////////////////////////////////////////////
/*
always@(clk or x_pos or y_pos)
begin
    if(y_pos>=0&&y_pos<=7) 
    begin
	 y=y_pos[2:0];
	 x=x_pos[2:0];
	 address<=y;
	     if(data[x]==1'b1)
	      begin
	      RED=4'b1111;
	      GREEN=4'b0000;
	      BLUE=4'b1111;
      	end
			else begin
	      RED=4'b0000;
	      GREEN=4'b0000;
	      BLUE=4'b0000;
	      end
			
    end
	 
	// else if(y_pos>300 && y_pos<400 && x_pos>300 && x_pos<400)
	// begin
   // RED=4'b1111;
	// GREEN=4'b0000;
	// BLUE=4'b1111;
	// end
	 else begin
	 RED=4'b0000;
	 GREEN=4'b0000;
	 BLUE=4'b0000;
	 end
end
*/
endmodule
