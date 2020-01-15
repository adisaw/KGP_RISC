`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:09:03 10/21/2019 
// Design Name: 
// Module Name:    ProgramCounter 
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
module ProgramCounter(
	 input clk,
	 input reset,
	 input PCSrc,
	 input [31:0]exNPC,
  
    output reg [31:0] pc
    );

initial begin
	pc=0;
	end
	
always @(posedge clk)      //Assigns pc_out equal to pc_in at every clock cycle
	begin
		//$display("%b",exNPC);
		if(reset)
		begin
				pc=0;
		end
		if(PCSrc==1'b1)
		begin
			  pc=exNPC;
		end
		else
		begin
			  pc=pc+32'b00000000000000000000000000000001;
		 end
	end

endmodule
