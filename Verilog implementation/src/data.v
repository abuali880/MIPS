module data_memory(addr, data_in, data_out, rd, wr);  
  // ports 	
  input rd,wr;
  input  [31:0] addr;
  input  [31:0] data_in;  
  output [31:0] data_out; 
  reg [31:0] data_out;
				
  // memory 		
  reg [0:31] my_memory [0:39];

   
  // what should memory do
  
   	
  
  always @(addr or wr or rd or data_in) begin
	 
	 #200 data_out <= my_memory[addr];
    if (wr & !rd) begin
      #200 my_memory[addr] <= data_in;
    end  
  end

  initial begin
    $readmemb("data.list", my_memory);
  end

endmodule


