`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:41 10/23/2019 
// Design Name: 
// Module Name:    Alu_unit 
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
module Alu_unit(
    input signed [31:0] inp1,
    input signed [31:0] inp2,
	 input [5:0] opcode,
    output reg [31:0] out,
	 output reg [63:0] mulout,
	 output reg carryFlag,
	 output reg zFlag,
	 output reg signFlag,
	 output reg overflowFlag,
	 output reg mulflag
    );
 
reg i;
reg sign;
reg shift;
wire [63:0]Mult;
wire [63:0]Multu;
wire [31:0]addval;
wire cc31,cc32;
wire[31:0]leftshift,rightshift,shifta;

signedmultiplication s1(inp1,inp2,Mult);
unsignedmultiplication s2(inp1,inp2,Multu);
adder add(inp1,inp2,addval,cc31,cc32);
BarrelShift left(inp1,1'b1,inp2,leftshift);
BarrelShift right(inp1,1'b0,inp2,rightshift);
ShiftArithmetic shifter(inp1,inp2,shifta);

always @(*)
	begin
		 	
		case(opcode) 
			        6'b000111 : begin            
						     //xor
									out=inp1^inp2;
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									mulflag=0;
									end
			        6'b000110 :begin 	//and
									out=inp1&inp2;
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									mulflag=0;
									end 
						6'b000100:begin		//comp
									out=~inp2+1'b1;
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									mulflag=0;
									end
						6'b000000:	begin		//add
									out=addval;
									overflowFlag=cc31^cc32;
									carryFlag=cc32;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									mulflag=0;
									end 
						6'b001000:	begin		//shll
									out=leftshift;
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									mulflag=0;
									end
						6'b001001:	begin		//shrl
									out=rightshift;
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									mulflag=0;
									end
						6'b001010:	begin		//shllv
									out=leftshift;
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									mulflag=0;
									end	
						6'b001011:begin		//shrlv
									out=rightshift;
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									mulflag=0;
									end	
						6'b001100:begin		//shra
									
									out=shifta;									
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									mulflag=0;
									end	
						6'b001101:	begin		//shrav
										
										out=shifta;
										overflowFlag=1'b0;
										carryFlag=1'b0;
										zFlag=(out==0)?1'b1:1'b0;
										signFlag=out[31];
										mulflag=0;
										end	
					
			
			            //Immediate type instructions
						6'b000101:	begin
									out=~inp2+1'b1;      //compi
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									mulflag=0;
									end
						6'b000001:	begin				//addi
									out=addval;
									overflowFlag=cc31^cc32;
									carryFlag=cc32;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									mulflag=0;
									end 
									
						6'b000010: begin //mult
									 mulout=Mult;
									 carryFlag=1'b0;
									 overflowFlag=1'b0;
									 signFlag=mulout[63];
									 zFlag=(mulout==0)?1'b1:1'b0;
									 mulflag = 1;
										end	
										
						6'b000011: begin //multu
								
									 mulout=Multu;
									 carryFlag=1'b0;
									 overflowFlag=1'b0;
									 signFlag=mulout[63];
									 zFlag=(mulout==0)?1'b1:1'b0;
									 mulflag = 1;	
									 end	
			
			
					default:                //default: keep everything 0
							begin
								out=0;
							end
		endcase
	end
endmodule
   



