module fifo_wrapper 
//FIXME[DEV]: import your tb package if needed. check I don't needed
import fifo_pkg::*;
import afifo_tb_pkg::*;
( 
//FIXME[DEV] adjust this port to your convenience. check
input bit wrclk,
input bit rdclk,
input bit arst_n,
//bring signal ports from interface
afifo_tb_pkg.fifo_mod  itf
);

fifo_if   itf();
always_comb begin
   //FIXME[DEV]: complete these assignations. check
   empty    = itf.fifo_mod.empty ;
   full     = itf.fifo_mod.full;
end


fifo_top uut(
	 .wr_clk(wrclk)
	,.wr_rst(arst_n)
	,.rd_clk(rdclk)
	,.rd_rst(arst_n)
   ,.itf (itf)
);

endmodule
