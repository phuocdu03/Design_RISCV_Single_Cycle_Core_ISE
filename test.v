`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:02:46 09/15/2024
// Design Name:   Single_Cycle_Top
// Module Name:   C:/TTTN/RISc_V/test.v
// Project Name:  RISc_V
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Single_Cycle_Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk=1'b1;
	reg rst;
	// Outputs
	wire [31:0] ALUResult;
	wire [31:0] RD2_Top;
	wire [31:0] RD1_Top;
	wire RegWrite,MemWrite,ALUSrc,ResultSrc;
   wire [2:0] ALUControl_Top;
	wire [4:0] A1,A2,A3;
	wire [31:0] WD3;
	wire [31:0] A;
	wire [31:0] RD;
	wire [31:0]ReadData;
	
	// Instantiate the Unit Under Test (UUT)
	Single_Cycle_Top uut (
		.clk(clk), 
		.rst(rst), 
		.ALUResult(ALUResult), 
		.RD2_Top(RD2_Top), 
		.RD1_Top(RD1_Top),
		.RegWrite(RegWrite),
		.ALUControl_Top(ALUControl_Top),
		.A1(A1),
		.A2(A2),
		.A3(A3),
		.WD3(WD3),
		.A(A),
		.RD(RD),
      .ReadData(ReadData),
		.MemWrite(MemWrite),
		.ALUSrc(ALUSrc),
		.ResultSrc(ResultSrc)		
	);

	initial begin
        $dumpfile("Single Cycle.vcd");
        $dumpvars(0);
    end

    always 
    begin
        clk = ~clk;
        #50;  
        
    end
    
    initial
    begin
        rst <= 1'b0;
        #150;

        rst <=1'b1;
        #150;
    end
      
endmodule

