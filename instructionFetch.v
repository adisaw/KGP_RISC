`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:15 10/16/2019 
// Design Name: 
// Module Name:    instructionFetch 
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
module instructionFetch(
    input clk,
	 input reset,
	 input [31:0]inInstr,
	 input [31:0]PCin,
	 output reg [31:0]outInstr,
	 output reg [31:0]PCout
    );
	 
initial begin
	PCout<=32'b0;
	outInstr<=32'b0;
end

always @(posedge clk)
begin
		if(reset==1'b1)
			begin
			outInstr<=0;
			PCout<=0;
			end
		else
			begin
			outInstr<=inInstr;
			PCout<=PCin;
			end
		end


endmodule
