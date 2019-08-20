--------------------------------------------
-- Module Name: full_adder_structural
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity or3 Is
port (
		i0 : in STD_LOGIC;
        i1 : in STD_LOGIC;  
        i2 : in STD_LOGIC;        
        o : out STD_LOGIC
	);
end or3;

architecture dataflow of or3 is
begin
	o <= i0 OR i1 OR i2;		
end dataflow;