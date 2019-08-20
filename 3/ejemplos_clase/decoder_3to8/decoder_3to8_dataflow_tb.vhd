--------------------------------------------
-- Module Name: decoder_3to8_dataflow_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity decoder_3to8_dataflow_tb Is
end decoder_3to8_dataflow_tb;

Architecture behavior of decoder_3to8_dataflow_tb Is
	Component decoder_3to8_dataflow
	port (
		x 		: in STD_LOGIC_VECTOR (2 downto 0);
		y 		: out STD_LOGIC_VECTOR (7 downto 0)
	);	
	End Component;
	
	Signal x 	 : STD_LOGIC_VECTOR (2 downto 0) := "000";
	Signal y 	 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
	Signal count : STD_LOGIC_VECTOR (2 downto 0) := "000";

begin
	DUT:  decoder_3to8_dataflow PORT MAP (
			x => x,
			y => y
		 );
		 
	process
		variable k : integer := 0;

	begin
		
        for k in 0 to 7 loop   
    

		  wait for 5 ns;
		  x <= count;
		  
		  wait for 10 ns;
		  
        count <= count + '1';  		  
        end loop;		 
		
		wait;
	end process;
end behavior;