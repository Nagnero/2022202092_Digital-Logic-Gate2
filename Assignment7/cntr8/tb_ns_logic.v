`timescale 1ns/100ps

module tb_ns_logic;
	reg load,inc; //load, inc	
	reg [2:0] state; //state
	
	wire [2:0] next_state; //output next_state						
	
	ns_logic DUT(load, inc, state, next_state);
	
	initial 
	begin
		#0;	load=0; inc = 1; state=3'b000;
		#10;	load=0; inc = 1; state=3'b001;
		#10;	load=0; inc = 0; state=3'b010;
		#10;	load=0; inc = 0; state=3'b011;
		#10;	load=1; inc = 1; state=3'b100;
		#10;	load=1; inc = 0; state=3'b101;
		#10;	$stop;
	end
endmodule
		