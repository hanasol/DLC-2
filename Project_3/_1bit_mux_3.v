module _1bit_mux_3(m0_wr, m1_wr, m2_wr, m0_grant, m1_grant, m2_grant, S_wr);
	input m0_wr, m1_wr, m2_wr, m0_grant, m1_grant, m2_grant;
	output reg S_wr;
	
	always@ (*) begin
		if(m0_grant==1) begin//m0 priority
			S_wr=m0_wr;
		end
		
		else if(m1_grant==1) begin//m1 priority
			S_wr=m1_wr;
		end
		
		else if(m2_grant==1) begin//m2 priority
			S_wr=m2_wr;
		end
	end
endmodule
