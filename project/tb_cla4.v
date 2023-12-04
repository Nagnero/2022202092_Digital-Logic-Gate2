`timescale 1ns/100ps

module tb_cla4;
	reg [3:0] tb_a, tb_b;
	reg tb_ci;
	wire [3:0] tb_s;
	wire tb_co;
	wire [4:0] tb_result;
	
	assign tb_result = {tb_co, tb_s};
	
	cla4 U0_cla4(.a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s), .co(tb_co));
	
	initial
	begin
			 tb_a = 4'b0000;	tb_b = 4'b0000;	tb_ci = 0; // all inputs are 0
		#10 tb_a = 4'b0101;	tb_b = 4'b1010;	tb_ci = 0; // a + b + cin is 1111
			 
		#10 tb_a = 4'b1111;	tb_b = 4'b0001;	tb_ci = 0; // a is 1111 and b or cin is 1
		#10 tb_a = 4'b1111;	tb_b = 4'b0000;	tb_ci = 1;
		
		#10 tb_a = 4'b0001;	tb_b = 4'b1111;	tb_ci = 0; // check same value but a and b is changed
		#10 tb_a = 4'b0000;	tb_b = 4'b1111;	tb_ci = 1;
		
		#10 tb_a = 4'b1111;	tb_b = 4'b1111;	tb_ci = 0; // a, b is 1111 and cin is 0 or 1
		#10 tb_a = 4'b1111;	tb_b = 4'b1111;	tb_ci = 1;



		#10 $stop;
	end
	
endmodule