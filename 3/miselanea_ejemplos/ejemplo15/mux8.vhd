library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

entity mux8 is
	port(d : in  STD_LOGIC_VECTOR(7 downto 0);
	     s : in  STD_LOGIC_VECTOR(2 downto 0);
	     y : out STD_LOGIC);
end;

architecture synth of mux8 is
begin
	y <= d(TO_INTEGER(s));
end;
