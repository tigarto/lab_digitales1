Design a sequence detector implementing a Mealy state machine using
three always blocks. The Mealy state machine has one input (ain) and one
output (yout). The output yout is 1 if and only if the total number of 1s
received is divisible by 3 (hint: 0 is inclusive, however, reset cycle(s) do not
count as 0- see in simulation waveform time=400). Develop a testbench and
verify the model through a behavioral simulation. Use SW0 as the clock
input, SW1 as the ain input, the BTNU button as reset input to the circuit,
number of 1s count on LED7:LED4, and LED0 as the yout output. Go
through the design flow, generate the bitstream, and download it into the
Nexys3 board. Verify the functionality. 

Diseñe un detector de secuencia implementando una maquina de estados Mealy usando siemple bloques de tres.
La maquina de estados Meay tiene una entrada (ain) y una salida (yout) si el numero total de unos es divisible por 3
(calve: 0 esta inclusive, sin embargo, el reset cicle no cuenta como cero ver waveform en time = 400). 
Desarrolle un testbench y verifique el modelo a traves de una simulación behavioral. Use Sw0 como la clock entrada de clock, SW2, ...

ghdl -a mealy1.vhd
ghdl -a --ieee=synopsys -fexplicit mealy1_tb.vhd
ghdl -r --ieee=synopsys -fexplicit  FSM_MEALY_TB --stop-time=200ns --vcd=FSM_MEALY_TB_results.vcd
gtkwave FSM_MEALY_TB_results.vcd


https://www.studocu.com/es/document/universidad-rey-juan-carlos/estructura-de-computadores/ejercicios-obligatorios/tema08-ejercicios-sistemas-secuenciales/3398505/view

http://repositorio.upct.es/bitstream/handle/10317/124/Descarga.pdf?sequence=1&isAllowed=y

https://www.dte.us.es/docencia/etsii/gii-is/circuitos-electronicos-digitales/grupo-5/Tema6-CircuitosSecuencialesSincronos.pdf

http://courses.cs.tamu.edu/rabi/cpsc617/Assignments/Assignments%202013/Tutorial%20Three%20Cycle%20High%20Timer.pdf


https://stackoverflow.com/questions/22058953/vhdl-state-machine-testbench

http://www.csit-sun.pub.ro/courses/Masterat/Xilinx%20Synthesis%20Technology/toolbox.xilinx.com/docsan/xilinx4/data/docs/xst/hdlcode15.html