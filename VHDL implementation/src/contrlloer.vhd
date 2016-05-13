library IEEE;
library work;
library std;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_Unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;
entity controller is
	port (op_code: in std_logic_vector(5 downto 0) ; 
	regDst: out std_logic_vector(1 downto 0); 
	branch , memRead , memWrite: out std_logic; 
	memToReg: out std_logic_vector(1 downto 0);
	aluSrc , regWrite,j: out std_logic;
	aluOp : out std_logic_vector(2 downto 0));
end controller;	   
architecture behave11 of controller is 
begin
	process(op_code)
	begin 
		if op_code = "000000" then
					regDst <= "01" ;
					branch <= '0' ;
					memRead <= '0' ;
					memWrite <= '0';
					memToReg <= "00" ;
					aluSrc <= '0' ;
					regWrite <= '1' ;	
					aluOp <= "000"; 
					j <= '0';
		elsif op_code = "100011" then 
					regDst <= "00" ;
					branch <= '0' ;
					memRead <= '1' ;
					memWrite <= '0' ;
					memToReg <= "01" ;
					aluSrc <= '1' ;
					regWrite <= '1' ;	
					aluOp <= "001" ;
					j <= '0';
		elsif op_code = "101011" then
					regDst <= "00" ;
					branch <= '0' ;
					memRead <= '0' ;
					memWrite <= '1' ;
					memToReg <= "01" ;
					aluSrc <= '1' ;
					regWrite <= '0' ;	
					aluOp <= "001" ;
					j <= '0';
		elsif op_code = "000100" then 
					regDst <= "00" ;
					branch <= '1' ;
					memRead <= '0' ;
					memWrite <= '0' ;
					memToReg <= "00" ;
					aluSrc <= '0' ;
					regWrite <= '0' ;	
					aluOp <= "011" ;
					j <= '0';
		elsif op_code = "000010" then
					regDst <= "00" ;
					branch <= '0' ;
					memRead <= '0' ;
					memWrite <= '0' ;
					memToReg <= "00" ;
					aluSrc <= '0' ;
					regWrite <= '0' ;	
					aluOp <= "010" ; 
					j <= '1';
		elsif op_code <= "000011" then
					regDst <= "10" ;
					branch <= '0' ;
					memRead <= '0' ;
					memWrite <= '0' ;
					memToReg <= "10" ;
					aluSrc <= '0' ;
					regWrite <= '1' ;	
					aluOp <= "000" ; 
					j <= '1';
		elsif op_code = "001000" then
					regDst <= "00" ;
					branch <= '0' ;
					memRead <= '0' ;
					memWrite <= '0' ;
					memToReg <= "00" ;
					aluSrc <= '1' ;
					regWrite <= '1' ;	
					aluOp <= "100" ; 
					j <= '0';
		elsif op_code = "001100" then
					regDst <= "00" ;
					branch <= '0' ;
					memRead <= '0' ;
					memWrite <= '0' ;
					memToReg <= "00" ;
					aluSrc <= '1' ;
					regWrite <= '1' ;	
					aluOp <= "101" ; 
					j <= '0';
		end	if;
	end process;
end behave11;