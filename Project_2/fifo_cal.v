module fifo_cal(state, head, tail, data_count, we, re, next_head, next_tail, next_data_count);
  //Logic for calculating the head, tail values and the number of current data for the following states
  input[2:0] state, head, tail;
  input[3:0] data_count;
  output reg we, re;
  output reg[2:0] next_head, next_tail;
  output reg[3:0] next_data_count;
  
  always @(*) begin
	we=1'b0;
	re=1'b0;
	case (state)
		3'b001: begin//Write state
			case (data_count)
				4'b1000: begin//Full-->Write impossible
					next_head<=head;
					next_tail<=tail;
					next_data_count<=data_count;
					we=1'b0;
				end
				
				default: begin//Write possible
					next_head<=head;
					next_tail<=tail+1;
					next_data_count<=data_count+1;
					we=1'b1;
				end
			endcase
		end
		
		3'b010: begin//Read state
					
			case (data_count)
				4'b0000: begin//Empty-->Read impossible
					next_head<=head;
					next_tail<=tail;
					next_data_count<=data_count;
					re=1'b0;
				end
				
				default: begin//Read possible
					next_head<=head+1;
					next_tail<=tail;
					next_data_count<=data_count-1;
					re=1'b1;
				end
			endcase
		end
		default: begin//Other state
			next_head<=head;
			next_tail<=tail;
			next_data_count<=data_count;
		end
	 endcase
	end
endmodule
