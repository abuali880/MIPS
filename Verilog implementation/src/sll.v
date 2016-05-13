module sll(a,b);
	input [31:0] a;
	output [31:0] b;
	reg [31:0] b;
	always @(a)
		begin 
			b = a<<2;
		end
endmodule
	
			