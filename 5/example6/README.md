# Ejemplo 6 - Detector de secuencia #

## Enunciado ##

Diseñar un circuito secuencial que cumpla con los siguientes requerimientos:
1. El circuito tendra una entrada (**w**) y una salida (**z**).
2. Los cambios ocurren en el flanco positivo de la señal de reloj.
3. La señal **z** es igual a **1** si durante los dos ciclos de reloj inmediatamente enteriores a la entrada **w** son **1**. Por otro lado el valor de la salida **z** es **0**.

En resumen, el circuito detecta si dos o mas **1's** concecutivos ocurren en un patron de datos a la entrada.

### Solución ###

En los siguientes enlaces se describen las soluciones:
1. Solución Moore ([Solución Moore](./moore)).
2. Solución Mealy ([Solución Mealy](./mealy/1)).
