module extender(x,y);
	input x;
	output y;
	wire [15:0]x;
	reg [31:0]y;
	always @ (x)
		begin
			if (x[15]==1'b0)
				begin
				y[31:0] <= {{16{1'b0}},x[15:0]};
				end
			else if(x[15]==1'b1)
				begin
				y[31:0] <= {{16{1'b1}},x[15:0]};  
				end
		end
endmodule