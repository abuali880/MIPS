library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;
entity ram_vhdl is
PORT (readreg1 : in STD_LOGIC_VECTOR(4 downto 0);
readreg2 : in STD_LOGIC_VECTOR(4 downto 0);
writereg : in STD_LOGIC_VECTOR(4 downto 0); 
writedata : in STD_LOGIC_VECTOR(31 downto 0);	
regwrite : in STD_LOGIC;
readdata1 : out STD_LOGIC_VECTOR(31 downto 0);
readdata2 : out STD_LOGIC_VECTOR(31 downto 0)
);
end ram_vhdl;
architecture Behavioral of ram_vhdl is
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
signal Ram : TRam := init_bram("regfile.dat");
begin
process (readreg1,readreg2,writereg,writedata)
begin
if (regwrite='1') then
Ram(conv_integer(writereg)) <= writedata;
end if;
readdata1 <= Ram(conv_integer(readreg1)); 
readdata2 <= Ram(conv_integer(readreg2));
end process;
end Behavioral;
