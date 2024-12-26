module dff_3bits(clk, reset_n, d, q);
	input clk, reset_n;
	input[2:0] d;
	output reg[2:0]q;
	
	always@ (posedge clk) begin
		if(reset_n==0) begin
			q<=0;
		end
		
		else begin
			q<=d;
		end
	end
endmodule
