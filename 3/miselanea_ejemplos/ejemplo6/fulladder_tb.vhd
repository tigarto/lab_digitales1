library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fulladder_tb is
end entity fulladder_tb;

architecture RTL of fulladder_tb is
	component fulladder
		port(
			a, b, cin : in  STD_LOGIC;
			s, cout   : out STD_LOGIC
		);
	end component fulladder;

	signal vector_inputs : std_logic_vector(2 downto 0) := "000";
	signal cout          : std_logic;
	signal s             : std_logic;

	constant T : time := 10 ns;

begin

	DUT : fulladder
		port map(
			a    => vector_inputs(2),
			b    => vector_inputs(1),
			cin  => vector_inputs(0),
			s    => s,
			cout => cout
		);

	stimulus : process is
	begin
		for i in 0 to 7 loop
			vector_inputs <= vector_inputs + '1';
            wait for T;
		end loop;
        wait;
	end process stimulus;

end architecture RTL;
