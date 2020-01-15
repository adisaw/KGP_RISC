`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:19 10/26/2019 
// Design Name: 
// Module Name:    writeaddress 
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

module writeaddress(
	input clk,
	input [5:0] opcode,
		input [4:0] rtAddr,
		input [4:0] rsAddr,
		input [31:0] ALUOut,
		input [31:0] ra,
		input [31:0] MemOut,
		output reg [4:0] wrAddr,
		output reg RegWrite,
		output reg [31:0] wrData
		
		
    );
reg [1:0]code;
reg [3:0]funcode;
always @(*)
	begin
		code=opcode[5:4];
		funcode=opcode[3:0];
		if(code==2'b00)     //if Arithmetic or shift or immediate operation
			begin
			if(funcode!=4'b0010 && funcode!=4'b0011)
			begin
			RegWrite=1;
			wrAddr=rsAddr;
			wrData=ALUOut;     //ALUOut needs to be written in rsAddr
		
			end
		end
		else if(code==2'b11)    //if branch instruction
			begin
			if(funcode==4'b1001)        //ra needs to be written at raAddr
				begin
				RegWrite=1;
				wrAddr=5'b11111;
				wrData=ra;
				
				end
			else
				begin              //otherwise nothing to be written
					RegWrite=0;
					wrAddr=0;
					wrData=0;
				end
			end
		else if(code==2'b01)    //if load word
			begin
				if(funcode==4'b0000)
					begin
					RegWrite=1;
					wrAddr=rtAddr;
					wrData=MemOut;
					
						//MemOut to be written at rsAddr
					end
				else 
					begin
						RegWrite=0;    //otherwise nothing
						wrAddr=0;
						wrData=0;
					end
			end
		else 
		begin
			RegWrite=0;        //otherwise nothing
			wrAddr=0;
			wrData=0;
		end
	end
endmodule
