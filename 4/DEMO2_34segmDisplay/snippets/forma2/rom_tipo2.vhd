--------------------------------------------
-- Module Name: rom
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity rom Is
generic(
		bitsPerData : integer := 12;     -- # of bits per word 
		rows: integer := 8;              -- # of words in the memory
		columns: integer := 5            -- # of columns
       );
port(
		row: in integer range 0 to rows - 1;
		column: in integer range 0 to columns - 1;
		data: out std_logic_vector(bitsPerData - 1 downto 0)
	);
end rom;

Architecture behavior of rom is

	type memory_segment is array (0 to columns - 1) of std_logic_vector (bitsPerData - 1 downto 0);
	type vector_array is array (0 to rows - 1) of memory_segment;

	CONSTANT memory: vector_array := ( 
		(X"FFF",X"FFF",X"0F0",X"FFF",X"FFF"),
		(X"FFF",X"0F0",X"0F0",X"0F0",X"FFF"),
		(X"0F0",X"0F0",X"0F0",X"0F0",X"0F0"),
		(X"FFF",X"0F0",X"0F0",X"0FF",X"FFF"),
		(X"FFF",X"0F0",X"0F0",X"0F0",X"FFF"),
		(X"FFF",X"0F0",X"0F0",X"0F0",X"FFF"),
		(X"FFF",X"0F0",X"0F0",X"0F0",X"FFF"),
		(X"FFF",X"0F0",X"0F0",X"0F0",X"FFF"));
	
	signal rowData: std_logic_vector(bitsPerData*columns - 1 downto 0); 
begin
	data <= memory(row)(column);
end behavior;