# DEMO1

## Codido ##

1. [Simple_Test_VGA.vhd](Simple_Test_VGA.vhd)
2. [vga_ctrl_640x480_60Hz.vhd](vga_ctrl_640x480_60Hz.vhd)
3. [Basys3_Master_VGA-Rectangulo.xdc](Basys3_Master_VGA-Rectangulo.xdc)


## Anotaciones ##

Del archivo [Simple_Test_VGA.vhd](Simple_Test_VGA.vhd) gran parte de la clave para comprender el codigo se encuentra en:

```vhdl
-- Dibuja el cuadro y asigna colores
   INT_RGB <= COLOR when ((VCOUNT>=150) AND (VCOUNT<=330) AND (HCOUNT>=230) AND (HCOUNT<=410)) else
			     not COLOR;

```

## Actividades ##

1. Dibuje el diagrama de bloques del código suministrado
2. Modifique el tamaño del elemento desplegado en pantalla, y la posición del mismo.
3. Despliegue en pantalla un rectangulo tipo marco. La siguiente figura le puede ser de utilidad para entender lo que se pide:

![marco_image](marco.png)