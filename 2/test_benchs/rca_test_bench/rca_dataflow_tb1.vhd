--------------------------------------------
-- Module Name: fulladder_dataflow_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;

Entity rca_dataflow_tb Is
end rca_dataflow_tb;

Architecture behavior of rca_dataflow_tb Is
	Component rca_dataflow Is
	port(
			a  	 : in STD_LOGIC_VECTOR (3 downto 0);
			b  	 : in STD_LOGIC_VECTOR (3 downto 0);
			cin  : in STD_LOGIC;
			s 	 : out STD_LOGIC_VECTOR (3 downto 0);
			cout : out STD_LOGIC
		);
	End Component;
	
	Signal a_sig 	: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	Signal b_sig 	: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	Signal cin_sig      : STD_LOGIC := '0';
	

	Signal s_sig	: STD_LOGIC_VECTOR (3 downto 0);
	Signal cout_sig : STD_LOGIC;
	
begin
	DUT:  rca_dataflow PORT MAP (
		a    => a_sig,
		b    => b_sig,
		cin  => cin_sig,
		s    => s_sig,
		cout => cout_sig
		 );
		 
	process

	begin
		wait for 10 ns;
		a_sig <= "0000";
		b_sig <= "0000";
		cin_sig <= '0';
		wait for 10 ns;
		a_sig <= "0000";
		b_sig <= "0000";
		cin_sig <= '1';
		wait for 10 ns;
		a_sig <= "0100";
		b_sig <= "0001";
		cin_sig <= '1';
		wait for 10 ns;
		a_sig <= "0100";
		b_sig <= "0111";
		cin_sig <= '1';
		wait for 10 ns;
		a_sig <= "1111";
		b_sig <= "0000";
		cin_sig <= '1';
		wait for 10 ns;
		a_sig <= "1111";
		b_sig <= "0001";
		cin_sig <= '1';
		wait for 10 ns;
		a_sig <= "1111";
		b_sig <= "1111";
		cin_sig <= '0';
		wait for 10 ns;
		a_sig <= "1000";
		b_sig <= "1000";
		cin_sig <= '0';
		wait for 10 ns;
		a_sig <= "1000";
		b_sig <= "1000";
		cin_sig <= '1';
	wait;
	end process;
end behavior;