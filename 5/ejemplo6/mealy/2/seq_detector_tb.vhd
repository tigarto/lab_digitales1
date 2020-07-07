library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity seq_detector_tb is
end seq_detector_tb;

architecture behavioral of seq_detector_tb is

    -- declaraciones modelo FSM

    signal Clock, Reset, w, z: STD_LOGIC;   

    component seq_detector is
      Port ( Clock : in STD_LOGIC;
             Reset : in STD_LOGIC;
             w : in STD_LOGIC;
             z : out STD_LOGIC);
    end component;

begin

  DUT: seq_detector
	Port map (
    Clock => Clock,
    Reset => Reset,
    w => w,
    z => z
  );
  
  Clock_stimulus: process
  begin
    Clock <= '0';
    wait for 10 ns;
    Clock <= '1';
    wait for 10 ns;
  end process;

  Reset_stimulus: process
  begin
    Reset <= '1';
    wait for 20 ns;     -- 20 ns
    Reset <= '0';
    wait;  
  end  process;

  Press_stimulus: process
  begin
    w <= '0';
    wait for 32 ns;     -- 32 ns    
    w <= '1';
    wait for 20 ns;     -- 52 ns    
    w <= '0';
    wait for 20 ns;     -- 72 ns    
    w <= '1';
    wait for 40 ns;     -- 112 ns    
    w <= '0';
    wait for 20 ns;     -- 132 ns    
    w <= '1';
    wait for 60 ns;     -- 192 ns  
    w <= '0';
    wait for 20 ns;     -- 212 ns   
    w <= '1';
    wait;
  end process;
   
end architecture;