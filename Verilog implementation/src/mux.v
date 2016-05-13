module mux(a,b,sel,y);
	input [31:0] a,b;
	input sel;
	output [31:0] y;
	reg [31:0]  y;
	always @ (a or b or sel)
		begin
			if (sel == 1'b0)
				 y=a;
			else
				 y=b;
			end
endmodule