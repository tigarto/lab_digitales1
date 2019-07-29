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
	variable s : line; 
	variable suma_integer : integer;
	variable suma_unsigned : unsigned (3 downto 0);
	variable errors : boolean := false;


	begin
		for i in 0 to 15 loop
			for j in i to 15 loop
				for k in 0 to 1 loop
					a_sig <= std_logic_vector(to_unsigned(i,4));
					b_sig <= std_logic_vector(to_unsigned(i,4));
					if k = 1 then
						cin_sig <= '1';
					else
						cin_sig <= '0';												
					end if;
					wait for 20 ns;
					suma_unsigned := to_unsigned(i + j + k, 4);
					suma_integer := i + j + k;
					write(s, string'("a: ")); write(s, i);
					write(s, string'("; b: ")); write(s, j);
					write(s, string'("; cin: ")); write(s, k);
					writeline(output,s);
					-- Carry check
					if cout_sig = std_logic(suma_unsigned(3)) then
						write(s, string'("Carry Ok"));
						writeline(output,s);
					else
						write(s, string'("Error de Carry. Se esperaba "));
						write(s, k);
						writeline(output,s);
						errors := true;
					end if;
					-- Sum check
					if std_logic_vector(suma_unsigned((3) downto 0)) = s_sig then
						write(s, string'("Suma Ok"));
						writeline(output,s);
					else
						write(s, string'("Error de Suma. Se esperaba "));
						write(s, suma_integer);
						writeline(output,s);
						errors := true;
					end if;
					--if errors then exit; end if;
				end loop;
				--if errors then exit; end if;
		end loop;    
		--if errors then exit; end if;
	end loop;
	wait;
	end process;
end behavior;