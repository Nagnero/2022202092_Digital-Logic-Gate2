module ha(a, b, s, co); // define module
	input a, b; // set input and output variables
	output s, co;
	
	assign s = a^b; // exclusive or calculation of a and b for sum
	assign co = a&b; // and calculation of a and b for cout

endmodule
