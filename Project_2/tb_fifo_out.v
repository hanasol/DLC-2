`timescale 1ns/100ps

module tb_fifo_out;
	reg[2:0] state;
	reg[3:0] data_count;
	wire full, empty, wr_ack, wr_err, rd_ack, rd_err;
	
	fifo_out temp(state, data_count, full, empty, wr_ack, wr_err, rd_ack, rd_err);
	
	initial begin
		data_count=4'b0000;//Empty
		state=3'b000;//initial
		#10;
		
		state=3'b111;//No operation
		#10;
		
		state=3'b001;//write
		#10;
		
		data_count=4'b1000;//Full
		#10;
		
		state=3'b101;//Write error
		#10;
		
		state=3'b110;//Read error
		#10;
		
	end
	
endmodule
