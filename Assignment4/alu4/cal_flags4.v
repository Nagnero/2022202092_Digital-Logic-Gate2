module cal_flags4(op, result, co_add, c3_add, c, n, z, v);
	input [2:0] op;
	input [3:0] result;
	input co_add, c3_add;
	output c, n, z, v;
	
	// carry can occur when addition and subtraction (opcode 11_)
	assign c = (op[2:1] != 2'b11) ? 1'b0 : co_add;
	// n is defined by sign bit
	assign n = result[3];
	// z is defined if result is 0
	assign z = (result == 4'b0) ? 1'b1 : 1'b0;
	// overflow can occur only addition and subtraction
	// and it is same with exclusive or of carry and its previous carry
	assign v = (op[2:1] != 2'b11) ? 1'b0 : co_add ^ c3_add;
endmodule

