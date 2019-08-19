--------------------------------------------
-- Module Name: decoder_3to8_dataflow_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

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

end behavior;