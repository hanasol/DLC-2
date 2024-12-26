`timescale 1ns/100ps

module tb_fifo_cal;
	reg[2:0] state, head, tail;
	reg[3:0] data_count;
	wire we, re;
	wire[2:0] next_head, next_tail;
	wire[3:0] next_data_count;
	
	fifo_cal temp(state, head, tail, data_count, we, re, next_head, next_tail, next_data_count);
	
	initial begin
		head=3'b000;
		tail=3'b000;
		state=3'b001;//Write
		data_count=4'b0000;
		#10;
		
		tail=3'b001;
		data_count=4'b0001;
		#10;
		
		tail=3'b101;
		data_count=4'b1000;//Full
		#10;
		
		state=3'b010;//Read
		#10;
		
		data_count=4'b0000;//Empty
		#10;
	end
	
endmodule
