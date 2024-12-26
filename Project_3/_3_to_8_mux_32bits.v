module _3_to_8_mux_32bits(s0_dout, s1_dout, s2_dout, s3_dout, s4_dout, s5_dout, s6_dout, s7_dout, s, m_din);
	input[31:0] s0_dout, s1_dout, s2_dout, s3_dout, s4_dout, s5_dout, s6_dout, s7_dout;
	input[2:0] s;
	output reg[31:0] m_din;
	
	always@ (*) begin
		if(s==3'b000) begin
			m_din=s0_dout;
		end
		else if(s==3'b001) begin
			m_din=s1_dout;
		end
		else if(s==3'b010) begin
			m_din=s2_dout;
		end
		else if(s==3'b011) begin
			m_din=s3_dout;
		end
		else if(s==3'b100) begin
			m_din=s4_dout;
		end
		else if(s==3'b101) begin
			m_din=s5_dout;
		end
		else if(s==3'b110) begin
			m_din=s6_dout;
		end
		else if(s==3'b111) begin
			m_din=s7_dout;
		end
		else begin
			m_din=32'b00000000;
		end
	end
endmodule
