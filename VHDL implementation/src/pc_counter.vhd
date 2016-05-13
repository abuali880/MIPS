library std;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all; use IEEE.STD_LOGIC_ARITH.ALL;
entity pc_counter is
	port(addressin :in std_logic_vector(31 downto 0);
	addressout :out std_logic_vector(31 downto 0);
	reset :in std_logic);
end pc_counter;
architecture beh of pc_counter is  
signal clk : std_logic ;	
constant clk_period : time := 1 ps;
begin		
	process(clk,reset)
	begin
	if(reset ='1') then 
		addressout <= "00000000000000000000000000000000";
	end if;
	if(clk='1' and reset='0') then
		addressout <= addressin ;  
	end if;	
	end process; 
	process begin  
		clk <= '0';
		wait for clk_period;
		clk <= '1';
		wait for clk_period; 
		end process;
end beh;

		
	
	
		
	
	