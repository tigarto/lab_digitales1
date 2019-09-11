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
	type vector_array is array (0 to rows - 1) of std_logic_vector (bitsPerData*columns -1 downto 0);

	CONSTANT memory: vector_array := ( 
		X"FFFFFF0F0FFFFFF",
		X"FFF0F00F00F0FFF",
		X"0F00F00F00F00F0",
		X"FFF0F00F00F0FFF", 
		X"FFF0F00F00F0FFF",
		X"FFF0F00F00F0FFF",
		X"FFF0F00F00F0FFF",
		X"FFF0F00F00F0FFF");
	
	signal rowData: std_logic_vector(bitsPerData*columns - 1 downto 0); 
begin
	rowData <= memory(row);
	data <= rowData(((columns - column)*bitsPerData) - 1  downto ((columns - 1) - column)*bitsPerData);
end behavior;