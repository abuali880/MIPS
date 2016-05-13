entity slLogic is
	port (a: in bit_vector(31 downto 0) ; b: out bit_vector(31 downto 0));
end slLogic;
architecture behave of slLogic is
begin
	process(a)
	begin
		b <= a sll 2;
	end process;
end behave;
