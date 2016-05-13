module sll28(a,b);
	input [25:0] a;
	output [27:0] b;
	reg [27:0] b;
	always @(a)
		begin 
			b = a<<2;
		end
endmodule
	
			