--------------------------------------------
-- Module Name: full_adder_structural
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


Entity and2 Is
port (
		i0 : in STD_LOGIC;
		i1 : in STD_LOGIC;        
        o  : out STD_LOGIC
	);
end and2;

architecture dataflow of and2 is
begin
	o <= i0 AND i1;		
end dataflow;