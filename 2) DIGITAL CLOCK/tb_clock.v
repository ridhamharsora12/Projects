`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:02:09 07/17/2023
// Design Name:   clock
// Module Name:   /home/ise/VLSI_/PROJECT/DIGITAL CLOCK/clock/tb_clock.v
// Project Name:  clock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_clock;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [6:0] segments;
	wire [3:0] anodes;

	// Instantiate the Unit Under Test (UUT)
	clock uut (
		.clk(clk), 
		.reset(reset), 
		.segments(segments), 
		.anodes(anodes)
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		reset = 0;
		
		@(posedge clk)
		#1 reset = 1;
		@(posedge clk)
		#1 reset = 0;
		$finish;
    end
endmodule

