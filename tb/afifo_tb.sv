`timescale 100ps / 1ps// time_unit / time_precision
module afifo_tb ();
`include "tstr_afifo.svh";

import afifo_pkg::*;

bit clk_wrt = 1'b0;
bit clk_read = 1'b0;
bit wr_rst = 1'b0;
bit rd_rst = 1'b0;


tstr_afifo tester;
int rst_seq = 3; //this number must be always odd.
parameter pushx = 15, popx = 20, rep_seq = 5;// x: times. Set here the times you want to push and pop data to/from the fifo 
fifo_if	itf();

fifo_top	dut	(
	.wr_clk	(clk_wrt),
	.wr_rst	(wr_rst),
	.rd_clk	(clk_read),
	.rd_rst	(rd_rst),
	.itf	(itf.fifo)
);

initial begin
	fork 
		forever #10 clk_wrt = ~clk_wrt;
		forever #10 clk_read = ~clk_read;
	join
end

initial begin
	tester = new(itf);
	repeat(rst_seq) begin //the initial sequence of resetting must be set it by this repeat, for being sure that the rst is active in 1 the repetition times must be odd.
		#2 wr_rst = ~wr_rst;
		rd_rst = ~rd_rst;
		
	end
	repeat (rep_seq) begin
		repeat (pushx) @(posedge clk_wrt) tester.push(); 
		repeat(popx) @(posedge clk_read) tester.pop();
		end
		

end
endmodule