library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;
entity extender is 
 port(x:in std_logic_vector(15 downto 0);
      y:out std_logic_vector(31 downto 0));
end extender;

architecture arch1 of extender is
begin
     process(x)
     begin
       if (x(15)='0') then
          y<="0000000000000000"&x;
       else
          y<="1111111111111111"&x;
       end if;
     end process;
end arch1;
