library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity full_adder_tb Is
end full_adder_tb;

Architecture behavior of full_adder_tb Is
	
    Component full_adder Is
    port (
        x : in STD_LOGIC;
        y : in STD_LOGIC;
        cin : in STD_LOGIC;
        -- salidas forma dataflow
        s_df : out STD_LOGIC;
        cout_df: out STD_LOGIC;
        -- salidas forma structural
        s_struct : out STD_LOGIC;
        cout_struct: out STD_LOGIC;
        -- salidas forma behavioral
        s_behav : out STD_LOGIC;
        cout_behav: out STD_LOGIC
    );
    end Component;
	
	Signal x_y_cin_sig 	    : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
    Signal out_dataflow    	: STD_LOGIC_VECTOR(1 DOWNTO 0);
    Signal out_struct   	: STD_LOGIC_VECTOR(1 DOWNTO 0);
	Signal out_behav    	: STD_LOGIC_VECTOR(1 DOWNTO 0);

	
begin 
	DUT:  full_adder PORT MAP (
        -- Entratas
		x => x_y_cin_sig(2),
		y => x_y_cin_sig(1),
        cin => x_y_cin_sig(0),
        -- Salidas formadataflow
        s_df => out_dataflow(1),
        cout_df => out_dataflow(0),
        -- salidas forma dataflow
		s_struct => out_struct(1),
        cout_struct => out_struct(0),
        -- salidas forma behav
        s_behav => out_behav(1),
        cout_behav => out_behav(0)
    );


    -- Generacion de la señal de test
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
    
