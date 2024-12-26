module fifo_ns(wr_en, rd_en, state, data_count, next_state);//Logic to output the next state
  input wr_en, rd_en;//Write enable, Read enable
  input[2:0] state;//Current state
  input[3:0] data_count;//Current number of data
  output reg[2:0] next_state;//Next state

	 initial begin
		next_state=3'b000;
	 end
	
    always @(*) begin
        if (wr_en == 1'b1 && data_count !== 4'b1000) begin
            next_state = 3'b001; // Write state
        end 
		  
		  else if (rd_en == 1'b1 && data_count != 4'b0000) begin
            next_state = 3'b010; // Read state
        end 
		  
		  else if (wr_en == 1'b1 && data_count == 4'b1000) begin
            next_state = 3'b101; // Write Error state
        end 
		  
		  else if (rd_en == 1'b1 && data_count == 4'b0000) begin
            next_state = 3'b110; // Read Error state
        end 
		  
		  else if (wr_en == 1'b0 && rd_en == 1'b0) begin
            next_state = 3'b111; // No operation state
        end
		  
		  else begin
			next_state<=state;
		  end
    end

endmodule
