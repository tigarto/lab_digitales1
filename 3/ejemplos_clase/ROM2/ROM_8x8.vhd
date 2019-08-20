--------------------------------------------
-- Module Name: rom
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

-- library UNISIM;
-- use UNISIM.VComponents.all;

entity ROM_8x8 is 
port (
	ROM_addr : in std_logic_vector(2 downto 0);
	ROM_data : out std_logic_vector(7 downto 0)
);
end entity ROM_8x8;

architecture behavioral of ROM_8x8 is
	type rom is array (0 to 2**3 - 1) of std_logic_vector (7 downto 0);
	constant MY_ROM : rom := (
		0 => X"00",
		1 => X"11",
		2 => X"F2",
		3 => X"C3",
		4 => X"A4",
		5 => X"95",
		6 => X"86",
		7 => X"E7"
);

begin
	process (ROM_addr)
	begin
		case ROM_addr is
			when "000" => ROM_data <= MY_ROM(0);
			when "001" => ROM_data <= MY_ROM(1);
			when "010" => ROM_data <= MY_ROM(2);
			when "011" => ROM_data <= MY_ROM(3);
			when "100" => ROM_data <= MY_ROM(4);
			when "101" => ROM_data <= MY_ROM(5);
			when "110" => ROM_data <= MY_ROM(6);
			when "111" => ROM_data <= MY_ROM(7);
			when others => ROM_data <= X"00";
		end case;
	end process;
end behavioral;