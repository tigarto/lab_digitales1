--------------------------------------------
-- Module Name: comparador
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity comparador Is
generic(
		bits : integer := 8     -- # of bits 
       );
port(
		A: in std_logic_vector(bits-1 downto 0);
		B: in std_logic_vector(bits-1 downto 0);
		A_gt_B: out std_logic;
		A_lt_B: out std_logic;
		A_eq_B: out std_logic
	);
end comparador;

Architecture behavior of comparador is	
begin

process(A,B)
begin
	if A > B then
		A_gt_B <= '1';
		A_lt_B <= '0';
		A_eq_B <= '0';
	elsif A < B then
		A_gt_B <= '0';
		A_lt_B <= '1';
		A_eq_B <= '0';
	else
		A_gt_B <= '0';
		A_lt_B <= '0';
		A_eq_B <= '1';
	end if;
end process;
end behavior;