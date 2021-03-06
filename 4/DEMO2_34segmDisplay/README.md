# DEMO2: Display 34 segmentos

## Codigos ##

1. [display34segm.vhd](display34segm.vhd)
2. [test_34seg_disp.vhd](test_34seg_disp.vhd)
3. [vga_ctrl_640x480_60Hz.vhd](vga_ctrl_640x480_60Hz.vhd)
4. [Basys3_Master_VGA-34segDisp.xdc](Basys3_Master_VGA-34segDisp.xdc)

## display34segm ##

### Descripción de la entidad 

```vhdl
entity display34segm is
       generic(SG_WD : integer range 0 to 31 := 5; --Segment width
               DL    : integer range 0 to 511 := 100 --DYSPLAY_LENGTH
               --DW:  --TODO: Display width
        );  
        port(segments : in STD_LOGIC_VECTOR (33 downto 0);
             posx :     in integer range 0 to 639;   --disp_posx 
             posy :     in integer range 0 to 479;   --disp_posy
             hcount :   in  STD_LOGIC_VECTOR (10 downto 0);
             vcount :   in  STD_LOGIC_VECTOR (10 downto 0);
             paint :    out  STD_LOGIC
        );
end display34segm;
```

### Arquitectura asociada a la entidad

![image_architecture](display34segm.drawio.jpg)

**Código VHDL**: [display34segm.vhd](display34segm.vhd)

### Sobre la señal *segments* 

Sirve para definir cada uno de los segmentos del display(Similar al display 7 segmentos). 
A continuación se muestra la relación entre los bits de la señal *segments* y los segmentos del display:

![letra_image](letra.jpg)

La visualización del caracter alfa-numérico deseado dependerá de activar o desactivar los respectivos segmentos mediante la señal *segments*. Veamos:

* **Letra A**: La siguiente secuencia permite desplegar la letra A.

```vhdl
segment = "0011000111000001110100000010000000"
```

![a_image](letra_a.jpg)


* **Letra M**: La siguiente secuencia permite desplegar la letra M.

```vhdl
segment = "0000001111011111111000000001000000"
```

![m_image](letra_m.jpg)



El mapa de caracteres se muestra en la siguiente figura:

![mapa_image](mapa_caracteres.jpg)

## Actividades ##

1. Dibuje la entidad **TOP** (sin describir los módulos internos) pero si resaltando las conexiones entre esta entidad y los elementos de la basys3. (**Nota**: No olvide observar el archivo *.xdc* proporcionado en este *demo*).
2. Compruebe el funcionamiento del sistema. El sistema debe desplegar en la pantalla las siguientes letras:

**Caso 1**: Despliegue de la A.

![foto_A](foto_A.jpg)

**Caso 2**: Despliegue de la M.

![foto_A](foto_M.jpg)

3. Dibuje el diagrama de bloques del código suministrado.
4. Realice las modificaciones en el programa de acuerdo a las indicaciones dadas. Este ejercicio sirve de refuerzo previo a la práctica.
