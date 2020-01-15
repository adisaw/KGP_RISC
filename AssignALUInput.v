`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:22:33 10/26/2019 
// Design Name: 
// Module Name:    AssignALUInput 
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
module AssignALUInput(
input [31:0] rs,
		input [31:0] rt,
		input [4:0] shamt,
		input [15:0] imm,
		input [5:0] opcode,
		output reg [31:0] inp1,
		output reg [31:0] inp2
    );
reg [1:0]code;
reg [3:0]funcode;
always @(*)
	begin
		code=opcode[5:4];
		funcode=opcode[3:0];
	
			    //for various arithmetic and shift operations involving 2 reg 
				if(funcode==4'd0 | funcode==4'd2 | funcode==4'd3 | funcode==4'd4| funcode==4'd6 | funcode==4'd7 | funcode==4'd10 | funcode==4'd11 |funcode==4'd13 )
					begin
					inp1=rs;
					inp2=rt;
					end
				else if(funcode==4'd8|funcode==4'd9|funcode==4'd12)  //involving 1 reg and shamt
					begin
					inp1=rs;
					inp2={27'b0,shamt};
					end
		
				else if(opcode==6'd1 | opcode==6'd5)     //immediate operations
				begin
					inp1=rs;
					if(imm[15]==1'b1)
						inp2={16'b1111111111111111,imm};
					else inp2={16'b0000000000000000,imm};
				end
				else                 //Otherwise not a work of ALU
				begin
					inp1=0;
					inp2=0;
				end
	end

endmodule