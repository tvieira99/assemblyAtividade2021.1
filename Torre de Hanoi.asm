%include "io.inc"
; referências:
;https://www.devmedia.com.br/torres-de-hanoi-solucao-recursiva-em-java/23738
;https://github.com/jorgehclinhares/torre-hanoi-nasm-x86/blob/master/hanoi.asm
;Por Thiago Vieira e Caio Silva
section .data
msg1: db "Digite o numero de anilhas"
msg2: db " -> "
newline: db 0xA
section .bss
var1 resb 3
aux1 resb 1
aux2 resb 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    call takeVar1Num
    ; Fazendo as barras
    push 0x0002 ; t
    push 0x0003 ; d
    push 0x0001 ; o
    push eax ; n
    call solveHanoi
    mov eax, 1
    mov ebx, 0
    int 0x80
takeVar1Num:
    mov eax, 3
    mov ebx, 0
    mov ecx, var1
    mov edx, 1
    int 0x80 ; sys_read call
    
    ;PEGA O NUMERO CERTO DE ANILHAS PARA A TORRE DE HANOI
    xor eax, eax
    mov eax, [var1]
    sub ax, 0x30
    mov [var1], eax
    ret
solveHanoi:
    enter 0, 0
    ;TOMA TODOS OS ARGUMENTOS.
    mov eax, [ebp + 8] ; valor de n
    mov ebx, [ebp + 0xC] ; valor de O
    mov ecx, [ebp + 0x10]; valor de D
    mov edx, [ebp + 0x14]; valor de T
    cmp eax, 0x0
    je SMI ; SEM MAIS ITERAÇÕES
    sub eax, 0x0001 ; subtrai um de n
    push ecx ; colocar D no lugar de T
    push edx ; colocar T no lugar de D
    push ebx ; valor de O normal
    push eax ; valor de N-1 normal N-1 sempre vai estar em ultimo
    call solveHanoi ; CHAMA A RECURSÃO
    
    call printRes
    mov eax, [ebp + 8] ; valor de n
    sub eax, 0x0001 ; subtrai um de n
    mov ebx, [ebp + 0xC] ; valor de O
    mov ecx, [ebp + 0x10]; valor de D
    mov edx, [ebp + 0x14]; valor de T
    push ebx ; colocar O no lugar de T
    push ecx ; valor de D normal
    push edx ; valor de T no lugar de O
    push eax ; valor de N-1 normal N-1 sempre vai estar em ultimo
    call solveHanoi
    ;je FIM
SMI:
    leave
    ret
printRes:
    enter 0,0
    
    mov eax, 4
    mov ebx, 1
    ;PEGANDO O O
    mov ecx, [ebp + 0xC]
    add ecx, 0x30
    mov [aux1], ecx
    mov ecx, aux1
    
    mov edx, 1
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, 4
    int 0x80
    
    
    mov eax, 4
    mov ebx, 1
    ;PEGANDO O D
    mov ecx, [ebp + 0x14]
    add ecx, 0x30
    mov [aux2], ecx
    mov ecx, aux2
    
    mov edx, 1
    int 0x80
    ;; new line
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80    
    
    leave
    ret
    
    
    