# Ejemplo de uso de memorias #

Supongase que se desea implementar en pantalla el siguiente dibujo.

![patron](mem_example.jpg)

Cada cuadro del dibujo anterior representa un pixel el cual tendra asociado un color determinado de acuerdo a la combinacion de colores definida la información **RGB**. 

Teniendo en cuenta que hay 4 bits por color, la combinación bit por bit **RBG** será dada por: **R3R2R1R0G3G2G1G0B3B2B1B0** 

Para este caso tenemos dos posible al manejar dos colores tenemos los siguientes bits asociados a cada uno de estos:
* **Blanco**: 
```bash  
R3R2R1R0G3G2G1G0B3B2B1B0= 111111111111 = FFF
```

* **Verde**: 

```bash  
R3R2R1R0G3G2G1G0B3B2B1B0 = 000011110000 = 0F0
```

De modo que el valor asociado al color para cada pixel de memoria se mostraria a continuacion:

![patron](mem_example2.jpg) 

Asi, segun lo anterior estre problema puede ser tratado por medio de memorias. A continuación se muestran dos formas de llevar esto a cabo.

### Forma 1 ###

Para este caso, la forma como se almacenarian los datos en la ram seria como la siguiente: 

![patron](mem_example3.jpg) 

Teniendo en cuenta que:
* bitsPerData = 12
* columns = 5
* rows = 5

La definición en VDHL de la figura anterior estaria dada por el siguiente array:

```vhdl
type vector_array is array (0 to rows - 1) of std_logic_vector (bitsPerData*columns -1 downto 0);
CONSTANT memory: vector_array := ( 
	X"FFFFFF0F0FFFFFF",
	X"FFF0F00F00F0FFF",
	X"0F00F00F00F00F0",
	X"FFF0F00F00F0FFF", 
	X"FFF0F00F00F0FFF",
	X"FFF0F00F00F0FFF",
	X"FFF0F00F00F0FFF",
	X"FFF0F00F00F0FFF");
```

Para acceder a un pixel en particular se tiene que obtener la fila completa y a partir de alli el segmento de memoria de esta correspondiente a la columna en expecial tal y como se muestra a continuación: 

```vhdl
rowData <= memory(row);
data <= rowData(((columns - column)*bitsPerData) - 1  downto ((columns - 1) - column)*bitsPerData);
```
### Forma 2 ###

La idea es almacenar los datos de la imagen siguiendo el siguiente patron:

![patron](mem_example4.jpg) 

Teniendo en cuenta que:
* bitsPerData = 12
* columns = 5
* rows = 5
  
La definición en VHDL asociada al patron anterior se muestra a continuación:

```vhdl
type memory_segment is array (0 to columns - 1) of std_logic_vector (bitsPerData - 1 downto 0);
type vector_array is array (0 to rows - 1) of memory_segment;

CONSTANT memory: vector_array := ( 
	(X"FFF",X"FFF",X"0F0",X"FFF",X"FFF"),
	(X"FFF",X"0F0",X"0F0",X"0F0",X"FFF"),
	(X"0F0",X"0F0",X"0F0",X"0F0",X"0F0"),
	(X"FFF",X"0F0",X"0F0",X"0FF",X"FFF"),
	(X"FFF",X"0F0",X"0F0",X"0F0",X"FFF"),
	(X"FFF",X"0F0",X"0F0",X"0F0",X"FFF"),
	(X"FFF",X"0F0",X"0F0",X"0F0",X"FFF"),
	(X"FFF",X"0F0",X"0F0",X"0F0",X"FFF"));
```

A diferencia del anterior caso, la forma de acceder a un pixel incluso es mucho mas facil. A continuación se muestra como:

```vhd
data <= memory(row)(column);
```

