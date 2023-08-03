`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:11:57 08/01/2023
// Design Name:   processor
// Module Name:   /home/ise/VLSI_/PROJECT/processor1/tb_processor.v
// Project Name:  processor1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_processor;

	// Inputs
	reg clk;
	reg reset;

	processor 
	#(
	.RAM_WIDTH 			(32				),
	.RAM_ADDR_BITS 		(9				),
	.DATA_FILE 			("data_file.txt"),
	.DATA_START_ADDR 	(0				),
	.DATA_END_ADDR		(7				),
	.PROG_FILE 			("program.hex"	),
	.PROG_START_ADDR 	(0				),
	.PROG_END_ADDR		(14             )
	)

	// Instantiate the Unit Under Test (UUT)
	processor_inst(
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0,tb_processor);
		
		reset = 0;
		@(posedge clk);
		#1 reset = 1;
		
		@(posedge clk);
		#1 reset = 0;
		
		repeat(30)@(posedge clk);
		$finish;
	end
      
endmodule

