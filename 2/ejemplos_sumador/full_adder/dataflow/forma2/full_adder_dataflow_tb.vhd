--------------------------------------------
-- Module Name: halfadder_bahavioral_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
	
	Signal x_y_cin_sig 	: STD_LOGIC_VECTOR(2 DOWNTO 0);
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
		 
	SIGNALS: process
    begin
											  --------------
		                                      -- x | y |cin
		                                      --------------
		x_y_cin_sig <= "000";                 -- 0   0   0
        
        wait for 20 ns;                       -- 0   0   1
        x_y_cin_sig <= "001";  
        
        wait for 20 ns;                       -- 1   0   1
        x_y_cin_sig <= "010";   
        
        
        wait for 20 ns;                       -- 0   1   1
		x_y_cin_sig <= "011";
		
		wait for 20 ns;                       -- 1   0   0
		x_y_cin_sig <= "100";
		
		wait for 20 ns;                       -- 1   0   1
		x_y_cin_sig <= "101";
		
		wait for 20 ns;                       -- 1   1   0
		x_y_cin_sig <= "110";
		
		wait for 20 ns;                       -- 1   1   1
        x_y_cin_sig <= "111";
                
        wait for 20 ns;
		
		wait;
	end process;
end behavior;
