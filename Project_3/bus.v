module bus(clk, reset_n, m0_req, m0_wr, m0_address, m0_dout, m1_req, m1_wr, m1_address, m1_dout, m2_req, m2_wr, m2_address, m2_dout
, s0_dout, s1_dout, s2_dout, s3_dout, s4_dout, s5_dout, s6_dout, s7_dout, m0_grant, m1_grant, m2_grant, m_din, s_sel, s_address, s_wr, s_din);
	
	input clk, reset_n;
	input m0_req, m0_wr, m1_req, m1_wr, m2_req, m2_wr;
	input[7:0] m0_address, m1_address, m2_address;
	input[31:0] m0_dout, m1_dout, m2_dout;
	input[31:0] s0_dout, s1_dout, s2_dout, s3_dout, s4_dout, s5_dout, s6_dout, s7_dout;
	
	output m0_grant, m1_grant, m2_grant, s_wr;
	output[31:0] m_din, s_din;
	output[7:0] s_sel, s_address;
	
	wire[7:0] input_Address_decoder;
	wire[2:0] input_dff_3bits;
	wire[2:0] output_dff_3bits;
	
	arbiter Arbiter(clk, reset_n, m0_req, m1_req, m2_req, m0_grant, m1_grant, m2_grant);//Arbiter
	_1bit_mux_3 mux1(m0_wr, m1_wr, m2_wr, m0_grant, m1_grant, m2_grant, s_wr);//Mux of S_wr
	_32bits_mux_3 mux3(m0_dout, m1_dout, m2_dout, m0_grant, m1_grant, m2_grant, s_din);//Mux of S_din
	_8bits_mux_3 mux2(m0_address, m1_address, m2_address, m0_grant, m1_grant, m2_grant, input_Address_decoder);//Mux of input of Address decoder
	_8bits_mux_3 mux4(m0_address, m1_address, m2_address, m0_grant, m1_grant, m2_grant, s_address);//MUX of S_address
	Address_dec Address_decoder(input_Address_decoder, s_sel);//Address decoder module
	encoder_8bits encoder(s_sel, input_dff_3bits);//Encoder for converting the output of the address decoder to 3 bits
	dff_3bits dff(clk, reset_n, input_dff_3bits, output_dff_3bits);//D Flip-Flop with reset_n
	_3_to_8_mux_32bits mux_32bits(s0_dout, s1_dout, s2_dout, s3_dout, s4_dout, s5_dout, s6_dout, s7_dout, output_dff_3bits, m_din);
	//Out of slave outputs, select the appropriate output for the current slave address
endmodule
