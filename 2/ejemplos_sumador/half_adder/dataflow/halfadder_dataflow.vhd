--------------------------------------------
-- Module Name: fulladder_dataflow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


Entity halfadder_dataflow Is
port(
		a  	 : in STD_LOGIC;
		b  	 : in STD_LOGIC;
		s 	 : out STD_LOGIC;
		c    : out STD_LOGIC
	);
end halfadder_dataflow;

Architecture dataflow of halfadder_dataflow Is

begin 
    s <= a xor b;
    c <= a and b;
	
end dataflow;