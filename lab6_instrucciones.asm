; lab6_instrucciones.asm - Demostración de categorías de instrucciones x86
; Compilar: nasm -f bin lab6_instrucciones.asm -o lab6_instrucciones.com

org 100h                ; Formato .COM empieza en el offset 100h

jmp inicio              ; Saltar sobre los datos

; --- SECCIÓN DE DATOS ---
valor_a     dw 45       ; Primer operando
valor_b     dw 12       ; Segundo operando
resultado   dw 0        ; Almacena resultado
contador    db 5        ; Para el bucle
mascara     db 0Fh      ; Máscara de bits bajos

inicio:
    ; --- BLOQUE 1: TRANSFERENCIA DE DATOS ---
    mov ax, [valor_a]   ; Carga 45 en AX
    mov bx, [valor_b]   ; Carga 12 en BX
    push ax             ; Preserva AX en la pila
    pop ax              ; Restaura AX

    ; --- BLOQUE 2: OPERACIONES ARITMÉTICAS ---
    add ax, bx          ; AX = 45 + 12 = 57 (39h en hex)
    mov [resultado], ax ; Guarda 57 en memoria
    
    ; --- BLOQUE 3: OPERACIONES LÓGICAS ---
    mov al, 0B7h        ; Carga B7h
    and al, [mascara]   ; AL AND 0Fh = 07h
    xor bx, bx          ; Poner BX en cero de forma eficiente

    ; --- BLOQUE 4: CONTROL DE FLUJO (IF/ELSE) ---
    mov ax, [valor_a]
    cmp ax, [valor_b]   ; Compara 45 con 12
    jg .mayor           ; Salta si 45 > 12
    jmp .fin_cmp

.mayor:
    mov cx, 1           ; Indicador: valor_a es mayor

.fin_cmp:
    ; --- BUCLE: SUMA ACUMULADA (1 a 5) ---
    xor ax, ax          ; Acumulador AX = 0
    mov cx, 5           ; Contador para LOOP
    mov bx, 1           ; Valor inicial
.bucle_suma:
    add ax, bx          ; AX += BX
    inc bx              ; Siguiente número
    loop .bucle_suma    ; Decrementa CX y salta si CX != 0
                        ; Al final AX = 15 (0Fh en hex)

    int 20h             ; Retorno a DOS[cite: 3]