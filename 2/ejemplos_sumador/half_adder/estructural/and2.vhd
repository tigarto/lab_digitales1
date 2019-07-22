--------------------------------------------
-- Module Name: fulladder_dataflow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


Entity and2 Is
port(
		i0  	 : in STD_LOGIC;
		i1  	 : in STD_LOGIC;
		o        : out STD_LOGIC
	);
end and2;

Architecture and2_arch of and2 Is

begin
    o <= i0 AND i1;
end and2_arch;
