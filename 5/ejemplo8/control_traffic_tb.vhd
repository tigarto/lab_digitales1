library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity control_traffic_tb is
end control_traffic_tb;

architecture behavioral of control_traffic_tb is

    -- declaraciones modelo FSM

    signal CLK, Reset, TA, TB: STD_LOGIC;
    signal LA, LB: STD_LOGIC_VECTOR(1 downto 0);   
    
    component control_traffic is
      Port ( CLK : in STD_LOGIC;
             Reset : in STD_LOGIC;
             TA : in STD_LOGIC;
             TB : in STD_LOGIC;
             LA : out STD_LOGIC_VECTOR (1 downto 0);
             LB : out STD_LOGIC_VECTOR (1 downto 0));
    end component;

begin

  DUT: control_traffic
	Port map (
    CLK => CLK,
    Reset => Reset,
    TA => TA,
    TB => TB,
    LA => LA,
    LB => LB
  );
  
  Clock_stimulus: process
  begin
    CLK <= '1';
    wait for 2.5 ns;
    CLK <= '0';
    wait for 2.5 ns;
  end process;

  Reset_stimulus: process
  begin
    Reset <= '0';
    wait for 2.5 ns;     -- 5 ns
    Reset <= '1';
    wait for 5 ns;     -- 7.5 ns
    Reset <= '0';
    wait; 
  end  process;

  Press_stimulus: process
  begin
    TA <= '1';
    TB <= '0';
    wait for 11 ns;     -- 11 ns    
    TB <= '1';
    wait for 6 ns;      -- 17 ns    
    TA <= '0';
    wait for 14 ns;     -- 31 ns    
    TA <= '1';
    TB <= '0';
    wait for 15 ns;     -- 46 ns    
    TA <= '0';
    wait;
  end process;
   
end architecture;