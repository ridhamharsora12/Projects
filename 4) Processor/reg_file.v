`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:44:25 07/31/2023 
// Design Name: 
// Module Name:    reg_file 
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
module reg_file(
   input clk,
	input [4:0] rd_addr1,
	input [4:0] rd_addr2,
	
	output [31:0] rd_data1,
	output [31:0] rd_data2,
	
	input [4:0] wr_addr,
	input		wr_en,
	input [31:0]wr_data
);

reg [31:0] regs[0:31];

always@(posedge clk) 
	if(wr_en) regs[wr_addr] <= wr_data;
	
assign rd_data1 = regs[rd_addr1];
assign rd_data2 = regs[rd_addr2];


endmodule
