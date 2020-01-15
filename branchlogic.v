`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:33:25 10/23/2019 
// Design Name: 
// Module Name:    branchlogic 
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
module branchlogic(
	 input [5:0] opcode,
	 input [31:0] rs,
	 input [25:0] jAddr,
    input carryFlag,
    input zFlag,
    input overflowFlag,
    input signFlag,
	 input [31:0] PC,
    output reg [31:0] exNPC,
	 output reg PCSrc,
	 output reg [31:0] ra
    );
initial 
	begin
		exNPC=0;
		PCSrc=0;
		ra=0;
	end
reg [1:0]var;
reg [3:0]fcode;
always @(*)
	begin
	ra=0; 
		//ra is 0 by default
		var=opcode[5:4];
		fcode=opcode[3:0];
		if(var==2'b11)     //if we are branching
			begin
				if(fcode==4'b0000)
							begin       //b
								exNPC=jAddr[25:0];
								PCSrc=1;
							end
				else if(fcode==4'b0001)
						  begin       //bz
								if(zFlag==1) 
									begin
										exNPC=jAddr[25:0];
										PCSrc=1;
									end
								else 
									begin
									PCSrc=0;
									exNPC=0;
									end
							end
				else if(fcode==4'b0010)
						  begin		//bnz
								if(zFlag==0) 
									begin
										exNPC=jAddr[25:0];
										PCSrc=1;
									end
								else 
									begin
									PCSrc=0;
									exNPC=0;
									end
							end
				else if(fcode==4'b0011)
						  begin		//bcy
								if(carryFlag==1) 
									begin
										exNPC=jAddr[25:0];
										PCSrc=1;
									end
								else 
									begin
									PCSrc=0;
									exNPC=0;
									end
							end
				else if(fcode==4'b0100)
						  begin		//bncy
								if(carryFlag==0) 
									begin
										exNPC=jAddr[25:0];
										PCSrc=1;
									end
								else 
									begin
									PCSrc=0;
									exNPC=0;
									end
							end
				else if(fcode==4'b0101)
						  begin		//bs
								if(signFlag==1) 
									begin
								 		exNPC=jAddr[25:0];
										PCSrc=1;
									end
								else 
									begin
									PCSrc=0;
									exNPC=0;
									end
							end
				else if(fcode==4'b0110)
						  begin	//bns
								if(signFlag==0) 
									begin
										exNPC=jAddr[25:0];
										PCSrc=1;
									end
								else 
									begin
									PCSrc=0;
									exNPC=0;
									end
							end
				else if(fcode==4'b0111)
						  begin	//bv
								if(overflowFlag==1) 
									begin
										exNPC=jAddr[25:0];
										PCSrc=1;
									end
								else 
									begin
									PCSrc=0;
									exNPC=0;
									end
							end
				else if(fcode==4'b1000)
						  begin	//bnv
								if(overflowFlag==0) 
									begin
										exNPC=jAddr[25:0];
										PCSrc=1;
									end
								else 
									begin
									PCSrc=0;
									exNPC=0;
									end
							end
				else if(fcode==4'b1001)
						  begin		//call
								exNPC=jAddr[25:0];
								PCSrc=1;
								ra=PC+32'b00000000000000000000000000000001;   //Store the PC 
							end
				else if(fcode==4'b1110)
						  begin //return
								exNPC=ra[31:0];
								PCSrc=1;
							end
				else if(fcode==4'b1100)                                                      
					begin
						exNPC=rs[31:0];
						PCSrc=1;
					end
				else    
							begin //default case
								PCSrc=0;
								exNPC=0;
							end
		end
			
		
		else
		 begin //default case
				PCSrc=0;
				exNPC=0;
		end
end
	


endmodule
