class tester_afifo;

virtual afifo_if itf_tb;

function new(virtual afifo_if.tstr t);
	itf_tb = t;
endfunction

endclass
