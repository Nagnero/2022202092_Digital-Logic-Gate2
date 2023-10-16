`timescale 1ns/100ps	

module tb_LSL8;

	reg [7:0] tb_d_in;//input bit
	reg [1:0] tb_shamt;//sign bit
	wire [7:0] tb_d_out;//output put
	
	LSL8 U0_LSL8(.d_in(tb_d_in), .shamt(tb_shamt), .d_out(tb_d_out));		//insert module
	
	initial begin	
		#0;	tb_d_in = 8'b10101101;
				tb_shamt = 2'b00;
		#10;	tb_shamt = 2'b01;
		#10;	tb_shamt = 2'b10;
		#10;	tb_shamt = 2'b11;
		#10;
		
		end
endmodule	//end module
		

