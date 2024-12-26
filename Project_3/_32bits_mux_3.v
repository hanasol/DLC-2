module _32bits_mux_3(m0_dout, m1_dout, m2_dout, m0_grant, m1_grant, m2_grant, S_din);
	input m0_grant, m1_grant, m2_grant;
	input[31:0] m0_dout, m1_dout, m2_dout;
	output reg[31:0] S_din;
	
	always@ (*) begin
		if(m0_grant==1) begin//m0 priority
			S_din=m0_dout;
		end
		
		else if(m1_grant==1) begin//m1 priority
			S_din=m1_dout;
		end
		
		else if(m2_grant==1) begin//m2 priority
			S_din=m2_dout;
		end
	end
endmodule
