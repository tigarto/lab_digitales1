library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity seven_seg_decoder_tb is
end entity seven_seg_decoder_tb;

architecture RTL of seven_seg_decoder_tb is
	component seven_seg_decoder
		port(
			data     : in  STD_LOGIC_VECTOR(3 downto 0);
			segments : out STD_LOGIC_VECTOR(6 downto 0)
		);
	end component seven_seg_decoder;
	
	signal data : std_logic_vector(3 downto 0) := "0000";
	signal segments : std_logic_vector(6 downto 0);
	
	constant T : time := 10 ns;
	
begin
	
	DUT: seven_seg_decoder
		port map(
			data     => data,
			segments => segments
		);
		
	stimulus : process is
	begin
		for i in 0 to 15 loop
			data <= data + '1';
            wait for T;
		end loop;
		wait;
	end process stimulus;
	
end architecture RTL;
