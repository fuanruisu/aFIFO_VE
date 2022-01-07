`ifndef MY_FIFO_PKTE
    `define FIFO_PKTE_SV
package afifo_pkg;

    localparam D_WIDTH = 8;
    localparam ADDRS   = 4;
    localparam F_DEPTH = 2**ADDRS-1;
    typedef logic [D_WIDTH-1:0] data_ty;
    typedef logic [ADDRS-1:0]   addr_ty;
    
endpackage
`endif