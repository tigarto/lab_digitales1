--------------------------------------------
-- Module Name: halfadder_bahavioral_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


Entity full_adder_behavioral_tb Is
end full_adder_behavioral_tb;

Architecture behavior of full_adder_behavioral_tb Is
	Component full_adder 
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
	DUT:  full_adder PORT MAP (
		x => x_y_cin_sig(2),
		y => x_y_cin_sig(1),
		cin => x_y_cin_sig(0),
		s => s_sig,
		cout => cout_sig
	);
	

	process

	type pattern_type is record
      --  The inputs of the adder.
      x, y, cin : STD_LOGIC;
	end record;
	
    --  The patterns to apply.
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
      (('0', '0', '0'),
       ('0', '0', '1'),
       ('0', '1', '0'),
       ('0', '1', '1'),
       ('1', '0', '0'),
       ('1', '0', '1'),
       ('1', '1', '0'),
	   ('1', '1', '1'));

	begin
		--  Check each pattern.
		for i in patterns'range loop
			x_y_cin_sig(2) <= patterns(i).x;
			x_y_cin_sig(1) <= patterns(i).y;
			x_y_cin_sig(0) <= patterns(i).cin;
			--  Wait for the results.
			wait for 20 ns;
		end loop;	
		wait;
	end process;
end behavior;
