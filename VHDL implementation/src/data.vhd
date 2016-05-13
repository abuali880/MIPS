library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;
entity data is
PORT (addr : in STD_LOGIC_VECTOR(31 downto 0);
datain : in STD_LOGIC_VECTOR(31 downto 0);
dataout : out STD_LOGIC_VECTOR(31 downto 0); 	
rd : in STD_LOGIC;	
wr: in STD_LOGIC
);
end data;  
architecture Behavioral of data is 
signal split : std_logic_vector(4 downto 0);
type TRam is array(0 to 31) of std_logic_vector(31 downto 0);
impure function init_bram (ram_file_name : in string) return TRam is
file ramfile : text is in ram_file_name;
variable line_read : line;
variable ram_to_return : TRam;

begin		  
	
  for i in TRam'range loop
  readline(ramfile, line_read);
  read(line_read, ram_to_return(i));
  end loop;
return ram_to_return;
end function;
signal Ram : TRam := init_bram("data.dat");
begin
process (addr,rd,wr,datain)
begin	 
	split <= addr(4 downto 0);
if (wr='1') then
Ram(conv_integer(split)) <= datain;
end if;
dataout <= Ram(conv_integer(split)); 
end process;
end Behavioral;