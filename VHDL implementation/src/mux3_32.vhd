library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.std_logic_unsigned.all;

entity mux3_32 is 
 port(a,b,c:in std_logic_vector(31 downto 0);
      y:out std_logic_vector(31 downto 0);
      sel:in std_logic_vector(1 downto 0));
end mux3_32;

architecture arch1 of mux3_32 is

begin
     process(a,b,c,sel)
     begin
		case sel is
        when "00"=>y<=a;
        when "01"=>y<=b;
        when "10"=>y<=c;
        when others => y <= (others => 'Z'); 
       end case;
	 
		end process;	
end arch1;