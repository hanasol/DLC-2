`include "_3to8_decoder.v"
`include "register_en.v"
`include "_8to1_mux_32bits.v"
module register(wAddr, rAddr, wData, we, re, clk, rData);
   //Register file that is responsible for reading and writing values
  input [2:0] wAddr, rAddr;//Write & Read address
  input [31:0] wData;//Input data
  input we, re, clk;//Variables to indicate whether it is readable or writable
  output [31:0] rData;//Output data
	
	wire [7:0] out_decoder, en_register;
	wire[31:0] out_write[7:0];
	
	//Write operation
	
	//Decoder part
	_3to8_decoder decoder_in_reg(wAddr, out_decoder);
	
	//we AND output of decoder
	assign en_register[0]=we&out_decoder[0];
	assign en_register[1]=we&out_decoder[1];
	assign en_register[2]=we&out_decoder[2];
	assign en_register[3]=we&out_decoder[3];
	assign en_register[4]=we&out_decoder[4];
	assign en_register[5]=we&out_decoder[5];
	assign en_register[6]=we&out_decoder[6];
	assign en_register[7]=we&out_decoder[7];
	
  	//register(consist of D-FF) part
	register_en reg0(clk, en_register[0], wData, out_write[0]);
	register_en reg1(clk, en_register[1], wData, out_write[1]);
	register_en reg2(clk, en_register[2], wData, out_write[2]);
	register_en reg3(clk, en_register[3], wData, out_write[3]);
	register_en reg4(clk, en_register[4], wData, out_write[4]);
	register_en reg5(clk, en_register[5], wData, out_write[5]);
	register_en reg6(clk, en_register[6], wData, out_write[6]);
	register_en reg7(clk, en_register[7], wData, out_write[7]);
	
	//Read operation
	
	//Select data to read with rAddr
  _8to1_mux_32bits mux_rData(out_write[0], out_write[1], out_write[2], out_write[3], out_write[4], out_write[5], out_write[6], out_write[7], rAddr, rData, re);

endmodule
