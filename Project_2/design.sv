`include "fifo_ns.v"
`include "fifo_out.v"
`include "fifo_cal.v"
`include "register.v"
`include "dff_r_3bits.v"
`include "dff_r_4bits.v"
`include "mux_2_32bits.v"
`include "dff_r_32bits.v"
module fifo(clk, reset_n, rd_en, wr_en, d_in, d_out, full, empty, wr_ack, wr_err, rd_ack, rd_err, data_count, next_data_count);//FIFO
  
  input clk, reset_n, rd_en, wr_en;
  input[31:0] d_in;
  output full, empty, wr_ack, wr_err, rd_ack, rd_err;
  output[3:0] data_count, next_data_count;
  output[31:0] d_out;
  
  wire[2:0] state, head, tail, next_state, next_head, next_tail;
  wire we, re;
  wire[3:0] cal_data_count;
  wire[31:0] rData, reg_rData;
  
  fifo_ns Next_state_logic(wr_en, rd_en, state, data_count, next_state);//Next state logic instance
  fifo_out Output_logic(state, data_count, full, empty, wr_ack, wr_err, rd_ack, rd_err);//Output logic instance
  fifo_cal Calculate_logic(next_state, head, tail, data_count, we, re, next_head, next_tail, next_data_count);
  //Calculate Address logic instance
  register register_file(tail, head, d_in, we, re, clk, rData);//Register file instance
  
	
  dff_r_3bits state_dff(clk, reset_n, next_state, state);//D-FF of state
  dff_r_4bits data_count_dff(clk, reset_n, next_data_count, data_count);//D-FF of data count
  dff_r_3bits tail_dff(clk, reset_n, next_tail, tail);//D-FF of tail(pointer)
  dff_r_3bits head_dff(clk, reset_n, next_head, head);//D-FF of head(pointer)
  mux_2_32bits mux_rData(32'b0, rData, re, reg_rData);//Mux connecting rdata and zeros in the register file
  dff_r_32bits dout_dff(clk, reset_n, reg_rData, d_out);//D-FF of Output data(dout)
  
endmodule
