`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:28:32 07/20/2023 
// Design Name: 
// Module Name:    counter 
// Project Name:     counter
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
module counter(
	input 		 	 increment,
	input 			 decrement,
	input 			 reset,
	input 			 clk,
	output reg [1:0] count
    );
	
	reg 	  enable;
	reg [1:0] mux_out;
	
	always@(*)
		begin
			case(increment)
				1'b0 : mux_out = count - 1;
				1'b1 : mux_out = count + 1;
			endcase
		end
	
	always@(*)
		enable = increment | decrement;
		
	always@(posedge clk)
		begin
			if(reset) 
				begin
					count <= 0;
				end
			else if(enable) 
				begin
					count <= mux_out;
				end
		end
endmodule
