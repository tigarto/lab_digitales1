-- Counters in VHDL Using the Type STD_LOGIC_VECTOR (1) --
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity Counter_4bit_Up is
	port(
		clk , rst: in std_logic;
		cnt : out std_logic_vector(3 downto 0)
	);
end entity Counter_4bit_Up;

architecture Counter_4bit_Up_arch of Counter_4bit_Up is

	signal cnt_std : std_logic_vector(3 downto 0);
	
begin
	
	COUNTER: process(clk, rst)
	begin
		if (rst = '0') then
			cnt_std <= "0000";		
		elsif (clk'event and clk = '1') then
			cnt_std <= cnt_std + 1;	
		end if;			
	end process; 
	
	cnt <= cnt_std;

end architecture;