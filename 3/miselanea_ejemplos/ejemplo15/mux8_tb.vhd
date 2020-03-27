library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;


entity mux8_tb is
end entity mux8_tb;

architecture RTL of mux8_tb is
	component mux8
		port(
			d : in  STD_LOGIC_VECTOR(7 downto 0);
			s : in  STD_LOGIC_VECTOR(2 downto 0);
			y : out STD_LOGIC
		);
	end component mux8;
	
	signal d : std_logic_vector(7 downto 0) := "10001101";
	signal s : std_logic_vector(2 downto 0) := "000";
	signal y : std_logic;
	
	constant T : time := 10 ns;
	
	
begin
	DUT:mux8
		port map(
			d => d,
			s => s,
			y => y
		);
		
	stimulus : process is
	begin
		for i in 0 to 7 loop
			s <= std_logic_vector(to_unsigned(i,s'length));
			wait for T;			
		end loop;
		wait;		
	end process stimulus;
	
end architecture RTL;
