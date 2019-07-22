--------------------------------------------
-- Module Name: fulladder_dataflow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


Entity halfadder_behavioral Is
port(
		a  	 : in STD_LOGIC;
		b  	 : in STD_LOGIC;
		s 	 : out STD_LOGIC;
		c    : out STD_LOGIC
	);
end halfadder_behavioral;

Architecture behavior of halfadder_behavioral Is

begin 
	process (a,b)
	begin
		s <= a xor b;
		c <= a and b;
	end process;
	
end behavior;