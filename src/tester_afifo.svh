class tester_afifo;

virtual afifo_if itf;

function new(virtual afifo_if.tstr t);
	itf = t;
endfunction

endclass
