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

ghdl -a --ieee=synopsys -fexplicit mealy1.vhd 
ghdl -a --ieee=synopsys -fexplicit mealy1_tb.vhd
ghdl -r --ieee=synopsys -fexplicit  FSM_MEALY_TB --stop-time=200ns --vcd=FSM_MEALY_TB_results.vcd
gtkwave FSM_MEALY_TB_results.vcd

http://www.estadofinito.com/contador-en-vhdl/
http://www.profesores.frc.utn.edu.ar/electronica/tecnicasdigitalesi/pub/file/cursoCavallero/J_002-CONTADORES.pdf
https://es.wikibooks.org/wiki/Programaci%C3%B3n_en_VHDL/Ejemplos/Contador
http://inst.eecs.berkeley.edu/~cs61c/resources/pnh.stg.mgmt.pdf
https://vhdlguide.readthedocs.io/en/latest/index.html
https://electrovolt.ir/wp-content/uploads/2017/07/Finite-State-Machines-in-Hardware-Volnei-A.-Pedroni-ElectroVolt.ir_.pdf



https://www.studocu.com/es/document/universidad-rey-juan-carlos/estructura-de-computadores/ejercicios-obligatorios/tema08-ejercicios-sistemas-secuenciales/3398505/view

http://repositorio.upct.es/bitstream/handle/10317/124/Descarga.pdf?sequence=1&isAllowed=y

https://www.dte.us.es/docencia/etsii/gii-is/circuitos-electronicos-digitales/grupo-5/Tema6-CircuitosSecuencialesSincronos.pdf

http://courses.cs.tamu.edu/rabi/cpsc617/Assignments/Assignments%202013/Tutorial%20Three%20Cycle%20High%20Timer.pdf


https://stackoverflow.com/questions/22058953/vhdl-state-machine-testbench

http://www.csit-sun.pub.ro/courses/Masterat/Xilinx%20Synthesis%20Technology/toolbox.xilinx.com/docsan/xilinx4/data/docs/xst/hdlcode15.html

https://docs.google.com/a/udea.edu.co/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxlbGVjdHJvbmljYWRpZ2l0YWwxMTd8Z3g6YmJlYWQ0NDRkOWUxNDMz


https://docs.google.com/a/udea.edu.co/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxlbGVjdHJvbmljYWRpZ2l0YWwxMTd8Z3g6MWI3Y2MwMzYwNzZkZWU0Mw



----



https://www.studocu.com/es/document/universidad-rey-juan-carlos/estructura-de-computadores/ejercicios-obligatorios/tema08-ejercicios-sistemas-secuenciales/3398505/view

http://repositorio.upct.es/bitstream/handle/10317/124/Descarga.pdf?sequence=1&isAllowed=y

https://www.dte.us.es/docencia/etsii/gii-is/circuitos-electronicos-digitales/grupo-5/Tema6-CircuitosSecuencialesSincronos.pdf

http://courses.cs.tamu.edu/rabi/cpsc617/Assignments/Assignments%202013/Tutorial%20Three%20Cycle%20High%20Timer.pdf


https://stackoverflow.com/questions/22058953/vhdl-state-machine-testbench

http://www.csit-sun.pub.ro/courses/Masterat/Xilinx%20Synthesis%20Technology/toolbox.xilinx.com/docsan/xilinx4/data/docs/xst/hdlcode15.html

-----

http://www.cse.usf.edu/~haozheng/teach/cda4253/slides/vhdl-4.pdf

http://www.cse.chalmers.se/~coquand/AUTOMATA/book.pdf

http://www.cse.chalmers.se/~coquand/AUTOMATA/

http://www.cse.usf.edu/~haozheng/teach/cda4253/slides/vhdl-testbench.pdf

http://www.cse.usf.edu/~haozheng/teach/cda4253/slides/vhdl-3.pdf

http://www.cse.usf.edu/~haozheng/teach/cda4253/slides/vhdl-2.pdf

http://www.cse.usf.edu/~haozheng/teach/cda4253/slides/vhdl-1.pdf


http://www.cse.usf.edu/~haozheng/teach/cda4253/slides/hls-vivado.pdf

http://www.cse.usf.edu/~haozheng/teach/cda4253/slides/hls-intro.pdf

https://pdfs.semanticscholar.org/719c/f41bae253349d30a3fd427038ba457933f14.pdf

https://vhdlguide.readthedocs.io/en/latest/vhdl/fsm.html
https://vhdlguide.readthedocs.io/en/latest/index.html

https://electrovolt.ir/wp-content/uploads/2017/07/Finite-State-Machines-in-Hardware-Volnei-A.-Pedroni-ElectroVolt.ir_.pdf

http://www.profesores.frc.utn.edu.ar/electronica/tecnicasdigitalesi/pub/file/cursoCavallero/J_002-CONTADORES.pdf

http://www.fdi.ucm.es/profesor/mendias/DASii/docs/tema3.pdf

http://www.estadofinito.com/contador-en-vhdl/

http://www.estadofinito.com/


