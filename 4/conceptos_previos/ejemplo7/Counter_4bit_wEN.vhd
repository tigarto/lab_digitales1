-- Counters with Enables in VHDL --
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Counter_4bit_wEN is
	port(
		clk , rst: in std_logic;
		en: in std_logic;
		cnt : out std_logic_vector(3 downto 0)
	);
end entity Counter_4bit_wEN;

architecture Counter_4bit_wEN_arch of Counter_4bit_wEN is

	signal cnt_int : integer range 0 to 15;
	
begin
	
	COUNTER: process(clk, rst)
	begin
		if (rst = '0') then
			cnt_int <= 0;		
		elsif (clk'event and clk = '1') then
			if (en = '1') then
				if (cnt_int = 15) then
					cnt_int <= 0; 
				else
					cnt_int <= cnt_int + 1;
				end if;	
			end if;
		end if;			
	end process; 
	
	cnt <= std_logic_vector(to_unsigned(cnt_int,4));

end architecture;