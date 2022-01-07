`timescale 1ns / 10ps
module afifo_tb ();
`include "tstr_afifo.svh";

import afifo_pkg::*;

bit clk_wrt = 1'b0;
bit clk_read = 1'b0;
bit wr_rst = 1'b1;
bit rd_rst = 1'b1;


tstr_afifo tester;

// Instance of interface
fifo_if	itf();

fifo_top	uut	(
	.wr_clk	(clk_wrt),
	.wr_rst	(wr_rst),
	.rd_clk	(clk_read),
	.rd_rst	(rd_rst),
	.itf	(itf.fifo)
);

initial begin	

   tester = new(itf);

	#3	wr_rst = 1'b1;	rd_rst = 1'b1;
    #3	wr_rst = 1'b0;	rd_rst = 1'b0;
	#3	wr_rst = 1'b1;	rd_rst = 1'b1;

	//TEST AREA

	repeat (25)	@(posedge clk_wrt)tester.Inject_D();
	repeat (35)	@(posedge clk_read) tester.Pop_D();

	$stop(2);
end

task overflow (input int que_size);
	
	if (que_size <= 16)begin
			for(integer i=que_size; i<=16; i++)begin
				tester.Inject_D();
		end
	end

endtask

task underflow (input int que_size);
	data_ty pop;	

	if (que_size > 0)
	begin
		for(integer ban =que_size; ban>=0; ban--)begin
			pop =tester.popData;
		end	
	end
endtask
	
task monitor ();
	if(tester.popData != itf.data_out)begin
		$display("Time: %t, Error: Expected %d (%b), Obtained %d (%b)", $time,
		tester.popData,tester.popData, itf.data_out, itf.data_out); 
		$stop(2);
	end
endtask

initial begin
	fork
		forever #3 clk_wrt = ~clk_wrt;
		forever #5 clk_read = ~clk_read;
		forever @(itf.data_out) monitor();
	join
end
	


endmodule
