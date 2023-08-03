`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:59:11 07/20/2023
// Design Name:   RAM
// Module Name:   /home/ise/VLSI_/PROJECT/RAM/tb_ram.v
// Project Name:  RAM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RAM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_ram;

	// Inputs
	reg clk;
	reg write_en;
	reg [5:0] address;
	reg [7:0] data_in;

	// Outputs
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	RAM uut (
		.clk(clk), 
		.write_en(write_en), 
		.address(address), 
		.data_in(data_in), 
		.data_out(data_out)
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		write_en = 1;
		data_in = 8'd10;
		address = 6'd0;
		#10;
		
		write_en = 1;
		data_in = 8'd20;
		address = 6'd1;
		#10;
		
		write_en = 1;
		data_in = 8'd30;
		address = 6'd2;
		#10;
		
		write_en = 0;
		address = 6'd0;
		#10;
		
		write_en = 0;
		address = 6'd1;
		#10;
		
		write_en = 0;
		address = 6'd2;
		#10;
		
		$stop;
		
	end
      
endmodule

