//The code for "FPGA InsideOut Session1" project below was derived from the
//original Verilog file generated using "OutputLogic.com CRC Generator".

//-----------------------------------------------------------------------------
// Copyright (C) 2009 OutputLogic.com
// This source file may be used and distributed without restriction
// provided that this copyright statement is not removed from the file
// and that any derivative work contains the original copyright notice
// and the associated disclaimer.
//
// THIS SOURCE FILE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS
// OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
// WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
//-----------------------------------------------------------------------------
// CRC module for data[0:0] ,   crc[5:0]=1+x^1+x^2+x^3+x^5+x^6;
//-----------------------------------------------------------------------------
module crc1bit(
  input [0:0] data_in,
  input crc_en,
  output [5:0] lfsr_c, 
  input rst,
  input clk);

  reg [5:0] lfsr_q;

  assign lfsr_c[0] = lfsr_q[5] ^ data_in[0];
  assign lfsr_c[1] = lfsr_q[0] ^ lfsr_q[5] ^ data_in[0];
  assign lfsr_c[2] = lfsr_q[1] ^ lfsr_q[5] ^ data_in[0];
  assign lfsr_c[3] = lfsr_q[2] ^ lfsr_q[5] ^ data_in[0];
  assign lfsr_c[4] = lfsr_q[3];
  assign lfsr_c[5] = lfsr_q[4] ^ lfsr_q[5] ^ data_in[0];


  always @(posedge clk) begin
    if(rst) begin
      lfsr_q <= {6{1'b1}};
    end
    else begin
      lfsr_q <= crc_en ? lfsr_c : lfsr_q;
    end
  end // always
endmodule // crc
