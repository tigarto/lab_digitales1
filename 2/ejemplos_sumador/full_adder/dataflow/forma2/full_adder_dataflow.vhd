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


		-- Casos usando la asignacion condicional

		-- target <= expression when condition else
		--           ... 
		--           expression when condition else
        --           expression;

		s <= '1' when x_y_cin = "001" else
		     '1' when x_y_cin = "010" else
		     '1' when x_y_cin = "100" else
		     '1' when x_y_cin = "111" else
		     '0';


		cout <= '1' when (x = '0' and y = '1' and cin = '1') else
		        '1' when (x = '1' and y = '0' and cin = '1') else
		        '1' when (x = '1' and y = '1' and cin = '0') else
		        '1' when (x = '1' and y = '1' and cin = '1') else
		        '0';

end behavior;
