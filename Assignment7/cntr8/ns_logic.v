module ns_logic(load, inc, state, next_state);
	input load, inc; // input
	input [2:0] state;
	output reg [2:0] next_state; // output
	
	parameter IDLE_STATE =3'b000;
	parameter LOAD_STATE =3'b001;
	parameter INC_STATE =3'b010;
	parameter INC2_STATE =3'b011;
	parameter DEC_STATE =3'b100;
	parameter DEC2_STATE =3'b101;
	
	always@(load, inc, state)
	begin
		case(state) // check state to apply case syntax
			IDLE_STATE:
			begin
				if(load == 1) next_state = LOAD_STATE;
				else if (inc == 1) next_state = INC_STATE;
				else if (inc == 0) next_state = DEC_STATE;
				else next_state = 3'bxxx; // default
			end
			
			LOAD_STATE:
			begin
				if(load == 1) next_state = LOAD_STATE;
				else if (inc == 1) next_state = INC_STATE;
				else if (inc == 0) next_state = DEC_STATE;
				else next_state = 3'bxxx;
			end
			
			INC_STATE:
			begin
				if(load == 1) next_state = LOAD_STATE;
				else if (inc == 1) next_state = INC2_STATE;
				else if (inc == 0) next_state = DEC_STATE;
				else next_state = 3'bxxx; // default
			end
			
			INC2_STATE:
			begin
				if(load == 1) next_state = LOAD_STATE;
				else if (inc == 1) next_state = INC_STATE;
				else if (inc == 0) next_state = DEC_STATE;
				else next_state = 3'bxxx; // default
			end
			
			DEC_STATE:
			begin
				if(load == 1) next_state = LOAD_STATE;
				else if (inc == 1) next_state = INC_STATE;
				else if (inc == 0) next_state = DEC_STATE;
				else next_state = 3'bxxx; // default
			end
			
			DEC2_STATE:
			begin
				if(load == 1) next_state = LOAD_STATE;
				else if (inc == 1) next_state = INC_STATE;
				else if (inc == 0) next_state = DEC_STATE;
				else next_state = 3'bxxx; // default
			end
			
		endcase
	end
endmodule
