module alucontroller(alusignal,functionsignal,out,outforjr);
	input [2:0]  alusignal;
	input [5:0] functionsignal ;
	output [3:0]  out;
	output outforjr;
	reg outforjr;
	reg [3:0] out;
	always @(alusignal or functionsignal)
		begin
			outforjr = 1'b0;
			if (alusignal == 3'b000)
				begin
					case(functionsignal) 
						32 : begin out = 4'b0000; 
							        
						end//add  	
						34 : begin out = 4'b0001; 
							        
						end //sub
						36 : begin out = 4'b0010; 
								   
						end //and
						37 : begin out = 4'b0011; 
								    
						end//or 
						0 :  begin out = 4'b0100;  
								    
						end //sll		 
						2 :  begin out = 4'b0101;   
							       
						end //srl 
						42 : begin out = 4'b0111;  
						            
						end //slt
						39 : begin out = 4'b1000; 
							         
						end//nor
						8 : outforjr = 1'b1;//jr
					endcase
				end
			else if (alusignal == 3'b001)
				begin
					out = 4'b0000;
					outforjr = 1'b0; //add in lw & sw
				end
			else if (alusignal == 3'b011)
				begin
					out = 4'b0001;
					 //add in branch 
				end
			else if (alusignal == 3'b100)
				begin
					out = 4'b0000; //add in addi
				end
			else if (alusignal == 3'b101)
				begin
					out = 4'b0010; //andi 
				end	
		end
endmodule
			
				
					
						
						
						
	
	
