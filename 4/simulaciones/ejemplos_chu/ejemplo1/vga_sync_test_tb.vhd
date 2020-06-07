----------------------------------------------------------------------------------
-- Company: Instituto Tecnólogico Metropolitano
-- Engineer: Ricardo Andrés Velásquez Vélez
-- 
-- Create Date:    09:49:23 05/12/2014 
-- Design Name: 
-- Module Name:    Simple_Test_VGA - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Este módulo verifica el correcto funcionamiento del modulo de control
--              VGA de un monitor o pantalla de computador. El test dibuja un cuadro
--              en el centro de la pantalla  y los switches en la board Digilent permiten
--			    seleccionar el color del cuadro del centro. El color del fondo es el 
--              inverso del cuadro.
--
-- Dependencies: vga_ctrl_640x480_60Hz
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--


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

entity vga_sync_test_tb is
end vga_sync_test_tb;

architecture Behavioral of vga_sync_test_tb is

--componets
component vga_test is
	port (
		   clk, reset: in std_logic;
		   sw: in std_logic_vector(2 downto 0);
		   hsync, vsync: out std_logic;
		   rgb: out std_logic_vector(2 downto 0)
		);
end component;

-- Declaracion segnales
signal clk_50MHz: std_logic;
signal reset: std_logic := '0';
signal sw: std_logic_vector(2 downto 0);
signal hsync: std_logic;
signal vsync: std_logic;
signal rgb: std_logic_vector(2 downto 0);
signal clk_25MHz: std_logic := '0';
signal red: std_logic_vector(3 downto 0);
signal blue: std_logic_vector(3 downto 0);
signal green: std_logic_vector(3 downto 0);
signal output_color: std_logic_vector(11 downto 0);

-- Hacer un vector con las señales de test (Constante)

	
begin

	-- Instanciacion componente vga_ctrl_640x480_60Hz
	DUT_VGA: vga_test 
	PORT MAP(
		reset => reset,
		clk => clk_50MHz,
		sw => sw,
		hsync => hsync,
		vsync => vsync,
		rgb => rgb
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
		reset <= '1';
		wait for 2 ns;
		reset <= '0';
		wait;
	end process;

    -- NOTA: hacer esto con un event que dependa del sincronismo vertical (creo que hay si puede que de): Contador
	--sw_stimulus: process
	--begin
	--	sw <= "100";
	--	wait for 16.667 ms;
	--	sw <= "010";
	--	wait for 16.667 ms;
	--	sw <= "001";
	--	wait for 16.667 ms;
	--	sw <= "110";
	--	wait;
	--end process;
    sw_stimulus: process(vsync):
        variable cnt:std_logic_vector(2 downto 0) := 0;
    begin
        if rising_edge(vsync) then
        

    
    end process;
        

	


    pixel_clk_stimulus: process(clk_50MHz)
	begin
		if (clk_50MHz'event and clk_50MHz = '1') then
			clk_25MHz <= NOT clk_25MHz;
		end if;
	end process;

	-- señales completas
	
	-- proceso que escribe en el archivo siguiendo el siguiente formato:
	red <= rgb(2) & rgb(2) & rgb(2) & rgb(2);
	green <= rgb(1) & rgb(1) & rgb(1) & rgb(1);
	blue <= rgb(0) & rgb(0) & rgb(0) & rgb(0);
    output_color <= red & green & blue;
	-- current_sim_time time_units: hs vs red green blue (ex. 535 ns: 1 1 010 010 01)
	process (clk_25MHz)
	
	file file_pointer: text open WRITE_MODE is "vga_sync_test_tb.txt";
	variable line_el: line;
		
	begin

		if rising_edge(clk_25MHz) then

			-- Write the time
			write(line_el, now); -- write the line.
			write(line_el, string'(":")); -- write the line.

			-- Write the hsync
			write(line_el, string'(" "));
			write(line_el, hsync); -- write the line.

			-- Write the vsync
			write(line_el, string'(" "));
			write(line_el, vsync); -- write the line.

			-- Write the red
			write(line_el, string'(" "));
			write(line_el, OUTPUT_COLOR(11 downto 8)); -- write the line (Red color).
			--write(line_el, red); -- write the line (Red color).

			-- Write the green
			write(line_el, string'(" "));
			write(line_el, OUTPUT_COLOR(7 downto 4)); -- write the line (Green color).
			--write(line_el, green); -- write the line (Green color).


        	-- Write the blue
        	write(line_el, string'(" "));
			write(line_el, OUTPUT_COLOR(3 downto 0)); -- write the line (Blue color).
			--write(line_el, blue); -- write the line (Blue color).

    	    writeline(file_pointer, line_el); -- write the contents into the file.

    	end if;
	end process;

	
   

	
	
end Behavioral;


