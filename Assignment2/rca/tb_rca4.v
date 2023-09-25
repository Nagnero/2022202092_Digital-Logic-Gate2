`timescale 1ns/100ps

module tb_rca4;
	reg[3:0] tb_a, tb_b;
	reg tb_ci;
	wire[3:0] tb_s;
	wire tb_co;
	
	rca4 U0_rca4(.a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s), .co(tb_co));
	
	initial
	begin
			  tb_a=4'b0; tb_b=4'b0; tb_ci=0;
		#10; tb_a=4'b1111; tb_b=4'b0000; tb_ci = 1;
		#10; tb_a=4'b0000; tb_b=4'b1111;
		#10; tb_a=4'b0111; tb_b=4'b0111;
		#10; tb_a=4'b1111; tb_b=4'b1111; tb_ci = 0;
		#10; tb_ci=1;
		#10; $stop;
	end
endmodule
