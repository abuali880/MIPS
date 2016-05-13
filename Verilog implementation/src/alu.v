module alu(signal,a,b,shamt,out,ZeroSignal);
	input [31:0] a,b;
	input [3:0] signal;
	input [4:0] shamt;
	output [31:0]out;
	output ZeroSignal;	
	reg ZeroSignal;
	reg[31:0] out;
		always @ (signal or a or b)
			begin  
				#100
				ZeroSignal=1'b0;
				case(signal)
						4'b0000:out=a+b;
						4'b0001:
						begin
							 out=a-b;
							if (out==0)  ZeroSignal=1'b1;
						end
						4'b0010: out=a&&b;
						4'b0011: out=a||b;
						4'b0100: out=b<<shamt; 
						4'b0101: out=b>>shamt;
						4'b1000: out=~(a||b);
						4'b0111:
						begin
							if(a<b) out=1;
							else  out=0;
						end 
					
				endcase
			end
endmodule
		
				
