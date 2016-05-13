module mux3_32(a,b,c,d,sel,y);
	input [31:0] a,b,d,c;
	input [1:0] sel;
	output [31:0] y;
	reg [31:0] y;
	always @ (a or b or c or sel)
		begin	
			case(sel)
				2'b00 : y = a;
				2'b01 : y=b;
				2'b10 : y=c;
				2'b11 :y= 5'bzzzzz; 
			endcase
			end
			
endmodule