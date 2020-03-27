library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gates is
	port(
		a, b: in STD_LOGIC_VECTOR(3 downto 0);
		y1, y2, y3, y4, y5: out STD_LOGIC_VECTOR(3 downto 0)
	);
end entity gates;

architecture synth of gates is
	
begin
  --five different two-input logic gates
  --acting on 4-bit busses
  y1 <= a and b;
  y2 <= a or b;
  y3 <= a xor b;
  y4 <= a nand b;
  y5 <= a nor b;
end architecture synth;
