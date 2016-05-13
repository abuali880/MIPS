library std;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all; use IEEE.STD_LOGIC_ARITH.ALL;
entity conc is 
      port(a:in std_logic_vector(25 downto 0);
           b:in std_logic_vector(5 downto 0);
           y:out std_logic_vector(31 downto 0));
end conc;

architecture arch1 of conc is
begin
	process(a,b)
           begin
	      y <= b & a;
	   end process;
end arch1;
