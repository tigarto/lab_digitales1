--------------------------------------------
-- Module Name: full_adder_structural
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


Entity full_adder_structural Is
port (
		x : in STD_LOGIC;
		y : in STD_LOGIC;
		cin : in STD_LOGIC;
        s : out STD_LOGIC;
        cout : out STD_LOGIC
	);
end full_adder_structural;

architecture behavior of full_adder_structural is
	component and2 port
	( i0, i1: in STD_LOGIC;
	  o : out STD_LOGIC);
	end component;

	component or3 port
	( i0, i1, i2: in STD_LOGIC;
	o : out STD_LOGIC);
	end component;

	component xor3 port
	( i0, i1, i2: in STD_LOGIC;
	o : out STD_LOGIC);
    end component;

    Signal x_y : STD_LOGIC;
    Signal x_cin : STD_LOGIC;
    Signal y_cin : STD_LOGIC;

begin	

	x1 : xor3 port map (i0 => x, i1 => y, i2 => cin, o => s);
	a1 : and2 port map (i0 => x, i1 => y, o => x_y);
    a2 : and2 port map (i0 => x, i1 => cin, o => x_cin);
    a3 : and2 port map (i0 => y, i1 => cin, o => y_cin);
	o1 : or3 port map (i0 => x_y, i1 => x_cin, i2 => y_cin, o => cout);
		
end behavior;