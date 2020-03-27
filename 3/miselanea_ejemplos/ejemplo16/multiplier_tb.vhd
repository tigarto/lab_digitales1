library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity multiplier_tb is
end entity multiplier_tb;

architecture RTL of multiplier_tb is
	component multiplier
		port(
			a, b : in  STD_LOGIC_VECTOR(3 downto 0);
			y    : out STD_LOGIC_VECTOR(7 downto 0)
		);
	end component multiplier;

	signal a, b : std_logic_vector(3 downto 0) := "0000";
	signal y    : std_logic_vector(7 downto 0);

	constant T : time := 10 ns;
begin
	DUT : multiplier
		port map(
			a => a,
			b => b,
			y => y
		);

	stimulus : process is
	begin
		for i in 0 to 15 loop
			for j in 0 to 15 loop				
				wait for T;
				a <= a + '1';
			end loop;
			b <= b + '1';
			a <= "0000";
		end loop;
		wait;
	end process stimulus;

end architecture RTL;
