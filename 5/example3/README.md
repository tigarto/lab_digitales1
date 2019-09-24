# Ejemplos Mealy y Moore #

Los ejemplos analizados a continuación fueron tomados del documento [Finite State Machines](VHDL-Lab10.pdf).

## Ejemplo con FSM Mealy ##

Design a sequence detector implementing a Mealy state machine using three always blocks. The Mealy state machine has one input (ain) and one output (yout). The output yout is 1 if and only if the total number of 1s received is divisible by 3 (hint: 0 is inclusive, however, reset cycle(s) do not count as 0- see in simulation waveform time=200). Develop a testbench and verify the model through a behavioral simulation. Use SW0 as the clock input, SW1 as the ain input, the BTNU button as reset input to the circuit, number of 1s count on LED7:LED4, and LED0 as the yout output. Go through the design flow, generate the bitstream, and download it into the Nexys3 board. Verify the functionality.

**Link Solución**: [mealy](./mealy).

## Ejemplo con FSM Moore ##

Design a sequence detector implementing a Moore state machine using three always blocks. The Moore state machine has two inputs (ain[1:0]) and one output (yout). The output yout begins as 0 and remains a constant value unless one of the following input sequences occurs:
1. The input sequence ain[1:0] = 01, 00 causes the output to become 0.
2. The input sequence ain[1:0] = 11, 00 causes the output to become 1.
3. The input sequence ain[1:0] = 10, 00 causes the output to toggle.

Develop a testbench (similar to the waveform shown below and verify the model through a behavioral simulation. Use SW0 as the clock input, SW2-SW1 as the ain[1:0] input, the BTNU button as reset input to the circuit, and
LED0 as the yout output. Go through the design flow, generate the bitstream, and download it into the Nexys3 board. Verify the functionality.

**Link Solución**: [moore](./moore).
