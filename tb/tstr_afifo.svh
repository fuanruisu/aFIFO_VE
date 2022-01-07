import afifo_pkg::*;
import fifo_pkg::*;

class tstr_afifo;

    localparam WIDTH = 8;
    localparam DEPTH = 32;

    virtual fifo_if if_AFIFO;

    data_ty afifo_queue[$];
    data_ty popData = '0;

    data_ty temp_data = '0;
    push_e_t temp_push = push_e_t'(0);
    pop_e_t temp_pop = pop_e_t'(0);

    function new(virtual fifo_if.dvr fifo_int);
        if_AFIFO = fifo_int;
    endfunction //new()

    task Inject_D(); //Task for random data injection
        #0.2;
        temp_data = data_ty'($random());
        if_AFIFO.data_in = temp_data;
	temp_push = push_e_t'($random());
        if_AFIFO.push = temp_push;
        if (temp_push == PUSH && afifo_queue.size() < 16) afifo_queue.push_front(temp_data);
    endtask

    task Pop_D(); //Task for random data pop
        #0.2;
        temp_pop = pop_e_t'($random());
        if_AFIFO.pop = temp_pop;
        if (temp_pop == POP && afifo_queue.size() > 0) popData = afifo_queue.pop_back();
    endtask

    function int Size_Que();
        Size_Que = afifo_queue.size();
    endfunction

endclass //FIFO_driver