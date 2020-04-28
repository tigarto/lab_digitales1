LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY clk200Hz_tb IS
END clk200Hz_tb;

ARCHITECTURE behavior OF clk200Hz_tb IS 
	COMPONENT clk200Hz
	PORT(
		clk_in : IN  std_logic;
		reset  : IN  std_logic;
		clk_out: OUT std_logic
	);
	END COMPONENT;

	-- Inputs
	signal clk_in  : std_logic := '0';
	signal reset   : std_logic := '0';
	-- Outputs
	signal clk_out : std_logic;
	constant clk_in_t : time := 20 ns; 
BEGIN 
	-- Instance of unit under test.
	uut: clk200Hz PORT MAP (
		clk_in  => clk_in,
		reset   => reset,
		clk_out => clk_out
	);

	-- Clock definition.
	entrada_process :process
		begin
		clk_in <= '0';
		wait for clk_in_t / 2;
		clk_in <= '1';
		wait for clk_in_t / 2;
	end process;

	-- Processing.
	stimuli: process
	begin
		reset <= '1'; -- Initial conditions.
		wait for 100 ns;
		reset <= '0'; -- Down to work!
        wait;
	end process;
END;