-- Counters in VHDL Using the Type UNSIGNED --
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Counter_4bit_Up is
	port(
		clk , rst: in std_logic;
		cnt : out unsigned(3 downto 0)
	);
end entity Counter_4bit_Up;

architecture Counter_4bit_Up_arch of Counter_4bit_Up is

	signal cnt_tmp : unsigned(3 downto 0);
	
begin
	
	COUNTER: process(clk, rst)
	begin
		if (rst = '0') then
			cnt_tmp <= "0000";		
		elsif (clk'event and clk = '1') then
			cnt_tmp <= cnt_tmp + 1;		
		end if;			
	end process; 
	
	cnt <= cnt_tmp;

end architecture;
