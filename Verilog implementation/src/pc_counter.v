module pc_counter(addressin,addressout,reset);
input [31:0] addressin;
output [31:0] addressout;
reg [31:0]  addressout;	 
input reset;			 
reg clk;


always @(posedge clk ) begin
	if(reset) addressout <= 32'b0;
	else addressout <= addressin; 		
 // to initialize the pc
	end	

always begin
     #800 clk = ~clk;
end
initial begin
	clk = 1'b0;	
end
	
endmodule









