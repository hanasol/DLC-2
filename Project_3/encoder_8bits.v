module encoder_8bits(in, out_encod);
	input[7:0] in;
	output reg[2:0] out_encod;
	
	always@ (*) begin
		if(in==8'b00000001) begin
			out_encod=3'b000;
		end
		else if(in==8'b00000010) begin
			out_encod=3'b001;
		end
		else if(in==8'b00000100) begin
			out_encod=3'b010;
		end
		else if(in==8'b00001000) begin
			out_encod=3'b011;
		end
		else if(in==8'b00010000) begin
			out_encod=3'b100;
		end
		else if(in==8'b00100000) begin
			out_encod=3'b101;
		end
		else if(in==8'b01000000) begin
			out_encod=3'b110;
		end
		else if(in==8'b10000000) begin
			out_encod=3'b111;
		end
	end
endmodule
