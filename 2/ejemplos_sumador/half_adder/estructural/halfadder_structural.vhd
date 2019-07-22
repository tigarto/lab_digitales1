--------------------------------------------
-- Module Name: fulladder_dataflow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


Entity halfadder_structural Is
port(
		a  	 : in STD_LOGIC;
		b  	 : in STD_LOGIC;
		s 	 : out STD_LOGIC;
		c    : out STD_LOGIC
	);
end halfadder_structural;

Architecture halfadder_struct of halfadder_structural Is

component and2 
port(
    i0, i1 : in STD_LOGIC;
    o : out STD_LOGIC
);
end component;

component xor2 port (
    i0, i1 : in STD_LOGIC;
    o : out STD_LOGIC
);
end component;

begin

	and_comp_1 : and2 port map (
      i0 => a,
      i1 => b,
      o => c
	);
	
	xor_comp_1 : xor2 port map (
      i0 => a,
      i1 => b,
      o => s
    );

end halfadder_struct;
