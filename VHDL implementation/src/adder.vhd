library std;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all; use IEEE.STD_LOGIC_ARITH.ALL;
entity adder is
	port(a:in std_logic_vector(31 downto 0);b:in std_logic_vector(31 downto 0);output:out std_logic_vector(31 downto 0) ) ;
end adder;
architecture behave of adder is 
begin  
	PROcess(a,b)
	begin
	output<= a+b;
end process;
end behave;