----------------------------------------------------------------------------------
-- Company:        Universidad de Antioquia
-- Engineer:       Ricardo Andrés Velásquez Vélez
-- 
-- Create Date:    04:57:21 05/20/2014 
-- Design Name: 
-- Module Name:    BIN2BCD_0a999 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    Convierte de binario de 10 bits sin signo a 3 digitos BCD
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity BIN2BCD_0a999 is
    Port ( BIN : in  STD_LOGIC_VECTOR (9 downto 0);
           BCD2 : out  STD_LOGIC_VECTOR (3 downto 0);
           BCD1 : out  STD_LOGIC_VECTOR (3 downto 0);
           BCD0 : out  STD_LOGIC_VECTOR (3 downto 0));
end BIN2BCD_0a999;

architecture Behavioral of BIN2BCD_0a999 is
	signal bin_dec: STD_LOGIC_VECTOR (10 downto 0);
	signal bin_unid: STD_LOGIC_VECTOR (10 downto 0);
	signal bcd_dec: STD_LOGIC_VECTOR (3 downto 0);
	signal bcd_cent: STD_LOGIC_VECTOR (3 downto 0);
begin

	bin_dec <= BIN - bcd_cent*"1100100";
	
	bin_unid <= bin_dec - bcd_dec*"1010";

   bcd_cent <= "1001" when (BIN>=900) else
                "1000" when (BIN>=800) else
					 "0111" when (BIN>=700) else
                "0110" when (BIN>=600) else
                "0101" when (BIN>=500) else
                "0100" when (BIN>=400) else
                "0011" when (BIN>=300) else
                "0010" when (BIN>=200) else
                "0001" when (BIN>=100) else
					 "0000";
					 
	bcd_dec <=  "1001" when (bin_dec>=90) else
                "1000" when (bin_dec>=80) else
					 "0111" when (bin_dec>=70) else
                "0110" when (bin_dec>=60) else
                "0101" when (bin_dec>=50) else
                "0100" when (bin_dec>=40) else
                "0011" when (bin_dec>=30) else
                "0010" when (bin_dec>=20) else
                "0001" when (bin_dec>=10) else
					 "0000";
					 
	BCD0 <= bin_unid(3 downto 0);
	BCD1 <= bcd_dec(3 downto 0);
	BCD2 <= bcd_cent(3 downto 0);

end Behavioral;

