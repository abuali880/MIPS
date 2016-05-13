library std;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all; use IEEE.STD_LOGIC_ARITH.ALL;
entity mux is 
 port(a:in std_logic_vector(31 downto 0);
      b:in std_logic_vector(31 downto 0);
      y:out std_logic_vector(31 downto 0);
      sel:in std_logic);
end mux;

architecture arch1 of mux is
begin
     process(a,b,sel)
     begin
       if (sel='0') then
          y<=a;
       else
          y<=b;
       end if;
     end process;
end arch1;