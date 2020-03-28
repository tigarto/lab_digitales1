library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity decoder_tb is
end entity decoder_tb;

architecture RTL of decoder_tb is

	constant WIDTH : integer := 3;
	constant T     : time    := 10 ns;

	component decoder
		generic(N : integer);
		port(
			a : in  STD_LOGIC_VECTOR(N - 1 downto 0);
			y : out STD_LOGIC_VECTOR(2**N - 1 downto 0)
		);
	end component decoder;

	signal a : std_logic_vector(WIDTH - 1 downto 0) := (others => '0');
	signal y : std_logic_vector(2**WIDTH - 1 downto 0);

begin

	DUT : decoder
		generic map(
			N => WIDTH
		)
		port map(
			a => a,
			y => y
		);

	stimulus : process is
	begin
		for i in 0 to 2**WIDTH - 1 loop
			wait for T;
			a <= a + '1';
		end loop;
		wait for T;
		wait;
	end process stimulus;

end architecture RTL;
