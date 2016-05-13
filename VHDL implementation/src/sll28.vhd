entity sll28 is
	port (a : in bit_vector(25 downto 0); b :out bit_vector (27 downto 0));
end sll28;
architecture behave of sll28 is	
begin
process (a)
begin
  b <= a sll 2 ;
  end process;
end behave ;
