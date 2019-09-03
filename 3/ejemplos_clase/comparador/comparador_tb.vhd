--------------------------------------------
-- Module Name: rom_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use STD.textio.all; --for line
use IEEE.std_logic_textio.all; --for write
use ieee.numeric_std.all;


-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity comparador_tb Is
end comparador_tb;

Architecture behavior of comparador_tb Is

	CONSTANT NUM_BITS : integer := 8;
	CONSTANT DELAY     : time := 10 ns;
	
	Signal A_s        : std_logic_vector(NUM_BITS-1 downto 0);
	Signal B_s        : std_logic_vector(NUM_BITS-1 downto 0);
	Signal A_eq_B_s   : std_logic;
	Signal A_gt_B_s   : std_logic;
	Signal A_lt_B_s   : std_logic;
	
	-- 
	Signal A_s2        : std_logic_vector(NUM_BITS-1 downto 0);
	Signal B_s2       : std_logic_vector(NUM_BITS-1 downto 0);
	
	Component comparador Is
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
	end Component;
	
	procedure expected_data (
		A_proc: in std_logic_vector(NUM_BITS-1 downto 0);
		B_proc: in std_logic_vector(NUM_BITS-1 downto 0);
		A_gt_B_proc: out std_logic;
		A_lt_B_proc: out std_logic;
		A_eq_B_proc: out std_logic) is
	begin	
		if A_proc > B_proc then
			A_gt_B_proc := '1';
			A_lt_B_proc := '0';
			A_eq_B_proc := '0';
		elsif A_proc < B_proc then
			A_gt_B_proc := '0';
			A_lt_B_proc := '1';
			A_eq_B_proc := '0';
		else
			A_gt_B_proc := '0';
			A_lt_B_proc := '0';
			A_eq_B_proc := '1';
		end if;
	end expected_data;

begin

	DUT: comparador
	generic map ( 
	  bits => NUM_BITS
	)
	port map (
	  A => A_s,
	  B => B_s,
	  A_gt_B => A_gt_B_s,
	  A_lt_B => A_lt_B_s,
	  A_eq_B => A_eq_B_s
	);


	Estim: process
	begin
		A_s <= X"00"; B_s <= X"00"; 
		wait for DELAY;	
		A_s <= X"01"; B_s <= X"00"; 
		wait for DELAY;	
		A_s <= X"00"; B_s <= X"01"; 
		wait for DELAY;	
		wait;
	end process Estim;
	
	A_s2 <= A_s;
	B_s2 <= B_s;
	
	Verific: process(A_s2, B_s2)

	variable A_eq_B_esperada, A_gt_B_esperada, A_lt_B_esperada: std_logic;
	variable s : line;
	begin
		expected_data(A_s,B_s,A_gt_B_esperada, A_lt_B_esperada, A_eq_B_esperada);
		write (s, string'("COMPARE(")); write (s, A_s); write (s, string'(", ")); write (s, B_s); write (s, string'(")"));
		writeline (output, s);
		if ( A_gt_B_s = A_gt_B_esperada and A_lt_B_s = A_lt_B_esperada and A_eq_B_s = A_eq_B_esperada) then
			write (s, string'("OK ->"));
			writeline (output, s);
			write (s, string'("Simulada: "));
			write (s, string'("A_gt_B|A_lt_B|A_eq_B = ")); write (s, A_gt_B_s); write (s, A_lt_B_s); write (s, A_eq_B_s);
			writeline (output, s);
			write (s, string'("Esperada: "));
			write (s, string'("A_gt_B|A_lt_B|A_eq_B = ")); write (s, A_gt_B_esperada); write (s, A_lt_B_esperada); write (s, A_eq_B_esperada);
		else
		    write (s, string'("No OK ->"));
		    writeline (output, s);
		    write (s, string'("Simulada: "));
		    write (s, string'("A_gt_B|A_lt_B|A_eq_B = ")); write (s, A_gt_B_s); write (s, A_lt_B_s); write (s, A_eq_B_s);
			writeline (output, s);
			write (s, string'("Esperada: "));
		    write (s, string'("A_gt_B|A_lt_B|A_eq_B = ")); write (s, A_gt_B_esperada); write (s, A_lt_B_esperada); write (s, A_eq_B_esperada);
		end if;
		writeline (output, s);
		writeline (output, s);

	end process Verific;


end behavior;