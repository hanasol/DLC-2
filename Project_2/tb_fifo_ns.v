`timescale 1ns/100ps

module tb_fifo_ns;

  reg wr_en, rd_en;//Write enable, Read enable
  reg[2:0] state;//Current state
  reg[3:0] data_count;//Current number of data
  wire[2:0] next_state;//Next state
  
  fifo_ns temp(wr_en, rd_en, state, data_count, next_state);
  
  initial begin
   //Init->write
	wr_en=1'b1;
	rd_en=1'b0;
	
	state=3'b000;
	data_count=4'b0000;
	#10;
	
	//Full
	data_count=4'b1000;
	state=next_state;
	#10;
	
	//Read
	rd_en=1'b1;
	wr_en=1'b0;
	state=next_state;
	#10;
	
	//No operation
	rd_en=1'b0;
	wr_en=1'b0;
	state=next_state;
	#10;
	
	end
	
endmodule
