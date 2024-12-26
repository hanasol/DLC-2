module arbiter(clk, reset_n, m0_req, m1_req, m2_req, m0_grant, m1_grant, m2_grant);
	input clk, reset_n, m0_req, m1_req, m2_req;
	output reg m0_grant, m1_grant, m2_grant;
	
	always@ (posedge clk) begin
		if(reset_n==0) begin//if reset_n is 0, m0 has priority 
			m0_grant=1;
			m1_grant=0;
			m2_grant=0;
		end
		
		else if(m0_req==1) begin//When m0 does request
			m0_grant=1;
			m1_grant=0;
			m2_grant=0;
		end
		
		else if(m0_req==0&&m1_req==1) begin//When m0 does not request but m1 does
			m0_grant=0;
			m1_grant=1;
			m2_grant=0;
		end
		
		else if(m0_req==0&&m1_req==0&&m2_req==1) begin//When only m2 was requested without m0 requesting and without m1 requesting
			m0_grant=0;
			m1_grant=0;
			m2_grant=1;
		end
		
		else begin
			m0_grant=1;
			m1_grant=0;
			m2_grant=0;
		end
	end
endmodule
