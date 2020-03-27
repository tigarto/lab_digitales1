library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mux4_tb is
end entity mux4_tb;

architecture RTL of mux4_tb is
	component mux4
		port(
			d0, d1, d2, d3 : in  STD_LOGIC_VECTOR(3 downto 0);
			s              : in  STD_LOGIC_VECTOR(1 downto 0);
			y              : out STD_LOGIC_VECTOR(3 downto 0)
		);
	end component mux4;
	
	signal d0, d1, d2, d3 : std_logic_vector(3 downto 0);
	signal s : std_logic_vector(1 downto 0);
	signal y : std_logic_vector(3 downto 0);
	
	constant T : time := 20 ns;
	
begin
	
	DTU: mux4
		port map(
			d0 => d0,
			d1 => d1,
			d2 => d2,
			d3 => d3,
			s  => s,
			y  => y
		);
		
	stimulus : process is
	begin
		d0 <= "0000"; 
		d1 <= "0001"; 
		d2 <= "0010"; 
		d3 <= "0100";
		s <= "00";
		wait for T;	
		for i in 0 to 3 loop
			s <= s + i;	
			wait for T;		
		end loop;		
		wait;
	end process stimulus;
	

end architecture RTL;
