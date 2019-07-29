library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity full_adder Is
port (
        x : in STD_LOGIC;
        y : in STD_LOGIC;
        cin : in STD_LOGIC;
        -- salidas forma dataflow
        s_df : out STD_LOGIC;
        cout_df: out STD_LOGIC;
        -- salidas forma structural
        s_struct : out STD_LOGIC;
        cout_struct: out STD_LOGIC;
        -- salidas forma behavioral
        s_behav : out STD_LOGIC;
        cout_behav: out STD_LOGIC
    );
end full_adder;

Architecture behavior of full_adder Is

-- Señales para la parte dataflow
Signal x_y : STD_LOGIC;
Signal x_cin : STD_LOGIC;
Signal y_cin : STD_LOGIC;

-- Componets y signals para la parte de la descripcion estructural

component and2 port
( i0, i1: in STD_LOGIC;
  o : out STD_LOGIC);
end component;

component or3 port
( i0, i1, i2: in STD_LOGIC;
  o : out STD_LOGIC);
end component;

component xor3 port
( i0, i1, i2: in STD_LOGIC;
  o : out STD_LOGIC);
end component;

Signal x_y_s : STD_LOGIC;
Signal x_cin_s : STD_LOGIC;
Signal y_cin_S : STD_LOGIC;

begin   
    -- ******************************************
    -- Parte dataflow
    -- ******************************************
    -- Forma 1
    
    s_df <= x xor y xor cin;
    x_y <= x and y;
    x_cin <= x and cin;
    y_cin <= y and cin;
    cout_df <= x_y or x_cin or y_cin;

    -- Forma 2:  Casos usando la asignacion condicional
 
    --- ---------------------------
        --- TABLA DE VERDAD FULL_ADDER
        --- ---------------------------
        --- | x | y | cin || s | cout |
        --- ---------------------------
        --- | 0 | 0 |  0  || 0 |  0   |
        --- | 0 | 0 |  1  || 1 |  0   |
        --- | 0 | 1 |  0  || 1 |  0   |
        --- | 0 | 1 |  1  || 0 |  1   |
        --- | 1 | 0 |  0  || 1 |  0   |
        --- | 1 | 0 |  1  || 0 |  1   |
        --- | 1 | 1 |  0  || 0 |  1   |
        --- | 1 | 1 |  1  || 1 |  1   |
        --- ---------------------------
    ---

    -- s_df <= '1' when x_y_cin = "001" else
    --       '1' when x_y_cin = "010" else
    --       '1' when x_y_cin = "100" else
    --       '1' when x_y_cin = "111" else
    --       '0';
    
    -- cout_df <= '1' when (x = '0' and y = '1' and cin = '1') else
    --          '1' when (x = '1' and y = '0' and cin = '1') else
    --          '1' when (x = '1' and y = '1' and cin = '0') else
    --          '1' when (x = '1' and y = '1' and cin = '1') else
    --          '0';


    -- ******************************************
    -- Parte structural
    -- ******************************************

    x1 : xor3 port map (i0 => x, i1 => y, i2 => cin, o => s_struct);
	a1 : and2 port map (i0 => x, i1 => y, o => x_y_s);
    a2 : and2 port map (i0 => x, i1 => cin, o => x_cin_s);
    a3 : and2 port map (i0 => y, i1 => cin, o => y_cin_s);
	o1 : or3 port map (i0 => x_y, i1 => x_cin, i2 => y_cin, o => cout_struct);  

    -- ******************************************
    -- Parte behavioral 
    -- ******************************************
    -- Se hacce uso de process...
    process (x,y,cin)

    Variable x_y_v : STD_LOGIC;
    Variable x_cin_v : STD_LOGIC;
    Variable y_cin_v : STD_LOGIC;

    begin
    s_behav <= x xor y xor cin;
    x_y_v := x and y;
    x_cin_v := x and cin;
    y_cin_v := y and cin;
    cout_behav <= x_y_v or x_cin_v or y_cin_v;
    
    end process;
    
end behavior;