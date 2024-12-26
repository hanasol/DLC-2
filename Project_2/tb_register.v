`timescale 1ns/100ps

module tb_register;
	reg [2:0] wAddr, rAddr;
   reg [31:0] wData;
   reg we, re, clk;
   wire [31:0] rData;
	
	parameter STEP=10;
	
	register temp(wAddr, rAddr, wData, we, re, clk, rData);
	
	always #(STEP/2) clk=~clk;
	
	initial begin
		#0; clk=0;
		wData=8'h00000001;
		we=1'b1;
		re=1'b0;
		wAddr=3'b000;
		rAddr=3'b000;
		#10;
		
		wData=8'h00000010;
		wAddr=3'b001;
		#10;
		
		we=1'b1;
		wData=8'h00000011;
		wAddr=3'b010;
		#10;
		
		we=1'b0;
		re=1'b1;
		#10;
		
		rAddr=3'b001;
		#10;
		
		rAddr=3'b010;
		#10;
		
		we=1'b1;
		re=1'b0;
		wData=8'h00000010;
		wAddr=3'b101;
		#10;
		
		we=1'b0;
		re=1'b1;
		rAddr=3'b011;
		#10;
		
		rAddr=3'b101;
		#10;
		
		
	end

endmodule
		