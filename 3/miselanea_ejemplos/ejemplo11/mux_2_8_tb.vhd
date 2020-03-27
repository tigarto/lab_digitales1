library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_2_8_tb is
end entity mux_2_8_tb;

architecture RTL of mux_2_8_tb is
	component mux2_8
		port(
			d0, d1 : in  STD_LOGIC_VECTOR(7 downto 0);
			s      : in  STD_LOGIC;
			y      : out STD_LOGIC_VECTOR(7 downto 0)
		);
	end component mux2_8;
	
	signal d0,d1 : std_logic_vector(7 downto 0) := "00000000";
	signal s : std_logic := '0';
	signal y : std_logic_vector(7 downto 0);
	
	constant T : time := 20 ns;
	
begin
	
	DUT: mux2_8
		port map(
			d0 => d0,
			d1 => d1,
			s  => s,
			y  => y
		);
		
	stimulus : process is
	begin
		wait for T;
		d1 <= "11100111";
		wait for T;
		s <= '1';
		wait for T;
		s <= '0';
		wait for T;
		d0 <= "00111111";
		wait for T;
		wait;
	end process stimulus;
	
end architecture RTL;
