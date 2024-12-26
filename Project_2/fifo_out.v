module fifo_out(state, data_count, full, empty, wr_ack, wr_err, rd_ack, rd_err);
  //The logic of outputting the handshake signal by receiving the current state and dataccount
  input[2:0] state;
  input[3:0] data_count;
  output reg full, empty, wr_ack, wr_err, rd_ack, rd_err;

    always @(*) begin
		wr_ack = 1'b0;
        wr_err = 1'b0;
        rd_ack = 1'b0;
        rd_err = 1'b0;
        full = 1'b0;
        empty = 1'b0;
		//Default value
      
		  case (state)
            3'b000, 3'b111: begin // Init state or No operation
                wr_ack = 1'b0;
                wr_err = 1'b0;
                rd_ack = 1'b0;
                rd_err = 1'b0;
            end

            3'b001: begin // Write state
                wr_ack = 1'b1;
                wr_err = 1'b0;
                rd_ack = 1'b0;
                rd_err = 1'b0;
            end

            3'b010: begin // Read state
                wr_ack = 1'b0;
                wr_err = 1'b0;
                rd_ack = 1'b1;
                rd_err = 1'b0;
            end

            3'b101: begin // Write Error
                wr_ack = 1'b0;
                wr_err = 1'b1;
                rd_ack = 1'b0;
                rd_err = 1'b0;
            end

            3'b110: begin // Read Error
                wr_ack = 1'b0;
                wr_err = 1'b0;
                rd_ack = 1'b0;
                rd_err = 1'b1;
            end
        endcase
		  
		  if (data_count == 4'b1000) begin // Full
            full = 1'b1;
        end

        if (data_count == 4'b0000) begin // Empty
            empty = 1'b1;
        end
    end

endmodule
