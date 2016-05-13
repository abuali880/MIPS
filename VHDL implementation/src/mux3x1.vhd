library IEEE;
library work;
library std;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_Unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;
entity mux3 is
	port(a,b,c,d:in std_logic_vector(4 downto 0);
	sel:in std_logic_vector(1 downto 0);
	y:out std_logic_vector(4 downto 0));
end mux3;
architecture behave of mux3 is

begin
	PROcess(sel,a,b,c,d)
	begin
	case sel is
		
	     when"00"=>y<=a; 
	     when"01"=>y<=b;
	     when"10"=>y<=c;
		 when others =>y<=a;
		 
	end case;
	end process;
	end behave;