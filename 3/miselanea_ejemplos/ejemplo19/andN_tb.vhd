library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity andN_tb is
end entity andN_tb;

architecture RTL of andN_tb is
	component andN
		generic(width : integer);
		port(
			a : in  STD_LOGIC_VECTOR(width - 1 downto 0);
			y : out STD_LOGIC
		);
	end component andN;
	
	constant N : integer := 4;
	constant T : time := 10 ns;
	
	
	signal a : std_logic_vector(N - 1 downto 0) := (others => '0');
	signal y : std_logic;
		
begin
	
	DTU: andN
		generic map(
			width => N
		)
		port map(
			a => a,
			y => y
		);
		
	stimulus : process is
	begin
		for i in 0 to N - 1 loop
			a <= std_logic_vector(to_unsigned(2*i,a'length));
			wait for T;			
		end loop;
        a <= (others => '1');
        wait for T;
		wait;		
	end process stimulus;
	
end architecture RTL;
