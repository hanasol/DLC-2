module _8bits_mux_3(m0_address, m1_address, m2_address, m0_grant, m1_grant, m2_grant, in_Address);
	input m0_grant, m1_grant, m2_grant;
	input [7:0] m0_address, m1_address, m2_address;
	output reg[7:0] in_Address;
	
	always@(*) begin
		if(m0_grant==1) begin//m0 priority
			in_Address=m0_address;
		end
		
		else if(m1_grant==1) begin//m1 priority
			in_Address=m1_address;
		end
		
		else if(m2_grant==1) begin//m2 priority
			in_Address=m2_address;
		end
	end
endmodule
