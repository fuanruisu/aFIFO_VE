interface afifo_if();

import afifo_tb_pkg::*;

data_t data_in, data_out;
bit_t push, pop;
bit_t full, empty;

modport fifo_mod(
input data_in,
input push,
//input wrclk,
//input wr_rst,
//input rd_rst,
output full,
output data_out,
input pop,
//input rdclk,
output empty
);

modport tstr(
output data_in,
output push,
output wrclk,
input full,
input data_out,
output pop,
output rdclk,
input empty);

endinterface