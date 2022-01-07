interface afifo_if 
import afifo_pkg::*;
#(
    parameter WIDTH = 8
)
(  
    input bit clk_wrt, 
    input bit clk_read
);

    logic   push;
    logic   wr_rst;
    logic   full;
    logic   pop;
    logic   rd_rst;
    logic   empty;
    data_ty data_in;
    data_ty data_out;

    modport tstr( 
        input full, 
        input empty,
        input clk_wrt,
        input clk_read, 
        input data_out,
        output data_in,
        output push, 
        output wr_rst, 
        output pop, 
        output rd_rst
    );

    modport fifo (
        input push, 
        input clk_wrt, 
        input wr_rst, 
        input pop, 
        input clk_read, 
        input rd_rst,
        input data_in,
        output full, 
        output empty,  
        output data_out
    );

endinterface