--------------------------------------------
-- Module Name: halfadder_bahavioral_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity halfadder_behavioral_tb Is
end halfadder_behavioral_tb;

Architecture behavior of halfadder_behavioral_tb Is
	Component halfadder_behavioral
	port (
		a  	 : in STD_LOGIC;
		b  	 : in STD_LOGIC;
		s 	 : out STD_LOGIC;
		c    : out STD_LOGIC
		);	
	End Component;
	
	Signal a_sig 	: STD_LOGIC := '0';
	Signal b_sig 	: STD_LOGIC := '0';
	Signal c_sig    : STD_LOGIC;
	Signal s_sig    : STD_LOGIC;
	
begin
	DUT:  halfadder_behavioral PORT MAP (
		a => a_sig,
		b => b_sig,
		c => c_sig,
		s => s_sig
	);
		 
	SIGNALS: process
    begin
                                         -- a,b
        a_sig <= '0';                    -- 00
        b_sig <= '0';
        
        wait for 20 ns;                  -- 01
        b_sig <= '1'; 
        
        wait for 20 ns;                  --- 10
        a_sig <= '1';
        b_sig <= '0'; 
        
        
        wait for 20 ns;                  --- 11
        b_sig <= '1';
                
        wait for 20 ns;
		
		wait;
	end process;
end behavior;
