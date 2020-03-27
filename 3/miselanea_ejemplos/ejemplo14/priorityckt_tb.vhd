library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity priorityckt_tb is
end entity priorityckt_tb;

architecture RTL of priorityckt_tb is
	component priorityckt
		port(
			a : in  STD_LOGIC_VECTOR(3 downto 0);
			y : out STD_LOGIC_VECTOR(3 downto 0)
		);
	end component priorityckt;
	
	signal a : std_logic_vector(3 downto 0) := "0000";
	signal y : std_logic_vector(3 downto 0);
	constant T : time := 10 ns;
	
begin
	
	DUT: priorityckt
		port map(
			a => a,
			y => y
		);
		
	stimulus : process is
	begin
		for i in 0 to 15 loop
			wait for T;
			a <= a + '1';
		end loop;
		wait;
	end process stimulus;
	

end architecture RTL;
