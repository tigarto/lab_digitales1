----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 11:40:33 AM
-- Design Name: 
-- Module Name: tb_bin2gray - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use STD.textio.all; --for line
use IEEE.std_logic_textio.all; --for write

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_bin2gray is
  generic(
  tb_type : string := "Behavioral"
);
--  Port ( );
end tb_bin2gray;

architecture Behavioral of tb_bin2gray is

CONSTANT BIN2GRAY_WIDTH : integer := 4;
CONSTANT DELAY : time := 10 ns;

component bin2gray_nbits is
    Generic (N : Integer := BIN2GRAY_WIDTH);
    Port ( BIN : in STD_LOGIC_VECTOR (N-1 downto 0);
           GRAY : out STD_LOGIC_VECTOR (N-1 downto 0));
end component;

procedure expected_Gray (
		proc_BIN : in std_logic_vector(BIN2GRAY_WIDTH-1 downto 0);
		proc_GRAY : out std_logic_vector(BIN2GRAY_WIDTH-1 downto 0)) is
	begin	
	  for i in 0 to BIN2GRAY_WIDTH-2 loop
           proc_GRAY(i):= proc_BIN(i) xor proc_BIN(i+1);
      end loop;
      proc_GRAY(BIN2GRAY_WIDTH-1) := proc_BIN(BIN2GRAY_WIDTH-1);
end expected_Gray;	    
	
signal sig_BIN, sig_GRAY : STD_LOGIC_VECTOR (BIN2GRAY_WIDTH-1 downto 0):=(others=>'0');
signal sig_BIN2 : STD_LOGIC_VECTOR(BIN2GRAY_WIDTH-1 downto 0);
           
begin


Estim: process
    begin
        wait for DELAY;
        for i in 0 to (2**BIN2GRAY_WIDTH)-1 loop
            sig_BIN <= std_logic_vector(to_unsigned(i, sig_BIN'length));
            wait for DELAY;   
        end loop;
end process;

DUT1: bin2gray_nbits
     generic map (N => BIN2GRAY_WIDTH)
     port map (
        BIN => sig_BIN,
        GRAY => sig_GRAY
     );
     
sig_BIN2 <= sig_BIN; 
     
Verific: process(sig_BIN2)
    variable proc_out : STD_LOGIC_VECTOR(BIN2GRAY_WIDTH-1 downto 0);
    variable s : line;
    begin
        expected_GRAY(sig_BIN, proc_out);
        -- If the outputs match, then announce it to the simulator console.
        if ( proc_out = sig_GRAY) then
            write (s, string'("+++GRAY output MATCHED at ")); write (s, sig_BIN); 
            write (s, string'(". Expected: ")); write (s, proc_out); 
            write (s, string'(" Implemented: ")); write (s, sig_GRAY); 
            writeline (output, s);
        else
            write (s, string'("***GRAY output mis-matched at ")); write (s, sig_BIN); 
            write (s, string'(". Expected: ")); write (s, proc_out); 
            write (s, string'(" Implemented: ")); write (s, sig_GRAY); 
            writeline (output, s);
        end if;
end process;   

end Behavioral;
