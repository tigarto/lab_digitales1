--------------------------------------------
-- Module Name: halfadder_bahavioral_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


Entity full_adder_structural_tb Is
end full_adder_structural_tb;

Architecture behavior of full_adder_structural_tb Is
	Component full_adder_structural 
	port (
		  x : in STD_LOGIC;
		  y : in STD_LOGIC;
		  cin : in STD_LOGIC;
          s : out STD_LOGIC;
          cout: out STD_LOGIC
		);	
	End Component;
	
	Signal x_y_cin_sig 	: STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
	Signal s_sig    	: STD_LOGIC;
	Signal cout_sig    	: STD_LOGIC;


	
begin 
	DUT:  full_adder_structural PORT MAP (
		x => x_y_cin_sig(2),
		y => x_y_cin_sig(1),
		cin => x_y_cin_sig(0),
		s => s_sig,
		cout => cout_sig
	);
	

	process

	type pattern_array is array (natural range <>) of STD_LOGIC_VECTOR(2 DOWNTO 0);
    constant patterns : pattern_array :=
	  ("000",
	   "001",
	   "010",
	   "011",
	   "100",
	   "101",
	   "110",
	   "111");

	begin
		--  Check each pattern.
		for i in patterns'range loop
			x_y_cin_sig <= patterns(i);
			--  Wait for the results.
			wait for 20 ns;
		end loop;	
		wait;
	end process;
end behavior;
