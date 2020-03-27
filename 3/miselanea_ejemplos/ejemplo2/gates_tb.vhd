library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all; 
use ieee.std_logic_arith.all; 


entity gates_tb is
end entity gates_tb;

architecture RTL of gates_tb is
	-- Component
	component gates is
		port(
			a, b               : in  STD_LOGIC_VECTOR(3 downto 0);
			y1, y2, y3, y4, y5 : out STD_LOGIC_VECTOR(3 downto 0)
		);
	end component;

	-- internal signals
	signal a                  : std_logic_vector(3 downto 0);
	signal b                  : std_logic_vector(3 downto 0);
	signal y1, y2, y3, y4, y5 : std_logic_vector(3 downto 0);

	-- input vector
	type vector is array (natural range <>) of std_logic_vector(3 downto 0);
	constant vector_a_signals : vector := ("0000",
	                                       "1001",
	                                       "1111",
	                                       "1100",
	                                       "0010",
	                                       "0101"
	                                      );
	constant vector_b_signals : vector := ("1001",
	                                       "1101",
	                                       "1000",
	                                       "1001",
	                                       "0100",
	                                       "1011"
	                                      );
	                                      
	constant T : time := 20 ns;
	

begin
	-- Component instanciation
	DUT : gates
		port map(
			a  => a,
			b  => b,
			y1 => y1,
			y2 => y2,
			y3 => y3,
			y4 => y4,
			y5 => y5
		);

	-- Stimulus
	stimulus : process is
	begin
		for i in 0 to 5 loop
			a <= vector_a_signals(i);
			b <= vector_b_signals(i);
			wait for T;			
		end loop;
		wait;		
	end process stimulus;
end architecture RTL;
