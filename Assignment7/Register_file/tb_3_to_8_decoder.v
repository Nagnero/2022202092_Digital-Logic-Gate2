`timescale 1ns/100ps

module tb_3_to_8_decoder;
	reg 	[2:0] d; //input
	wire  [7:0] q;
	
	_3_to_8_decoder DUT(d,q);
	
	initial
	begin
		#0;	d = 3'b000;
		#10;	d = 3'b001;
		#10;	d = 3'b010;
		#10;	d = 3'b011;
		#10;	d = 3'b100;
		#10;	d = 3'b101;
		#10;	d = 3'b110;
		#10;	d = 3'b111;
		#10;	$stop;
	end
endmodule
