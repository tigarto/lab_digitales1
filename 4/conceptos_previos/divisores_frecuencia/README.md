# Divisores de frecuencia #

## Expresion ##

Sea:
* **fin**: Frecuencia de entrada.
* **fout**: Frecuencia de salida.


Se necesita obtener una frecuencia de salida de:

```
fout = fin/N
```

Si se despeja el valor de escalado el resultado es:

```
N = fin/fout
```

Luego el valor de N sera el modulo del contador de tal manera que se necesitara N/2 abajo y N/2 arriba:

```
N_bajo = N/2

N_alto = N/2
```

## Referncias ##

1. https://www.codeproject.com/Tips/444385/Frequency-Divider-with-VHDL-2
2. https://allaboutfpga.com/vhdl-code-for-clock-divider/
3. https://en.wikipedia.org/wiki/Frequency_divider