# DEMO1

## Funcionalidad ##
Hacer un contador que permita vaya contando en pantalla desde 0 a 999 cada segundo. El contador tendra como entradas un reset y un enable. 

* **Nota**: En la simulación no se pudo realizar el test cada segundo pues esto resultaba impractico. Mas adelante se mostrará lo que se hizo.

## Código ##

1. **[vga_ctrl_640x480_60Hz.vhd](vga_ctrl_640x480_60Hz.vhd)**: Driver VGA.

![vga_module](vga_module.jpg)

2. **[Display.vhd](Display.vhd)**: Modulo para dibujar digitos en pantalla. El digito dibujado sigue el siguiente patron:

![digito](number.jpg)

Y el diagrama de bloques asociado a este se muestra en la siguiente figura:

![display](Display.jpg)

3. **[BIN2BCD_0a999.vhd](BIN2BCD_0a999.vhd)**: Modulo que convierte un numero binario de 10 bits a 3 digitos BCD; uno para las centenas, otro para las descenas y otro para las unidades. A continuación se muestra el diagrama de bloques asociado a este modulo:

![BIN2BCD_0a999](BIN2BCD_0a999.jpg)

4. **[VGACounter.vhd](VGACounter.vhd)**: Entidad top que implementa el contador que será desplegado en pantalla. 
      
![VGA_counter_top](VGA_counter_top.jpg)
   
En la siguiente figura se muestra la arquitectura de este modulo:

![VGACounter_v2](VGACounter_v2.jpg)

5. **[VGACounter_tb.vhd](VGACounter_tb.vhd)**: Archivo en el cual se hace el test bench del modulo **VGACounter**.

![tb_VGA_counter_top](tb_VGA_counter_top.jpg)


## Actividades ##

1. Dibuje el diagrama de bloques del código suministrado
2. Modifique los tamaños, la ubicación y los colores de los displays suministrados.
3. Modifique la ubicación de los dígitos en los displays suministrados.

