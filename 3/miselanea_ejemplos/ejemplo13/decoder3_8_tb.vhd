library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity decoder3_8_tb is
end entity decoder3_8_tb;

architecture RTL of decoder3_8_tb is
	component decoder3_8
		port(
			a : in  STD_LOGIC_VECTOR(2 downto 0);
			y : out STD_LOGIC_VECTOR(7 downto 0)
		);
	end component decoder3_8;
	
	signal a : std_logic_vector(2 downto 0) := "000";
	signal y : std_logic_vector(7 downto 0);
	
	constant T : time := 10 ns;
	
begin
	
	DUT: decoder3_8
		port map(
			a => a,
			y => y
		);
		
	stimulus : process is
	begin
		wait for T;
		for i in 0 to 7 loop
			a <= a + "001";
			wait for T;
		end loop;
		wait;
		
	end process stimulus;
	

end architecture RTL;
