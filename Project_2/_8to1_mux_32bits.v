module _8to1_mux_32bits(q0, q1, q2, q3, q4, q5, q6, q7, rAddr, rData, re);//8 to 1 mux
  //Save values according to the address entered
	input[31:0] q0, q1, q2, q3, q4, q5, q6, q7;
	input[2:0] rAddr;
  	input re;
	output reg[31:0] rData;
	
  always @(*) begin
    if(re==1'b1) begin//if re is 1, Read possible
		case(rAddr)
			3'b000: rData<=q0;
			3'b001: rData<=q1;
			3'b010: rData<=q2;
			3'b011: rData<=q3;
			3'b100: rData<=q4;
			3'b101: rData<=q5;
			3'b110: rData<=q6;
			3'b111: rData<=q7;
		endcase
    end
    else begin
      rData<=8'h00000000;//if re is 0, Read impossible
    end
  end
endmodule
