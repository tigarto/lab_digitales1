library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all; -- @suppress "Deprecated package"
use ieee.std_logic_unsigned.all; -- @suppress "Deprecated package"

entity inv_tv is
end entity inv_tv;

architecture RTL of inv_tv is

	component inv is
		port(
			a : in  std_logic_vector(3 downto 0);
			y : out std_logic_vector(3 downto 0)
		);
	end component;
	
	signal a: std_logic_vector(3 downto 0) := "0000";
	signal y: std_logic_vector(3 downto 0);
	
	constant T : time := 10 ns;
	
begin
	DUT:inv
		port map(
			a => a,
			y => y
		);
	
	stimulus : process is
	begin
		for i in 0 to 15 loop
			a <= a + 1;
			wait for T;			
		end loop;
		wait;		
	end process stimulus;
end architecture RTL;
