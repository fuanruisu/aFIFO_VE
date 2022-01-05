`timescale 1ns / 1 ps
`include "tester_afifo.svh";

module afifo_tb();

import afifo_tb_pkg::*;
import fifo_pkg::*;
bit_t wrclk, rdclk, arst_n;

//Tester's definition
tester_afifo t;

//Interface instance
afifo_if itf();

//Wrapper instantiation
fifo_wrapper uut(
( 
.wrclk(wrclk),
.rdclk(rdclk),
.arst_n(arst_n),
.itf (itf.mdr)
);

initial begin 
	t = new(itf);
	
end

always begin
	#2 wrclk =! wrclk;
	rdclk =! rdclk;
end
endmodule