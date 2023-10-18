module os_logic(state, d_in, d_out);
	input [2:0] state;
	input [7:0] d_in;
	output reg [7:0] d_out;
	
	wire [7:0] d_inc;
	wire [7:0] d_dec;
	
	parameter IDLE_STATE =3'b000;
	parameter LOAD_STATE =3'b001;
	parameter INC_STATE =3'b010;
	parameter INC2_STATE =3'b011;
	parameter DEC_STATE =3'b100;
	parameter DEC2_STATE =3'b101;
	
	always @(state, d_in) 
	begin
		case(state)
			IDLE_STATE : d_out <= 8'h00;
			LOAD_STATE : d_out <= d_in;
			INC_STATE : d_out <= d_inc;
			INC2_STATE : d_out <= d_inc;
			DEC_STATE : d_out = d_dec;
			DEC2_STATE : d_out = d_dec;
			default : d_out = 8'hxx;
		endcase
	end
	
	cla8 cla8_1 (.a(d_out), .b(8'b1), .ci(1'b0), .s(d_inc)); // get d_inc
	cla8 cla8_2 (.a(d_out), .b(~(8'b1)), .ci(1'b1), .s(d_dec)); // get d_dec
endmodule
