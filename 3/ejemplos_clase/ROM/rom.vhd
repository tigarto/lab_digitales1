--------------------------------------------
-- Module Name: rom
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity rom Is
generic(
		bits : integer := 8;     -- # of bits per word 
		words: integer := 8    -- # of words in the memory
       );
port(
		addr: in integer range 0 to words-1;
		data: out std_logic_vector(bits-1 downto 0)
	);
end rom;

Architecture behavior of rom is
	type vector_array is array (0 to words-1) of std_logic_vector (bits-1 downto 0);

	CONSTANT memory: vector_array := ( 
		"00000000",
		"00000010",
		"00000100",
		"00001000", 
		"00010000",
		"00100000",
		"01000000",
		"10000000");	
begin
	data <= memory(addr);
end behavior;