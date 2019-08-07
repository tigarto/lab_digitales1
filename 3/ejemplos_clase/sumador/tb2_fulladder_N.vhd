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

entity tb2_fulladder_N is
  generic(
  tb_type : string := "Behavioral"
);
--  Port ( );
end tb2_fulladder_N;

architecture Behavioral of tb2_fulladder_N is

CONSTANT FULLADDER_WIDTH : integer := 2;
CONSTANT DELAY : time := 10 ns;

component AdderNbits is
    generic(N : integer := FULLADDER_WIDTH);
    Port ( 
        A, B: in std_logic_vector(N-1 downto 0);
        Cin: in std_logic;
        S: out std_logic_vector(N-1 downto 0);
        Cout: out std_logic
    );
end component;

procedure expected_AdderNbits (
        proc_A : in std_logic_vector(FULLADDER_WIDTH - 1 downto 0); 
        proc_B : in std_logic_vector(FULLADDER_WIDTH - 1 downto 0); 
        proc_Cin : in std_logic; 
        proc_S : out std_logic_vector(FULLADDER_WIDTH - 1 downto 0); 
        proc_Cout : out std_logic) is
        variable proc_C: std_logic_vector(N downto 0);
        variable proc_X: std_logic_vector(N-1 downto 0);
    begin	
        proc_C(0) <= proc_Cin;
        for i in 0 to FULLADDER_WIDTH - 1 loop
            proc_X(i) := proc_A(i) xor proc_B(i);
            proc_S(i) := proc_C(i) xor proc_X(i);
            proc_C(i+1) := (proc_A(i) and proc_B(i)) or (proc_X(i) and proc_C(i));
        end loop;
        proc_Cout := proc_C(N);
end expected_AdderNbits;	    

-- Señales para el estimulo
signal sig_A, sig_B, sig_S: STD_LOGIC_VECTOR (FULLADDER_WIDTH-1 downto 0):=(others=>'0');
signal sig_Cin, sig_Cout:  std_logic;
-- signal sig_BIN2 : STD_LOGIC_VECTOR(BIN2GRAY_WIDTH-1 downto 0); *** Puede que sea necesario cuadralo
           
begin

Estim: process
    begin
        wait for DELAY;
        for i in 0 to 1 loop
            if (i = 0) then
                sig_Cin <= '0';
            else
                sig_Cin <= '1';
            end if;
            for j in 0 to (2**FULLADDER_WIDTH)-1 loop
                sig_A <= std_logic_vector(to_unsigned(j, sig_A'length));
                for k in 0 to (2**FULLADDER_WIDTH)-1 loop
                    sig_B <= std_logic_vector(to_unsigned(k, sig_B'length));
                    wait for DELAY;
                end loop;
            end loop;
        end loop;
end process;




DUT: AdderNbits
     generic map (N => FULLADDER_WIDTH)
     port map (
        A => sig_A,
        B => sig_B,
        Cin => sig_Cin,
        S => sig_S,
        Cout => sig_Cout
     );


end Behavioral;
