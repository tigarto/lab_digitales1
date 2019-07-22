--------------------------------------------
-- Module Name: fulladder_dataflow_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity halfadder_structural_tb Is
end halfadder_structural_tb;

Architecture behavior of halfadder_structural_tb Is
	Component halfadder_structural
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
	DUT:  halfadder_structural PORT MAP (
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

--------------------------------------------
-- Module Name: and2_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity and2_tb Is
end and2_tb;

Architecture behavior of and2_tb Is
	Component and2
	port (
		i0  	 : in STD_LOGIC;
		i1  	 : in STD_LOGIC;
		o        : out STD_LOGIC
		);	
	End Component;
	
	Signal i0_sig 	: STD_LOGIC := '0';
	Signal i1_sig 	: STD_LOGIC := '0';
	Signal o_sig    : STD_LOGIC;
	
	
begin
	DUT:  and2 PORT MAP (
		i0 => i0_sig,
		i1 => i1_sig,
		o => o_sig
	);
		 
	SIGNALS: process
    begin
                                         -- i1,i0
        i1_sig <= '0';                    -- 00
        i0_sig <= '0';
        
        wait for 20 ns;                  -- 01
        i0_sig <= '1'; 
        
        wait for 20 ns;                  --- 10
        i1_sig <= '1';
        i0_sig <= '0'; 
        
        
        wait for 20 ns;                  --- 11
        i0_sig <= '1';
                
        wait for 20 ns;
		
		wait;
	end process;
end behavior;

--------------------------------------------
-- Module Name: xor2_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity xor2_tb Is
end xor2_tb;

Architecture behavior of xor2_tb Is
	Component xor2
	port (
		i0  	 : in STD_LOGIC;
		i1  	 : in STD_LOGIC;
		o        : out STD_LOGIC
		);	
	End Component;
	
	Signal i0_sig 	: STD_LOGIC := '0';
	Signal i1_sig 	: STD_LOGIC := '0';
	Signal o_sig    : STD_LOGIC;
	
	
begin
	DUT:  xor2 PORT MAP (
		i0 => i0_sig,
		i1 => i1_sig,
		o => o_sig
	);
		 
	SIGNALS: process
    begin
                                         -- i1,i0
        i1_sig <= '0';                    -- 00
        i0_sig <= '0';
        
        wait for 20 ns;                  -- 01
        i0_sig <= '1'; 
        
        wait for 20 ns;                  --- 10
        i1_sig <= '1';
        i0_sig <= '0'; 
        
        
        wait for 20 ns;                  --- 11
        i0_sig <= '1';
                
        wait for 20 ns;
		
		wait;
	end process;
end behavior;
