# DEMO2

## Codigo ##

1. [display34segm.vhd](display34segm.vhd)
2. [test_34seg_disp.vhd](test_34seg_disp.vhd)
3. [vga_ctrl_640x480_60Hz.vhd](vga_ctrl_640x480_60Hz.vhd)
4. [Basys3_Master_VGA-34segDisp.xdc](Basys3_Master_VGA-34segDisp.xdc)

## display34segm ##

## Descripción de la entidad 

```vhdl
entity display34segm is
       generic(SG_WD : integer range 0 to 31 := 5; --Segment width
               DL : integer range 0 to 511 := 100 --DYSPLAY_LENGTH
               --DW:  --TODO: Display width
        );  
        port(segments : in STD_LOGIC_VECTOR (33 downto 0);
             posx : in integer range 0 to 639;   --disp_posx 
             posy : in integer range 0 to 479;   --disp_posy
             hcount : in  STD_LOGIC_VECTOR (10 downto 0);
             vcount : in  STD_LOGIC_VECTOR (10 downto 0);
             paint : out  STD_LOGIC
        );
end display34segm;
```

**Codigo VHDL**: [vga_ctrl_640x480_60Hz.vhdl](vga_ctrl_640x480_60Hz.vhdl)

## Actividades ##

1. Dibuje la entidad mas grande (sin mostrar los bloques internos) pero si resaltando las conexiones entre esta con los elementos de la basys3. (**Nota**: No olvide observar el archivo xdc proporsionado para esto).
2. Pruebe el programa de acuerdo a los archivos facilitados:

Si todo esta bien para cada caso se deben mostrar las siguientes salidas:

**Caso 1**: Despliegue de la A.

![foto_A](foto_A.jpg)

**Caso 2**: Despliegue de la M.

![foto_A](foto_M.jpg)

2. Dibuje el diagrama de bloques del código suministrado
3. Haga las modificaciones en el programa de acuerdo a las indicaciones dadas. Esto será un ejercicio de refuerzo previo a la practica.
