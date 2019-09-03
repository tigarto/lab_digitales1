--------------------------------------------
-- Module Name: decoder_74138_dataflow_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity decoder_74138_dataflow_tb Is
end decoder_74138_dataflow_tb;

Architecture behavior of decoder_74138_dataflow_tb Is
	Component decoder_74138_dataflow
	port(
		g1  : in STD_LOGIC;
		g2a_n : in STD_LOGIC;
		g2b_n : in STD_LOGIC;
		x 	: in STD_LOGIC_VECTOR(2 downto 0);
		y	: out STD_LOGIC_VECTOR(7 downto 0)
	);
	End Component;
	
	Signal count : STD_LOGIC_VECTOR (2 downto 0) := "000";
	Signal x 	 : STD_LOGIC_VECTOR (2 downto 0) := "000";
	Signal y 	 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
	
	Signal g1  : STD_LOGIC := '0';
    Signal g2a_n : STD_LOGIC := '0';
    Signal g2b_n : STD_LOGIC := '0';

begin
	DUT:  decoder_74138_dataflow PORT MAP (
			g1 => g1,
			g2a_n => g2a_n,
			g2b_n => g2b_n,
			x => x,
			y => y
		 );
		 
	process
		variable k : integer := 0;

	begin
		
		x <= "000"; g1 <= '0'; g2a_n <= '1'; g2b_n <= '1';
        for k in 0 to 7 loop         

		  wait for 5 ns;
		  x <= count;
		  
		  wait for 10 ns;
        end loop;		 

		x <= "000"; g1 <= '1'; g2a_n <= '0'; g2b_n <= '1';
        for k in 0 to 7 loop         

		  wait for 5 ns;
		  x <= count;
		  
		  wait for 10 ns;
        end loop;	
		
		x <= "000"; g1 <= '0'; g2a_n <= '1'; g2b_n <= '0';
        for k in 0 to 7 loop         

		  wait for 5 ns;
		  x <= count;
		  
		  wait for 10 ns;
        end loop;	
		
		x <= "000"; g1 <= '1'; g2a_n <= '0'; g2b_n <= '0';
        for k in 0 to 7 loop         

		  wait for 5 ns;
		  x <= count;
		  
		  wait for 10 ns;
		  count <= count + '1';
        end loop;	
		
		wait;
	end process;
end behavior;