--------------------------------------------
-- Module Name: full_adder_structural
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


Entity xor3 Is
port (
		i0 : in STD_LOGIC;
        i1 : in STD_LOGIC;        
        i2 : in STD_LOGIC;        
        o : out STD_LOGIC
	);
end xor3;

architecture dataflow of xor3 is
begin
	o <= i0 XOR i1 XOR i2;		
end dataflow;