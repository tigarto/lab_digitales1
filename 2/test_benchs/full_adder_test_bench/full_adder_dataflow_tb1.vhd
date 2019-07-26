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
	
    Signal x_sig 	    : STD_LOGIC;
    Signal y_sig 	    : STD_LOGIC;
    Signal cin_sig 	    : STD_LOGIC;
	Signal s_sig    	: STD_LOGIC;
	Signal cout_sig    	: STD_LOGIC;


	
begin 
	DUT:  full_adder PORT MAP (
		x => x_sig,
		y => y_sig ,
		cin => cin_sig,
		s => s_sig,
		cout => cout_sig
	);
	

	testing: process
	-- Simple Testbench: Asignacion manual de estimulos
	constant PERIOD: time := 20 ns;
    begin
        x_sig <= '0'; y_sig <= '0'; cin_sig <= '0'; 		
		wait for PERIOD;
		cin_sig <= '1'; 		
		wait for PERIOD;
		y_sig <= '1'; cin_sig <= '0'; 		
		wait for PERIOD;
		y_sig <= '1'; cin_sig <= '1'; 
		wait for PERIOD;
		x_sig <= '1'; y_sig <= '0'; cin_sig <= '0'; 		
		wait for PERIOD;
		cin_sig <= '1'; 
		wait for PERIOD;
		y_sig <= '1'; cin_sig <= '0'; 
		wait for PERIOD;
		y_sig <= '1'; cin_sig <= '1'; 
		wait for PERIOD;
		wait;
	end process testing;
end behavior;
