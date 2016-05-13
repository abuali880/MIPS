library std;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all; use IEEE.STD_LOGIC_ARITH.ALL;
entity alu is 
port (a,b:in std_logic_vector(31 downto 0);
	signal1 :in std_logic_vector(3 downto 0);
	shamt :in std_logic_vector(4 downto 0);
	output: out std_logic_vector(31 downto 0);
	zerosignal:out std_logic);
end alu;
architecture behave of alu is 
signal slLogic: std_logic_vector(33 downto 0);
signal outp: std_logic_vector(31 downto 0);	
signal Shift : integer;
signal as : bit_vector(31 downto 0);
signal outputs : bit_vector(31 downto 0);
begin	
process(signal1,a,b) begin
	shift <= conv_integer(shamt);
	as <= to_bitvector(b); 
	zerosignal<='0';
	case signal1 is
		when "0000" => output <= a + b;
		when "0001" => outp <= a - b;	
						output <= outp;
						if (outp = x"00000000")  then
							ZeroSignal <= '1';
						end if;
		when "0010" => output <= a and b ;
		when "0011" => output <= a or b;
		when "0100" => outputs <= as sll shift;
						output <= To_StdLogicVector(outputs);
		when "0110" => output <= not(a or b);
		when "0111" => if (a<b) then output <= x"00000001" ;
						else output<= x"00000000";
			end if;
		when others	=> null;
	   end case;
end process;
end behave;