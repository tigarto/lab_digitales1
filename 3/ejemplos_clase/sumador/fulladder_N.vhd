
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- use STD.textio.all; --for line
-- use IEEE.std_logic_textio.all; --for write

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AdderNbits is
  generic(N : integer := 8);
  Port ( 
      A, B: in std_logic_vector(N-1 downto 0);
      Cin: in std_logic;
      S: out std_logic_vector(N-1 downto 0);
      Cout: out std_logic
  );
end AdderNbits;

architecture Behavioral of AdderNbits is
signal C: std_logic_vector(N downto 0);
signal X: std_logic_vector(N-1 downto 0);
begin
  C(0) <= Cin;
  ADD: for I in 0 to N - 1 generate
  begin
    X(I) <= A(I) xor B(I);
    S(I) <= C(I) xor x(I);
    C(I+1) <= (A(I) and B(I)) or (X(I) and C(I));
  end generate;
  Cout <= C(N);
end Behavioral;

