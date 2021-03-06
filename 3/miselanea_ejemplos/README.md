# VHDL - Conceptos básicos #

> Apuntes y ejemplos tomados del libro: **Digital design and Computer Architecture** de David y Sara Harrys

## Definiciones ##

### Módulo (Module) ###
Es un bloque de hardware con entradas y salidas (por ejemplo una compuerta AND, un circuito con proridad, etc). Existen 3 formas de describir lo que hace el módulo estas son:
* Descripción comportamental (Behavioral).
* Descripción por flujo de datos (Dataflow).
* Descripción estructural (Structural).

Si un modulo tiene una interfaz bien definida, consistira de sus entradas y salidas y realizará una función específica. La manera particulas en la cual es codificado no es importante para otros que pudieran usar el módulo siempre que este cumpla su función.

### Sintesis y simulación ###

Los dos principales propósitos de los lenguajes de descripción de hardware (HDL's) son la simulación logica y la sintesis. Durante la simulación, diferentes entradas son aplicadas a un modulo y las salidas son chequeadas para verificar que el módulo opera correctamente. Durante la sintesis, la descripción textual del módulo es trasnformada en compuertas lógicas. Otros conceptos relacionados con esta parte se muestran a continuación

* **Modulos sintetizable**: Se encargan expresamente de describir el hardware.
* **Test Bench**: contiene codigo para aplicar entradas a un módulo, chequear los resultados de las salidas e imprimir discrepacias entre los resultados esperados y las salidas actuales. El código testbench es empleado solo para simulación y no puede ser sintetizado.

### Tips para HDL's ###
* Uno de los errores mas comunes para los principiantes es pensar en HDL como un programa normal de ordenador en lugar de un lenguaje para la descripción de hardware. Es necesario tener en cuenta que hardware del código HDL deberia sintezarse ya que si no, se podría obtener mas hardware del necesario de tal modo que, pese a que el código creado simula bien puede que no sea posible implementarlo en hardware. 
* Es ideal pensar el sistema en bloques de lógica combinatoria, registros y maquinas de estado finitos, esbozar estos bloques en papel y mostrar como estna conectados antes de empezar a escribir código.
* La mejor manera de aprender HDL es mediante ejemplos. Los HDLs tienen manera especificas para describir varias clases de logica las cuales con llamadas **idioms**. De modo que si usted necesita describir una clase especial de hardware, observe y analice ejemplos similares y adaptelos de acuerdo a sus necesidades.

### Comentarios ###

1. **Multilinea**:
   
```vhdl
/*
Comentario de varias
lineas
*/
```

2. **Una sola linea**:
   
```vhdl
-- Comentario de una sola linea
```

### Lógica combinacional ###
En el caso de la lógica combinacional depende solamente de las entradas actuales. 
1. [Bitwise Operators - Operadores sobre bits (parte 1)](./ejemplo1/README.md)
2. [Bitwise Operators - Operadores sobre bits (parte 2)](./ejemplo2/README.md)
3. [Reduction operands - Operadores de reducción](./ejemplo3/README.md)
4. [Conditional Assignment - Asignación condicional (parte 1)](./ejemplo4/README.md)
5. [Conditional Assignment - Asignación condicional (parte 2)](./ejemplo5/README.md)
6. [Internal signals - señales internas](./ejemplo6/README.md)
7. [Presedence - Numbers - Z’s and X’s](./ejemplo7/README.md)
8. [Bit Swizzling - Delays](./ejemplo8/README.md)
9. [Structural modeling - Example 1](./ejemplo9/README.md)
10. [Structural modeling - Example 2](./ejemplo10/README.md)
11. [Structural modeling - Example 3](./ejemplo11/README.md)
12. [Conditional Assignment - Asignación condicional (parte 3)](./ejemplo12/README.md)
13. [Conditional Assignment - Sobre la clausula others](./ejemplo13/README.md)
14. [Conditional Assignment - Asignación condicional (parte 4)](./ejemplo14/README.md)
15. [Tipos de datos - Ejemplo mux8:1](./ejemplo15/README.md)
16. [Tipos de datos - Ejemplo multiplicador](./ejemplo16/README.md)
17. [Generic (Parte1)](./ejemplo17/README.md)
18. [Generic (Parte2)](./ejemplo18/README.md)
19. [Generate - Ejemplo AND de N entradas](./ejemplo19/README.md)


## Referencias ##
1. [VHDL GUIDES](https://www.ics.uci.edu/~jmoorkan/vhdlref/)
2. [VHDL Tutorials and Examples](https://www.nandland.com/vhdl/tutorials/index.html)
3. [Vhdl lectures](http://web.engr.oregonstate.edu/~traylor/ece474/vhdl_lectures/)
4. [Programación en VHDL/Arquitectura](https://es.wikibooks.org/wiki/Programaci%C3%B3n_en_VHDL/Arquitectura)
5. [All about fpga](https://allaboutfpga.com/)
6. [VHDL 93 Reference Guide](https://www.hdlworks.com/hdl_corner/vhdl_ref/)
7. [Altium - VHDL Language Reference](http://valhalla.altium.com/Learning-Guides/TR0114%20VHDL%20Language%20Reference.pdf)
8. [ES 4 VHDL reference sheet](http://www.ece.tufts.edu/ee/201/vhdl_cheatsheet.pdf)
9. [VHDL Quick Reference Card](https://owd.tcnj.edu/~hernande/r/VHDL_QRC__01.pdf)
10. [digikey eewiki](https://www.digikey.com/eewiki/display/LOGIC/Home)
11. [Introduction to VHDL for Implementing Digital Designs into FPGAs](http://indico.ictp.it/event/a12223/session/2/contribution/2/material/0/1.pdf)
12. [ES 4 VHDL reference sheet](http://www.ece.tufts.edu/ee/201/vhdl_cheatsheet.pdf)
13. [VHDL Quick Reference Guide](https://kadionik.vvv.enseirb-matmeca.fr/SoC/vhdl/vhdl%20ref.pdf)
14. [VHDL Quick Reference Card](https://owd.tcnj.edu/~hernande/r/VHDL_QRC__01.pdf)
15. [VHDL QUICK REFERENCE CARD](https://academic.csuohio.edu/chu_p/rtl/vhdl_stuff/card_vhdl.pdf)
16. [Building Blocks](https://www.uio.no/studier/emner/matnat/fys/FYS4220/h12/documentation/vhdl_instructions.pdf)
