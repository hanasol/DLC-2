module dff_r_3bits(clk, reset_n, d, q);// 3 bits flip flop
	input clk,reset_n;
	input [2:0] d;
	output reg [2:0] q;
	
	always@(posedge clk or negedge reset_n)
	begin
      if(reset_n == 0) q <= 0;//Save 0 when reset input is turned on
		else q <= d;
	end
endmodule
