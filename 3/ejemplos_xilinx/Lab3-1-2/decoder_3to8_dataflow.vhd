--------------------------------------------
-- Module Name: decoder_3to8_dataflow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity decoder_3to8_dataflow Is
port(
		x 	: in STD_LOGIC_VECTOR(2 downto 0);
		y	: out STD_LOGIC_VECTOR(7 downto 0)
	);
end decoder_3to8_dataflow;

Architecture behavior of decoder_3to8_dataflow Is
	
begin

	y(0) <= not(x(2) or x(1) or x(0));	 
	y(1) <= (x(2) and not(x(1)) and not(x(0)));
	y(2) <= (not(x(2)) and x(1) and not(x(0)));
	y(3) <= (x(2) and x(1) and not(x(0)));
	y(4) <= (not(x(2)) and not(x(1)) and x(0));
	y(5) <= (x(2) and not(x(1)) and x(0));
	y(6) <= (not(x(2)) and x(1) and x(0));
	y(7) <= (x(2) and x(1) and x(0));
	
end behavior;