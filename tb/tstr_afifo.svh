import afifo_pkg::*;
import fifo_pkg::*;

class tstr_afifo;
	
    data_ty exp_v;
    data_ty lst_v;
    data_ty Q[$];

    
    localparam DEPTH = 16;
    virtual fifo_if afifo;
	
    function new(virtual fifo_if.dvr t);
        afifo = t;
    endfunction

    task push();
	afifo.push = push_e_t'($random());
	afifo.data_in = data_ty'($random());
	if (afifo.push == PUSH && afifo.full != 1) Q.push_front(afifo.data_in);
	endtask

    task pop();
	afifo.pop = pop_e_t'($random());
	if (afifo.pop == POP && afifo.empty != 1) exp_v = Q.pop_back();
	if (exp_v != afifo.data_out) monitor();
	endtask
    
    task monitor();
		if(Q.size()>DEPTH) $display("Overflow occurred: %0t, Expected: %d, %b Obtained: %d, %b ",$time, exp_v, exp_v, afifo.data_out, afifo.data_out);
		else if(Q.size<1) $display("Underflow ocurred: %0t, Expected: %d, %b Obtained: %d, %b ",$time, exp_v, exp_v, afifo.data_out, afifo.data_out);
		

	endtask

endclass 