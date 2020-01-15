`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:28:43 10/26/2019 
// Design Name: 
// Module Name:    ExtendSign 
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
module ExtendSign(
	 input [15:0] in,
    output [31:0] out
    );

assign out[31:16]={16{in[15]}};
assign out[15:0]=in;

endmodule