module fifo_wrapper 
//FIXME[DEV]: import your tb package if needed. check I don't needed
import fifo_pkg::*;

( 
//FIXME[DEV] adjust this port to your convenience. check
    input  bit      wrclk,
    input  bit      wr_rst,
    input  bit      rdclk,
    input  bit      rd_rst,

    input  data_t   data_in,
    input  logic    push,
    output logic    full,
    output data_t   data_out,
    input  logic    pop,
    output logic    empty
);

fifo_if   itf();
always_comb begin
   //FIXME[DEV]: complete these assignations. check
	empty    = itf.empty ;
   	full     = itf.full;
end


fifo_top uut(
	 .wr_clk(wrclk)
	,.wr_rst(arst_n)
	,.rd_clk(rdclk)
	,.rd_rst(arst_n)
   ,.itf (itf)
);

endmodule
