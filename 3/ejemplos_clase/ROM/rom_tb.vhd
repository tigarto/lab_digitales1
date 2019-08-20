--------------------------------------------
-- Module Name: decoder_3to8_dataflow_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use STD.textio.all; --for line
use IEEE.std_logic_textio.all; --for write

-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity rom_tb Is
end rom_tb;

Architecture behavior of rom_tb Is

	CONSTANT WORDS     : integer := 8;
	CONSTANT DATA_SIZE : integer := 8;
	CONSTANT DELAY     : time := 10 ns;
	
	Signal addr_s	 : integer range 0 to WORDS -1;
	Signal data_s    : std_logic_vector(DATA_SIZE-1 downto 0);
	
	Component rom Is
	generic(
			bits : integer := DATA_SIZE;
			words: integer := WORDS
		   );
	port(
			addr: in integer range 0 to WORDS-1;
			data: out std_logic_vector(DATA_SIZE -1 downto 0)
		);
	end Component;

	
	procedure expected_data (
		proc_addr : in integer range 0 to WORDS-1;
		proc_data : out std_logic_vector(DATA_SIZE -1 downto 0)) is

	type vector_array is array (0 to WORDS - 1) of std_logic_vector (DATA_SIZE-1 downto 0);

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
		proc_data := memory(proc_addr);
	end expected_data;


begin

	

	DUT: rom 
	generic map ( 
	  bits => DATA_SIZE,
	  words => WORDS
	)
	port map (
	  addr => addr_s,
	  data => data_s
	);


	Estim: process
    begin
        wait for DELAY;
        for i in 0 to WORDS - 1 loop
            addr_s <= i;
            wait for DELAY;   
		end loop;
		wait; -- Veer despues
	end process;

	Verific: process(addr_s)
	variable proc_data : std_logic_vector(DATA_SIZE -1 downto 0);
	variable s : line;
	begin
		
	end process; 

	  

end behavior;