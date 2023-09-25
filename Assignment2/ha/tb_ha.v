`timescale 1ns/100ps

module tb_ha;

	reg a;
	reg b;
	wire s;
	wire co;
	
	ha U0_ha(.a(a), .b(b), .s(s), .co(co));
	
	initial begin
	
			a = 1'b0;	b = 1'b0;
	#10;	a = 1'b0;	b = 1'b1;
	#10;	a = 1'b1;	b = 1'b1;
	#10;	a = 1'b1;	b = 1'b0;
	#10;
	end

endmodule
