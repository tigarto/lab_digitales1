library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity example_tb is
end entity example_tb;

architecture RTL of example_tb is
	component example
		port(
			a, b, c : in  STD_LOGIC;
			y       : out STD_LOGIC
		);
	end component example;
	
	signal a, b, c : std_logic := '0';
	signal y : std_logic;
	
	constant T : time := 15 ns;
begin
	DUT:example
		port map(
			a => a,
			b => b,
			c => c,
			y => y
		);
		
	stimulus : process is
	begin
		wait for T;
		a <= '1';
		wait for T;
		b <= '1';		
		wait for T;
		c <= '1';
		wait for T;
		a <= '0';
		c <= '0';		
		wait for T;
		a <= '1';
		b <= '0';
		c <= '1';
		wait for T;
		wait;		
	end process stimulus;
end architecture RTL;
