----------------------------------------------------------------------------------
-- Company: Universidad de Antioquia
-- email: john.buitrago@udea.edu.co
-- 
-- Create Date:     
-- Design Name: 
-- Module Name: Test VGACounter
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Este test prueba el funcionamiento del VGACounter
--
-- Dependencies: VGACounter
--			
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
-- https://learn.digilentinc.com/Documents/269
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

-- Agregar librerias necesarias
use ieee.std_logic_textio.all;

library STD;
use STD.textio.all;


--Library UNISIM;
--use UNISIM.vcomponents.all;

entity VGACounter_tb is
end VGACounter_tb;

architecture Behavioral of VGACounter_tb is

	component VGACounter is
		Port ( CLK : in  STD_LOGIC;
			   RST : in  STD_LOGIC;
			   PBTON : in  STD_LOGIC;
			   HS : out  STD_LOGIC;
			   VS : out  STD_LOGIC;
			   RGB : out  STD_LOGIC_VECTOR (11 downto 0)
		 );
	end component;

	-- Señales
	signal CLK: STD_LOGIC := '0';
	signal RST: STD_LOGIC := '0'; 
	signal PBTON: STD_LOGIC:= '0'; 
	signal RGB: STD_LOGIC_VECTOR (11 downto 0); 
	signal HS: STD_LOGIC; 
	signal VS: STD_LOGIC; 
	signal clk_50MHz: STD_LOGIC := '0'; 
    signal pixel_clk: STD_LOGIC := '0'; 



begin

	-- Instanciacion componente vga_ctrl_640x480_60Hz
	DUT: VGACounter 
	PORT MAP(
		CLK => clk_50MHz,
		RST  => RST,
		PBTON => PBTON,		
		HS => HS,
		VS => VS,	
		RGB => RGB	
	);

	-- generador de reloj de 50 MHZ (20 ns de periodo)
	clk_stimulus: process
	begin
		clk_50MHz <= '0';
		wait for 10 ns;
		clk_50MHz <= '1';
		wait for 10 ns;
	end process;

	rst_stimulus: process
	begin
		RST <= '1';
		wait for 3 ns;
		RST <= '0';
		wait;
	end process;


	ptbon_stimulus: process
	begin
		PBTON <= '0'; 
		wait for 7 ns;
		PBTON <= '1'; -- Para iniciar el conteo
		wait;
	end process;

	-- Generador de reloj de 25 MHZ (para ver la simulación)
	pixel_clk_stimulus: process(clk_50MHz)
	begin
		if (clk_50MHz'event and clk_50MHz = '1') then
			pixel_clk <= NOT pixel_clk;
		end if;
	end process;
   
	-- proceso que escribe en el archivo siguiendo el siguiente formato:
	--
	-- current_sim_time time_units: hs vs red green blue (ex. 535 ns: 1 1 010 010 01)
	process (pixel_clk)
	
	file file_pointer: text open WRITE_MODE is "VGACounter_tb.txt";
	variable line_el: line;
		
	begin

		if rising_edge(pixel_clk) then

			-- Write the time
			write(line_el, now); -- write the line.
			write(line_el, string'(":")); -- write the line.

			-- Write the hsync
			write(line_el, string'(" "));
			write(line_el, HS); -- write the line.

			-- Write the vsync
			write(line_el, string'(" "));
			write(line_el, VS); -- write the line.

			-- Write the red
			write(line_el, string'(" "));
			write(line_el, RGB(11 downto 8)); -- write the line (Red color).

			-- Write the green
			write(line_el, string'(" "));
			write(line_el, RGB(7 downto 4)); -- write the line (Green color).

        	-- Write the blue
        	write(line_el, string'(" "));
        	write(line_el, RGB(3 downto 0)); -- write the line (Blue color).

    	    writeline(file_pointer, line_el); -- write the contents into the file.

    	end if;
	end process;			   
	
end Behavioral;


