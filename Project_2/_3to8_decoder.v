module _3to8_decoder(wAddr, out_decoder);//3 to 8 decoder
  //Save 1 according to the address you want to save
	input[2:0] wAddr;
	output reg[7:0] out_decoder;
	
	always @(*) begin
		  out_decoder = 8'b00000000;
		  case (wAddr)
            3'b000: out_decoder = 8'b00000001;
            3'b001: out_decoder = 8'b00000010;
            3'b010: out_decoder = 8'b00000100;
            3'b011: out_decoder = 8'b00001000;
            3'b100: out_decoder = 8'b00010000;
            3'b101: out_decoder = 8'b00100000;
            3'b110: out_decoder = 8'b01000000;
            3'b111: out_decoder = 8'b10000000;
        endcase
	end
endmodule
