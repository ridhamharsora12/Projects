`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:45:28 07/20/2023 
// Design Name:    64 byte RAM
// Module Name:    RAM 
// Project Name:   Implementation of 64-byte single port random-access memory (RAM).

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

//Aim : Implementation of 64-byte single port random-access memory (RAM).

//Theory : 
//To make 64 byte RAM, let's consider 1byte(8bit) data and total 64 location
//so 6 bit required for address b'coz total 64 location
//for data 8 bit required b'coz data is of 1 byte

module RAM(
   input clk,
	input write_en,      
	input  [5:0] address,
	input  [7:0] data_in,
	output [7:0] data_out
	);
	
	reg [7:0] ram [63:0];  //8bit X 64  
	reg [5:0] address_reg; // address register
	
	always@(posedge clk)
		begin
			if(write_en) ram[address] <= data_in;
			else		 address_reg <= address;
		end
		
	assign data_out = ram[address_reg];
	
endmodule
