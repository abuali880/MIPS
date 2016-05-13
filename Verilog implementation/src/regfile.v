module regfile(readreg1,readreg2,writereg,writedata,regwrite,readdata1,readdata2);
 input [4:0] readreg1;
 input [4:0] readreg2;
 input [4:0] writereg;
 input [31:0] writedata;
 input regwrite;
 output [31:0] readdata1; 
 output [31:0] readdata2;
 reg [31:0] readdata1;	 
  reg [31:0] readdata2;
 
 reg [31:0] my_memory [0:31];
 initial begin 
$readmemb("regfile.list",my_memory); 	 
 end  		 
 always @(readreg1 or readreg2 or writereg or writedata) begin
	   		
	  #150 readdata1 <= my_memory[readreg1] ;
	    #150 readdata2 <= my_memory[readreg2];	
	  if (regwrite == 1'b1)  begin
		#1 my_memory[writereg]  <= writedata;
	   end
 end
 
endmodule

	 