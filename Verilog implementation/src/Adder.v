module adder(a,b,out);
	input [31:0] a,b;
	output [31:0] out;
	reg [31:0] out;
	always @(a or b) begin 
		out = a+b;
	end 
endmodule