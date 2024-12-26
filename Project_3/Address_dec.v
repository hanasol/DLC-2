module Address_dec(input_addr, S_sel);
	input[7:0] input_addr;
	output reg[7:0] S_sel;
	
	always@ (*) begin
		if(input_addr[7:5]==3'b000) begin
			S_sel=8'b00000001;
		end
		else if(input_addr[7:5]==3'b001) begin
			S_sel=8'b00000010;
		end
		else if(input_addr[7:5]==3'b010) begin
			S_sel=8'b00000100;
		end
		else if(input_addr[7:5]==3'b011) begin
			S_sel=8'b00001000;
		end
		else if(input_addr[7:5]==3'b100) begin
			S_sel=8'b00010000;
		end
		else if(input_addr[7:5]==3'b101) begin
			S_sel=8'b00100000;
		end
		else if(input_addr[7:5]==3'b110) begin
			S_sel=8'b01000000;
		end
		else if(input_addr[7:5]==3'b111) begin
			S_sel=8'b10000000;
		end
		else begin
			S_sel=8'b00000000;
		end
	end
endmodule
	