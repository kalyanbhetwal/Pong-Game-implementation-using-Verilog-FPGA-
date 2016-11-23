`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:40:25 07/17/2015 
// Design Name: 
// Module Name:    vga_display 
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
module vga_display(clk,
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
						 iBLUE);
//internal signal	
input clk;
input reset;
//vga side signal
output reg VGA_HSYNC;
output reg VGA_VSYNC;

output  reg[3:0] RED;
output  reg[3:0] GREEN;
output  reg[3:0] BLUE;

//Host side
input  [3:0] iRED;
input  [3:0] iGREEN;
input  [3:0] iBLUE;


output reg[9:0] x_cor;
output reg[9:0] y_cor;
//internal signals
reg[9:0]       V_Cnt;
reg[9:0]		   H_Cnt;


`include "VGA_Parameters.h"
    always @(*) begin
        if(H_Cnt >= X_START && H_Cnt < X_START + H_SYNC_DON &&
           V_Cnt >= Y_START && V_Cnt < Y_START + V_SYNC_DON ) begin
				RED   = iRED;
				GREEN = iGREEN;
				BLUE  = iBLUE;
			
        end
        else begin
           	RED   = 4'b0000;
				GREEN =4'b0000;
				BLUE  =4'b0000;
        end
    end
////////////////////////////////////////////////////
// Pixel Address Generator
///////////////////////////////////////////////////
always @(posedge clk or posedge reset) begin
        if(reset) begin
         x_cor<=0;
			y_cor<=0;	
        end
        else begin
            if(H_Cnt >= X_START && H_Cnt < X_START + H_SYNC_DON &&
               V_Cnt >= Y_START && V_Cnt < Y_START + V_SYNC_DON ) begin
                x_cor<= H_Cnt - X_START;
                y_cor<= V_Cnt - Y_START;
		

            end
        end
    end
////////////////////////////////////////////////////
/////////Horizontal Sync Generator//////////////////
////////////////////////////////////////////////////
always @(posedge clk or posedge reset ) begin
        if(reset) begin
            H_Cnt      <= 0;
            VGA_HSYNC  <= 0;
        end
        else begin
            // H_Sync Counter and Generator
			   if( H_Cnt < H_SYNC_MAX ) begin
                if(H_Cnt == (H_SYNC_CYC-1)) begin
                    VGA_HSYNC <= 1;
                end
                H_Cnt <= H_Cnt + 10'b1;
            end
            else begin
                H_Cnt <= 0;
                VGA_HSYNC <= 0;
            end
        end
    end
    

//////////////////////////////////////////////////////
//////////// Vertical Sync Generator//////////////////
//////////////////////////////////////////////////////
always @(posedge clk or posedge reset) begin
        if(reset) begin
            V_Cnt      <= 0;
            VGA_VSYNC   <= 0;
        end
        else begin
            // When H_Sync Re-start
            if(H_Cnt == H_SYNC_MAX) begin
                // V_Sync Counter and Generator
                if( V_Cnt < V_SYNC_MAX ) begin
                    if(V_Cnt == (V_SYNC_CYC-1)) begin
                        VGA_VSYNC <= 1;
                    end
                    V_Cnt <= V_Cnt + 10'b1;
                end
                else begin
                    V_Cnt <= 0;
                    VGA_VSYNC <= 0;
                end
            end
        end
    end
endmodule
