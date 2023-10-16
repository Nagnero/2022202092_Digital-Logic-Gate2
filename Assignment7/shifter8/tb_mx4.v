`timescale 1ns/100ps

module tb_mx4;

	reg tb_d0, tb_d1, tb_d2, tb_d3;
	reg [1:0] tb_s;
	wire tb_y;
	
	mx4 U0_mx4(.y(tb_y), .d0(tb_d0), .d1(tb_d1), .d2(tb_d2), .d3(tb_d3), .s(tb_s));
	
	initial begin
	
		#0		tb_d0 = 0;  tb_d1 = 0;  tb_d2 = 0;  tb_d3 = 0;  tb_s = 2'b00;
		#10	tb_d0 = 0;  tb_d1 = 1;  tb_d2 = 0;  tb_d3 = 0;
		#10	tb_d0 = 1;  tb_d1 = 1;  tb_d2 = 0;  tb_d3 = 0;
		#10	tb_d0 = 1;  tb_d1 = 0;  tb_d2 = 0;  tb_d3 = 0;
		#10	tb_d0 = 0;  tb_d1 = 0;  tb_d2 = 0;  tb_d3 = 0;  tb_s = 2'b01;
		#10	tb_d0 = 0;  tb_d1 = 1;  tb_d2 = 0;  tb_d3 = 0;
		#10	tb_d0 = 1;  tb_d1 = 1;  tb_d2 = 0;  tb_d3 = 0;
		#10	tb_d0 = 1;  tb_d1 = 0;  tb_d2 = 0;  tb_d3 = 0;
		#10	tb_d0 = 0;  tb_d1 = 0;  tb_d2 = 0;  tb_d3 = 0;  tb_s = 2'b10;
		#10	tb_d0 = 0;  tb_d1 = 1;  tb_d2 = 0;  tb_d3 = 0;
		#10	tb_d0 = 1;  tb_d1 = 1;  tb_d2 = 0;  tb_d3 = 0;
		#10	tb_d0 = 1;  tb_d1 = 0;  tb_d2 = 0;  tb_d3 = 0;
		#10	tb_d0 = 0;  tb_d1 = 0;  tb_d2 = 0;  tb_d3 = 0;  tb_s = 2'b11;
		#10	tb_d0 = 0;  tb_d1 = 1;  tb_d2 = 0;  tb_d3 = 0;
		#10	tb_d0 = 1;  tb_d1 = 1;  tb_d2 = 0;  tb_d3 = 0;
		#10	tb_d0 = 1;  tb_d1 = 0;  tb_d2 = 0;  tb_d3 = 0;
		
		#10	tb_d0 = 0;  tb_d1 = 0;  tb_d2 = 0;  tb_d3 = 0;  tb_s = 2'b00;
		

	end

endmodule