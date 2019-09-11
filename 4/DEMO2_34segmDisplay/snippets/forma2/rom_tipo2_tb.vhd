--------------------------------------------
-- Module Name: rom_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity rom_tipo2_tb Is
end rom_tipo2_tb;

Architecture behavior of rom_tipo2_tb Is


	CONSTANT BITS_PER_DATA : integer := 12;
	CONSTANT ROWS : integer := 8;
	CONSTANT COLUMNS : integer := 5;
	
	
	CONSTANT DELAY     : time := 10 ns;
	
	Signal row_s       : integer range 0 to ROWS - 1;
	Signal column_s    : integer range 0 to COLUMNS - 1;
	Signal data_s      : std_logic_vector(BITS_PER_DATA - 1 downto 0);
	    
    Component rom Is
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
    end Component;

begin

	DUT: rom 
	generic map ( 
	  bitsPerData => BITS_PER_DATA,
	  rows => ROWS,
	  columns => COLUMNS
	)
	port map (
	  row => row_s,
	  column => column_s,
	  data => data_s
	);

	Estim: process
    begin
		--wait for DELAY;	
		for i in 0 to ROWS - 1 loop
			for j in 0 to COLUMNS - 1 loop
				row_s <= i;
				column_s <= j;
            	wait for DELAY;   
			end loop;
		end loop;
		wait;
	end process Estim;

end behavior;