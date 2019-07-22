--------------------------------------------
-- Module Name: full_adder_dataflow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity full_adder Is
port (
		x : in STD_LOGIC;
		y : in STD_LOGIC;
		cin : in STD_LOGIC;
        s : out STD_LOGIC;
        cout: out STD_LOGIC
	);
end full_adder;

Architecture behavior of full_adder Is

Signal x_y : STD_LOGIC;
Signal x_cin : STD_LOGIC;
Signal y_cin : STD_LOGIC;

begin        
		s <= x xor y xor cin;
		x_y <= x and y;
		x_cin <= x and cin;
        y_cin <= y and cin;
        cout <= x_y or x_cin or y_cin;
end behavior;