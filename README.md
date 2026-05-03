# Laboratorio: Instrucciones y Direccionamiento (Unidad 6)
**Estudiante:** Cely Urbina William Camilo Igor
**Carrera:** Ingeniería de Sistemas  
**Materia:** Arquitectura de Computadores  

## 1. Descripción
Este laboratorio demuestra la implementación de un programa en ensamblador NASM (x86) que utiliza las cuatro categorías fundamentales de instrucciones:
1. **Transferencia de datos:** MOV, LEA, PUSH, POP, XCHG.
2. **Aritméticas:** ADD, SUB, INC, DEC, MUL, DIV.
3. **Lógicas:** AND, OR, XOR, TEST, SHL, SHR.
4. **Control de flujo:** CMP, Saltos condicionales (JG, JE) y bucles (LOOP).

## 2. Entorno de Trabajo
- **Emulador:** DOSBox 0.74-3.
- **Ensamblador:** NASM v2.11+.
- **Depurador:** DEBUG.COM.

## 3. Evidencias de Checkpoints

### Checkpoint 1: Compilación
El programa `lab6_instrucciones.asm` se compiló exitosamente generando el archivo binario `.com`.
> **Comando:** `nasm -f bin lab6_instrucciones.asm -o lab6_instrucciones.com`
![Compilación](capturas/checkpoint1_compilacion.png)

### Checkpoint 2: Verificación de Flags en DEBUG
Se realizó el trazado (comando `T`) de instrucciones críticas para observar el registro EFLAGS.

| Instrucción | Registro AX (Hex) | Flags Observados (ZF, CF, SF, OF) |
| :--- | :--- | :--- |
| `ADD AX, BX` | 0039 | ZF=0, CF=0, SF=0, OF=0 (Resultado 57)[cite: 3] |
| `SUB AX, [valor_a]` | FFDF | SF=1 (Resultado negativo -33)[cite: 3] |
| `TEST AL, 01h` | 00B7 | ZF=0 (Indica que el bit 0 es 1, número impar)[cite: 3] |
| **Final del Bucle** | 000F | ZF=1 (Al terminar el LOOP, CX llega a 0)[cite: 3] |

![DEBUG Trace](capturas/checkpoint2_debug.png)

### Checkpoint 3: Variante Factorial
Se modificó el bucle para calcular el factorial de 5 ($5! = 120$ o $78h$)[cite: 3].
- **Cambio realizado:** Se reemplazó `ADD AX, BX` por `MUL BL`[cite: 3].
- **Análisis LOOP vs DEC/JNZ:** La instrucción `LOOP` es más eficiente en tamaño de código ya que gestiona automáticamente el registro `CX`. Sin embargo, `DEC/JNZ` es preferible cuando se requiere usar un registro diferente a `CX` como contador o cuando la distancia del salto supera los 128 bytes[cite: 3].

![Factorial Result](capturas/checkpoint3_factorial.png)

## 4. Conclusiones
- El uso de `LEA` es fundamental para obtener direcciones de memoria (punteros), mientras que `MOV` accede directamente al contenido[cite: 3].
- Las operaciones lógicas como `AND` y `TEST` son herramientas poderosas para el filtrado de bits y la toma de decisiones sin alterar los datos originales[cite: 3].
- El depurador DEBUG es esencial para validar que el flujo de control (saltos) se comporta según la lógica del programador[cite: 3].
