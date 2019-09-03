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
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;

entity Simple_Test_VGA is
    Port ( CLK : in  STD_LOGIC; -- Clk a 50MHz
           RST : in  STD_LOGIC; -- reset
		   COLOR : in STD_LOGIC_VECTOR (11 downto 0); -- Color proveniente de los switches
           RGB : out  STD_LOGIC_VECTOR (11 downto 0); -- Color de salida a la pantalla
           HS : out  STD_LOGIC; -- Se�al de sincronizacion horizontal
           VS : out  STD_LOGIC); -- Se�al de sincronizacion vertical
end Simple_Test_VGA;

architecture Behavioral of Simple_Test_VGA is

-- Declaracion segnales

	signal HCOUNT: STD_LOGIC_VECTOR (10 downto 0);
	signal VCOUNT: STD_LOGIC_VECTOR (10 downto 0);
	signal INT_RGB : STD_LOGIC_VECTOR (11 downto 0);
	signal clk_interno : STD_LOGIC;

-- Declaracion de componente vga_ctrl_640x480_60Hz
	COMPONENT vga_ctrl_640x480_60Hz
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		rgb_in : IN std_logic_vector(11 downto 0);          
		HS : OUT std_logic;
		VS : OUT std_logic;
		hcount : OUT std_logic_vector(10 downto 0);
		vcount : OUT std_logic_vector(10 downto 0);
		rgb_out : OUT std_logic_vector(11 downto 0);
		blank : OUT std_logic
		);
	END COMPONENT;
	
begin

    -- Instanciacion componente vga_ctrl_640x480_60Hz
	VGA: vga_ctrl_640x480_60Hz 
	PORT MAP(
		rst => RST,
		clk => clk_interno,
		rgb_in => INT_RGB,
		HS => HS,
		VS => VS,
		hcount => HCOUNT,
		vcount => VCOUNT,
		rgb_out => RGB,
		blank => open
	);


    -- generador de reloj de 50 MHZ
    process (clk)
	begin  
		if (clk'event and clk = '1') then
			clk_interno <= NOT clk_interno;
		end if;
	end process;


	-- Dibuja el cuadro y asigna colores
   INT_RGB <= COLOR when ( (VCOUNT>=150) AND (VCOUNT<=330) AND (HCOUNT>=230) AND (HCOUNT<=410)) else
			     not COLOR;


end Behavioral;


