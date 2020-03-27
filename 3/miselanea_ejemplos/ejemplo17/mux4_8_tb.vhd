library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux4_8_tb is
end entity mux4_8_tb;

architecture RTL of mux4_8_tb is
	component mux4_8
		port(
			d0, d1, d2, d3 : in  STD_LOGIC_VECTOR(7 downto 0);
			s              : in  STD_LOGIC_VECTOR(1 downto 0);
			y              : out STD_LOGIC_VECTOR(7 downto 0)
		);
	end component mux4_8;
	
	signal d0, d1, d2, d3 : std_logic_vector(7 downto 0);
	signal s : std_logic_vector(1 downto 0);	
	signal y : std_logic_vector(7 downto 0);
	
	constant T : time := 10 ns;
	
begin
	
	DUT : mux4_8
		port map(
			d0 => d0,
			d1 => d1,
			d2 => d2,
			d3 => d3,
			s  => s,
			y  => y
		);
		
		estimulus : process is
		begin
			d0 <= X"01";
			d1 <= X"02";
			d2 <= X"04";
			d3 <= X"08";
			s <= "00";
			for i in 0 to 3 loop
				s <= std_logic_vector(to_unsigned(i, s'length));
				wait for T;
			end loop;
			wait;			
		end process estimulus;
		
end architecture RTL;
