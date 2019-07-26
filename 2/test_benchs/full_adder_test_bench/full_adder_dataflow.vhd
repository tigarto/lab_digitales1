--------------------------------------------
-- Module Name: full_adder_dataflow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity full_adder Is
port (
		x : in STD_LOGIC;
		y : in STD_LOGIC;
		cin : in STD_LOGIC;
        s : out STD_LOGIC;
        cout: out STD_LOGIC
	);
end full_adder;

Architecture behavior of full_adder Is

Signal x_y_cin : STD_LOGIC_VECTOR(2 downto 0);

begin        
		x_y_cin <= x & y & cin;

		--- ---------------------------
        --- TABLA DE VERDAD FULL_ADDER
		--- ---------------------------
		--- | x | y | cin || s | cout |
		--- ---------------------------
		--- | 0 | 0 |  0  || 0 |  0   |
		--- | 0 | 0 |  1  || 1 |  0   |
		--- | 0 | 1 |  0  || 1 |  0   |
		--- | 0 | 1 |  1  || 0 |  1   |
		--- | 1 | 0 |  0  || 1 |  0   |
		--- | 1 | 0 |  1  || 0 |  1   |
		--- | 1 | 1 |  0  || 0 |  1   |
		--- | 1 | 1 |  1  || 1 |  1   |
		--- ---------------------------


		-- Casos usando Selective Signal Assignment

		-- with chooser_expression select
        --   target <= expression when choices,
        --   ...
        --   expression when choices;

        with x_y_cin select
          s <= '1' when "001",
               '1' when "010",
               '1' when "100",
               '1' when "111",
               '0' when others;
        
        with x_y_cin select
          cout <= '1' when "011",
                  '1' when "101",
                  '1' when "110",
                  '1' when "111",
                  '0' when others;

end behavior;