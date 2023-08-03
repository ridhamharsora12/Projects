`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:49:15 07/20/2023
// Design Name:   counter
// Module Name:   /home/ise/VLSI_/PROJECT/counter/tb_counter.v
// Project Name:  counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_counter;

	// Inputs
	reg increment;
	reg decrement;
	reg reset;
	reg clk;

	// Outputs
	wire [1:0] count;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.increment(increment), 
		.decrement(decrement), 
		.reset(reset), 
		.clk(clk), 
		.count(count)
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		#0 reset = 1;
		#10 reset = 0;
		
		increment = 1;
		decrement = 0;
		#10
		
		increment = 1;
		decrement = 0;
		#10
		
		increment = 1;
		decrement = 0;
		#10
		
		increment = 0;
		decrement = 0;
		#10
		
		increment = 0;
		decrement = 1;
		#10
		
		increment = 0;
		decrement = 1;
		#10
		
		increment = 0;
		decrement = 1;
		#10
		
		increment = 0;
		decrement = 1;
		#10
		
		$stop;
	end
	
      
endmodule

