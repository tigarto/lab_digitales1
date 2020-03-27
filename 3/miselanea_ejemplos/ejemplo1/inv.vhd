library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity inv is
	port(
		a : in std_logic_vector(3 downto 0);
		y : out std_logic_vector(3 downto 0)
	);
end entity inv;

architecture synth of inv is
	
begin
	y <= not a;
end architecture synth;
