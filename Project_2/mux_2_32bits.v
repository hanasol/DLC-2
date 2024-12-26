module mux_2_32bits(A, B, S, Y);
	input S;
	input[31:0] A, B;
	output[31:0] Y;
	
  assign Y=(S==1'b0)?A:B;//Choose A if S is 0, and B if S is 1
endmodule
