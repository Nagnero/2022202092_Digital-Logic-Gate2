`timescale 1ns/100ps

module tb_cla8;
	reg [7:0] a, b; //input sign 4-bit binary
	reg ci; //input ci
	
	wire [7:0] s; //output
	wire co; // output carry out

	cla8 DUT(.a(a), .b(b), .ci(ci), .s(s), .co(co));

	initial 
	begin
		#0;	a=8'b0000_0000; b=8'b0000_0000; ci=0;
		#10;	a=8'b0000_0000; b=8'b0111_0111; ci=1;	
		#10;	a=8'b1111_1111; b=8'b1111_1111; ci=1;		
		#10;	a=8'b1010_0010; b=8'b0101_1101; ci=0;				
		#10;	a=8'b1000_0000; b=8'b0111_1111; ci=0;
		#10;	$stop;
	end
endmodule
