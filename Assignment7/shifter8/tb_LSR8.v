`timescale 1ns/100ps	

module tb_LSR8;
	reg [7:0] tb_d_in;//input bit
	reg [1:0] tb_shamt;//sign bit
	
	wire [7:0] tb_d_out;//output put
	
	LSR8 U0_LSR8(.d_in(tb_d_in), .shamt(tb_shamt), .d_out(tb_d_out));
	
	initial begin	
		#0;	tb_d_in = 8'b10101101;
				tb_shamt = 2'b00;
		#10;	tb_shamt = 2'b01;
		#10;	tb_shamt = 2'b10;
		#10;	tb_shamt = 2'b11;
		#10;	$stop;
		
		end
endmodule	//end module
		

