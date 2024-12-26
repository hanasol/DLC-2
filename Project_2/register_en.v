module register_en(clk, en, d, q);//Enable D-FF
	input clk, en;
	input [31:0] d;
	output reg[31:0] q;
	
  always @(posedge clk) begin//Hold previous values if enable input is 0
		if(en==1'b1)
			q<=d;
		else
			q<=q;
	end
endmodule
