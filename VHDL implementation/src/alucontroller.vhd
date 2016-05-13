library std;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all; use IEEE.STD_LOGIC_ARITH.ALL;
entity alucontroller is
	port (alusignal :in std_logic_vector(2 downto 0);
              functionsignal :in std_logic_vector(5 downto 0);
              out_data :out std_logic_vector(3 downto 0);
              outforjr :out std_logic);
end alucontroller;

architecture arch1 of alucontroller is
begin
	process(alusignal , functionsignal)
		begin
		 outforjr <= '0';
		
			if (alusignal ="000") then
				
		case functionsignal is
						when "100000" => out_data <= "0000"; 
						when "010001" => out_data <= "0001";	        
						when "001001" => out_data <= "0010"; 	
						when "101001" => out_data <= "0011"; 
						when "000000" => out_data <= "0100";	        
						when "010000" => out_data <= "0101";
						when "010101" => out_data <= "0111"; 
						when "111001" => out_data <= "1000";		   
						when "000100" => outforjr <= '1';
						when others => null;
					end case ;
			elsif alusignal = "001" then
					out_data <= "0000";
					outforjr <= '0'; 
			elsif alusignal = "011" then
					out_data <= "0001";
			elsif alusignal = "100" then
					out_data <= "0000"; 
			elsif alusignal = "101" then
					out_data <= "0010";
                        end if;
		end process;
end arch1;
			
				
					
						
						
						
	
	
