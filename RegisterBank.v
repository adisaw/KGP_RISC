`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:21:17 10/21/2019 
// Design Name: 
// Module Name:    RegisterBank 
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
module RegisterBank(
    input clk,
   input RegWrite,				//To decide if we need to write or not
   input [4:0] wrAddr,			//If Yes, at what address
   input [31:0] wrData,       //And what data
   input [4:0] rdAddrA,
	input [4:0] rdAddrB,		//Read Addresses and Read Data
	input mulflag,
	input [63:0]mulout,
   output reg [31:0] rdDataA,
   output reg [31:0] rdDataB,
	output reg [31:0] s0,
	output reg [31:0] s1,
	output reg [31:0] s2,
	output reg [31:0] t0,
	output reg [31:0] t2,
	output reg [31:0] t3,
	output reg [31:0] t4,
	output reg [31:0] reg19,
	output reg [31:0] reg20
	
  );

	reg [31:0] r[31:0]; 
	
	initial					//Initially make all registers 0
			begin
			r[0]=32'b0;	r[8]=32'b0;	r[16]=32'b0;	r[24]=32'b0;	
			r[1]=32'b0; r[9]=32'b0;	r[17]=32'b0;	r[25]=32'b0;	
			r[2]=32'b0; r[10]=32'b0;	r[18]=32'b0;	r[26]=32'b0;	
			r[3]=32'b0; r[11]=32'b0;	r[19]=32'b0;	r[27]=32'b0;	
			r[4]=32'b0; r[12]=32'b0;	r[20]=32'b0;	r[28]=32'b0;	
			r[5]=32'b0; r[13]=32'b0;	r[21]=32'b0;	r[29]=32'b0;	
			r[6]=32'b0; r[14]=32'b0;	r[22]=32'b0;	r[30]=32'b0;	
			r[7]=32'b0; r[15]=32'b0;	r[23]=32'b0;	r[31]=32'b0;	
			end
			

 	
   always @(*) 
		begin
		
				rdDataB=r[rdAddrB];          //Read Data
				rdDataA=r[rdAddrA];          //Read Data
				t0=r[7];
				s0=r[21];
				s1=r[22]; 
				s2=r[23];
				t2=r[9];
				t3=r[10];
				t4=r[11];
				reg19=r[19];
				reg20=r[20];
		end
		
   always @(posedge clk)            //Write Operation
	begin
      if(RegWrite) 
				r[wrAddr]<=wrData;
	
		if(mulflag)
		begin
			r[19]<=mulout[63:32];
			r[20]<=mulout[31:0];
		end
	end
		
		
endmodule

