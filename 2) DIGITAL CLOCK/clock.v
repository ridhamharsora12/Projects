`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:29:23 07/17/2023 
// Design Name: 
// Module Name:    clock 
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
module clock(
    input 		 clk,
	input		    reset,
	output reg[6:0] segments,
	output reg [3:0] anodes
	);
	
	reg [32:0] count;
	reg 	   clr_count;
	reg [5:0] mins;
	reg 	   clr_mins;
	reg [4:0] hrs;
	reg 	   clr_hrs;
	
	reg [31:0] seg_count;
	
	wire [6:0]mins_mss;
	wire [6:0]mins_lss;
	wire [6:0]hrs_mss;
	wire [6:0]hrs_lss;
	
	//count 
	always @(posedge clk)
	begin
		if(reset || clr_count) count <= 0;
		else      			   count <= count + 1;
	end
	
//	always @* clr_count = (count == 33'd5_999_999_999); //if true then clr_count = 1 for real 
	always @* clr_count = (count == 33'd99_999_999); //for 1s 
	
	//minutes counter
	always @(posedge clk)
	begin
		if(reset || clr_mins) mins <= 0;
		else if(clr_count)   mins <= mins + 1; //enable line
	end
	
	always @* clr_mins = clr_count&(mins == 6'd59); //if true then clr_mins = 1
	
	//hour counter
	always @(posedge clk)
	begin
		if(reset || clr_hrs)  hrs<= 0;
		else if(clr_mins)    hrs <= hrs + 1; //enable line
	end
	
	always @* clr_hrs = clr_mins & (hrs == 5'd23); //if true then clr_hrs = 1
	
	//segments 
	segments mins_seg(
   .number(mins),
	.segments({mins_mss,mins_lss})
	);
	
	segments hrs_seg(
   .number({1'b0,hrs}),
	.segments({hrs_mss,hrs_lss})
	);
	
	//segments counter
	always@(posedge clk)
		begin
			if(reset) seg_count <= 0;
			else      seg_count <= seg_count + 1;
		end
	
	//multiplexer to select segment 
	always@*
		begin
		 case(seg_count[18:17]) //two bit selectline
			2'd0 : segments = ~mins_lss;
			2'd1 : segments = ~mins_mss;
			2'd2 : segments = ~hrs_lss;
			2'd3 : segments = ~hrs_mss;
		 endcase
		end 
	
	//demultiplaxer to choose anode of to choose segment 
	always@*
		begin
		 case(seg_count[18:17]) //two bit selectline
			2'd0 : anodes = 4'b1110;
			2'd1 : anodes = 4'b1101;
			2'd2 : anodes = 4'b1011;
			2'd3 : anodes = 4'b0111;
		 endcase
		end 

endmodule