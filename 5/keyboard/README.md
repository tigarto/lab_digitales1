


## Archivos asociados ##

Los siguientes archivos son usados para implementar una aplicacion determina el caracter ascii asociado a una tecla presionada e un teclado PS/2. El codigo fuente para el **PS/2 keyboard to ASCII converter** consiste de los siguientes 3 archivos:
* [ps2_keyboard_to_ascii.vhd](ps2_keyboard_to_ascii.vhd)
* [ps2_keyboard.vhd](ps2_keyboard.vhd)
* [debounce.vhd](debounce.vhd)



### PS/2 Keyboard Interface (VHDL) ###

#### Resumen ####

Este componente recibe las transacciones desde un teclado PS/2 y obtiene los codigos make code (key press) y break code (key release) a una salida paralela.

#### Codigo asociado ####

El codigo asociado se encuentra en el archivo [ps2_keyboard.vhd](ps2_keyboard.vhd)

#### Diagrama de bloques ####

A continuación se muestra entidad asociada al codigo vhd:

![implementacion](implementacion.jpg)

La información de las entradas y las salidas se muestran a continuación:

|Port|Width|Mode|Data Type|Interface|Description|
|----|-----|----|---------|---------|-----------|
|ascii_code|7|out|standard logic vector|user logic|Codigo ASCII de 7 bits obtenido desde el teclado PS/2|
|ps2_clk|1|in|standard logic|PS/2 keyboard|Señal de reloj proveniente del teclado PS/2|
|ps2_data|1|in|standard logic|PS/2 keyboard|Señal de datos proveniente del teclado PS/2|
|ascii_new|1|out|standard logic|user logic|New code available flag. Esta flag se mantiene en bajo durante las coversiones de PS/2 a ASCCI. Una transición de bajo a alto indica que un nuevo codigo ASCII esta disponible en el bus ascci_code|
|clk|1|in|standard logic|user logic|Reloj del sistema|

La siguiente figura muestra la arquitectura del circuito digital implementado en el codigo anterior:

![PS2_arch](architecture.jpg)

La siguiente figura muestra los scan codes que se asociados a las diferentes teclas:

![scan_codes](keyboard_scancodes.png)

Para los break codes se antepone una F0 al scan code de la tecla asociada. Asi si se observa la figura anterior el break code para la tecla **A** (cuyo scan code asociado es **1C**) es **0F,1C**

### Debounce Logic Circuit  (VHDL) ###

El uso de switches mecanicos para interfaz de usuario es una practica común. Sin embargo, cuando estos switches son presionados sus contactos, a menudo rebotan (bounce) una y otra vez antes de alcanzar un estado estable. 

![switch_bounce](switch_bounce.jpg)

Un modulo anti-debounce es un sistema diseñado digital para corregir este problema. A continuación se muestra la implementación asociada.

#### Codigo asociado ####

El codigo asociado se encuentra en el archivo [debounce.vhd](debounce.vhd)


#### Diagrama de bloques ####

A continuación se muestra entidad asociada al codigo vhd:

![debounce](debounce.jpg)

La información de las entradas y las salidas se muestran a continuación:

|Port|Width|Mode|Data Type|Interface|Description|
|----|-----|----|---------|---------|-----------|
|clk|1|in|standard logic|user logic|Reloj del sistema|
|reset_n|1|in|standard logic|user logic|Reset asincrono activado en bajo|
|button|1|in|standard logic|button or switch|Señal de entrada previa al debounce|
|result|1|out|standard logic|user logic|debounced signal|

El codigo vhdl describe el siguiente circuito digital:

![debounce_circuit](debounce1.jpg)

Para este ejemplo, el debounce es usado dentro del modulo 
ps2_keyboard.vhd para propositos de sincronización

### PS/2 to ASCII Conversion (VHDL) ###

Esta parte esta relacionada con el archivo VHDL top el cual instancia la componente asociada al teclado PS/2 (ps2_keyboard.vhd) y usa los codigos entregados por esta para controlar la maquina de estados asociada al conversor.

#### Codigo asociado ####

El codigo asociado se encuentra en el archivo [ps2_keyboard_to_ascii.vhd](ps2_keyboard_to_ascii.vhd)


#### Diagrama de bloques ####

A continuación se muestra la maquina de estados implementada en el codigo anterior:

![fsm](fsm.jpg)

## Demostración ##

Empleando Vivado, monte la siguiente aplicación para cuyo caso se dan los siguientes archivos:
* [ps2_keyboard_to_ascii.vhd](ps2_keyboard_to_ascii.vhd)
* [ps2_keyboard.vhd](ps2_keyboard.vhd)
* [debounce.vhd](debounce.vhd)
* [Basys3_Master_demo0KeyBoard.xdc](Basys3_Master_demo0KeyBoard.xdc)

La siguientes imagenes evidencian el funcionamiento de la aplicación para los casos en los que se precionan la A y la Z. ¿Cual es el significado de la salida que se quiere expresar empleando los leds?

**Letra A**

![A](letra_A.jpg)

**Letra Z**

![A](letra_Z.jpg)

## Notas adicionales ##
Para mas informacion puede consultar el enlace [PS/2 Keyboard to ASCII Converter (VHDL)](https://www.digikey.com/eewiki/pages/viewpage.action?pageId=28279002)



## Enlaces ##

1. [PS/2 Keyboard Interface (VHDL)](https://www.digikey.com/eewiki/pages/viewpage.action?pageId=28278929)
2. [PS/2 Keyboard to ASCII Converter (VHDL)](https://www.digikey.com/eewiki/pages/viewpage.action?pageId=28279002)
3. [Debounce Logic Circuit (with VHDL example)](https://www.digikey.com/eewiki/pages/viewpage.action?pageId=4980758)
4. [Basys 3 Keyboard Demo](https://reference.digilentinc.com/learn/programmable-logic/tutorials/basys-3-keyboard-demo/start)
5. [Diligent Courses](https://reference.digilentinc.com/learn/courses/start)
6. [Diligent Fundamentals](https://reference.digilentinc.com/learn/fundamentals/start)

<!---
http://www.secs.oakland.edu/~llamocca/Tutorials/VHDLFPGA/
http://www.secs.oakland.edu/~llamocca/Tutorials/VHDLFPGA/Outline.pdf
http://www.secs.oakland.edu/~llamocca/Tutorials/VHDLFPGA/Vivado/


http://ece-research.unm.edu/jimp/vhdl_fpgas/slides/VGA.pdf
http://ece-research.unm.edu/jimp/vhdl_fpgas/
https://academic.csuohio.edu/chu_p/rtl/rtl_hardware.html
https://academic.csuohio.edu/chu_p/rtl/chu_rtL_book/rtl_chap10_fsm.pdf
https://academic.csuohio.edu/chu_p/rtl/fpga_vhdl.html
http://ece-research.unm.edu/jimp/vhdl_fpgas/slides/UART.pdf
http://ece-research.unm.edu/jimp/vhdl_fpgas/modules/divider/divider.vhd
http://ece-research.unm.edu/jimp/vhdl_fpgas/slides/FSM.pdf
http://ece-research.unm.edu/jimp/vhdl_fpgas/slides/sequential_design.pdf
http://ece-research.unm.edu/jimp/vhdl_fpgas/slides/sequential_principle.pdf

https://ece.gmu.edu/coursewebpages/ECE/ECE448/S13/
http://ebook.pldworld.com/_eBook/FPGA%EF%BC%8FHDL/

-->