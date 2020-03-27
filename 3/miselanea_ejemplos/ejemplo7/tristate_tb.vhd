library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tristate_tb is
end entity tristate_tb;

architecture RTL of tristate_tb is
	component tristate
		port(
			a  : in  STD_LOGIC_VECTOR(3 downto 0);
			en : in  STD_LOGIC;
			y  : out STD_LOGIC_VECTOR(3 downto 0)
		);
	end component tristate;

	signal a   : std_logic_vector(3 downto 0) := "0000";
	signal en  : std_logic                    := '0';
	signal y   : std_logic_vector(3 downto 0);
	constant T : time                         := 50 ns;
begin
	DUT : tristate
		port map(
			a  => a,
			en => en,
			y  => y
		);

	stimulus : process is
	begin
		wait for T;
		en <= '1';
		wait for T;
		a  <= "1010";
        wait for T;
		wait;
	end process stimulus;

end architecture RTL;
