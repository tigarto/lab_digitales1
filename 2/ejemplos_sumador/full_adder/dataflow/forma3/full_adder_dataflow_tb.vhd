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

	begin
		wait for 20 ns;
		for k in 0 to 7 loop   	  
		  x_y_cin_sig <= x_y_cin_sig + '1';
		  wait for 20 ns;		  		  
		end loop;  
		wait;
	  								
								 
	
	end process;
end behavior;
