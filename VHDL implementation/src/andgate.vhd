library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;
entity andgate is 
      port(a:in std_logic;
           b:in std_logic;
           y:out std_logic);
end andgate;		
architecture beh of andgate is
begin 
	process(a,b)
	begin
	y <= a and b;
end process;
end beh;
	
	