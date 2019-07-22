--------------------------------------------
-- Module Name: fulladder_dataflow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


Entity xor2 Is
port(
		i0  	 : in STD_LOGIC;
		i1  	 : in STD_LOGIC;
		o        : out STD_LOGIC
	);
end xor2;

Architecture xor2_arch of xor2 Is
signal  s0, s1    : STD_LOGIC;

begin
    s0 <= i1 and (not(i0));
    s1 <= i0 and (not(i1));
    o <= s0 or s1;
end xor2_arch;
