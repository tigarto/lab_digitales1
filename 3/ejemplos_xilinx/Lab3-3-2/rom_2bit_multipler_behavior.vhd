--------------------------------------------
-- Module Name: rom_2bit_multipler_behavior
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity rom_2bit_multipler_behavior is port (
	a : in std_logic_vector(1 downto 0);
	b : in std_logic_vector(1 downto 0);
	product : out std_logic_vector(3 downto 0)
);
end entity rom_2bit_multipler_behavior;

architecture behavioral of rom_2bit_multipler_behavior is
type rom is array (0 to 2**4 - 1) of std_logic_vector (3 downto 0);

constant MY_ROM : rom := (
	0 => "0000",
	1 => "0000",
	2 => "0000",
	3 => "0000",
	4 => "0000",
	5 => "0001",
	6 => "0010",
	7 => "0011",
	8 => "0000",
	9 => "0010",
	10 => "0100",
	11 => "0110",
	12 => "0000",
	13 => "0011",
	14 => "0110",
	15 => "1001"
);

signal ROM_addr : STD_LOGIC_VECTOR(3 downto 0);
signal ROM_data : STD_LOGIC_VECTOR(3 downto 0);

begin
	ROM_addr <= a & b;
	
	product <= ROM_data;
	
	process (ROM_addr)
	begin
		case ROM_addr is
			when "0000" => ROM_data <= MY_ROM(0);
			when "0001" => ROM_data <= MY_ROM(1);
			when "0010"	=> ROM_data <= MY_ROM(2);
			when "0011" => ROM_data <= MY_ROM(3);
			when "0100" => ROM_data <= MY_ROM(4);
			when "0101" => ROM_data <= MY_ROM(5);
			when "0110" => ROM_data <= MY_ROM(6);
			when "0111" => ROM_data <= MY_ROM(7);
			when "1000" => ROM_data <= MY_ROM(8);
			when "1001" => ROM_data <= MY_ROM(9);
			when "1010" => ROM_data <= MY_ROM(10);
			when "1011" => ROM_data <= MY_ROM(11);
			when "1100" => ROM_data <= MY_ROM(12);
			when "1101" => ROM_data <= MY_ROM(13);
			when "1110" => ROM_data <= MY_ROM(14);
			when "1111" => ROM_data <= MY_ROM(15);
			when others => ROM_data <= "0000";
		end case;
	end process;
end behavioral;
