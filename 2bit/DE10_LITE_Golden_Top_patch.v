//!!!IMPORTANT!!! - IMPLEMENTATION OF THIS CODE ON FPGA CAN POTENTIALLY RESULT IN BOARD DAMAGE. PROCEED AT YOUR OWN RISK.
//
//Instruction: Insert the code below into DE10_LITE_Golden_Top.v file between "REG/WIRE declarations" and "Structural coding" blocks.
//DE10_LITE_Golden_Top.v file is generated automatically by Quartus "New Project Wizard" when choosing "MAX10 DE10-Lite" target board.

//=======================================================
//  REG/WIRE declarations
//=======================================================


assign HEX5 = 8'b11111111;
assign HEX4 = 8'b11111111;


//Indicate 'c' on HEX3
assign HEX3 = (SW[9] == 1'b1) ? 8'b10100111 : 8'b11111111;

//Indicate 'E' on HEX2
assign HEX2 = (SW[8] == 1'b1) ? 8'b10000110 : 8'b11111111;

//Indicate '0' or '1' on HEX1
assign HEX1 = (SW[7] == 1'b1) ? 8'b11111001 : 8'b11000000;

//Indicate '0' or '1' on HEX0
assign HEX0 = (SW[6] == 1'b1) ? 8'b11111001 : 8'b11000000;


//Instantiate CRC2BIT module
crc2bit CRC2BIT1(.data_in({SW[7],SW[6]}), .crc_en(SW[8]), .lfsr_c({LEDR[0],LEDR[1],LEDR[2],LEDR[3],LEDR[4],LEDR[5]}), .rst(SW[9]), .clk(KEY[0]));


//=======================================================
//  Structural coding
//=======================================================

