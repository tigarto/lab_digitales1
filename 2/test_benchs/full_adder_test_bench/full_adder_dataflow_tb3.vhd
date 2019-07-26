--------------------------------------------
-- Module Name: halfadder_bahavioral_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


Entity full_adder_dataflow_tb Is
end full_adder_dataflow_tb;

Architecture behavior of full_adder_dataflow_tb Is
	Component full_adder
	port (
		  x : in STD_LOGIC;
		  y : in STD_LOGIC;
		  cin : in STD_LOGIC;
          s : out STD_LOGIC;
          cout: out STD_LOGIC
		);	
	End Component;
	
	Signal test_vector  : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
	Signal s_sig    	: STD_LOGIC;
	Signal cout_sig    	: STD_LOGIC;


	
begin 
	DUT:  full_adder PORT MAP (
		x => test_vector(2),
		y => test_vector(1),
		cin => test_vector(0),
		s => s_sig,
		cout => cout_sig
	);
	

	testing: process
    -- Simple Testbench: loop

	begin
		for i in 0 to 7 loop
		  test_vector <= test_vector + 1; -- test_vector <= test_vector + "001";  test_vector <= test_vector + '1'
		end loop;							
								 
	
	end process testing;
end behavior;
