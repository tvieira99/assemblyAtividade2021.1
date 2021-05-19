%include "io.inc"
;COMPARA A PRIMEIRA ENTRADA COM A SEGUNDA: <num1> cmp <num2>

section .data
    msg1: db 'MAIOR'
    msg2: db 'MENOR'
    msg3: db 'IGUAL'
    msg3_length equ $-msg3
    var1: db 1
    var2: db 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    call takeVar1
    call takeVar2
    call giveResult
    ret
takeVar1:
    mov eax, 3
    mov ebx, 0
    mov ecx, var1
    mov edx, 1
    int 80h
    ret
takeVar2:
    mov eax, 3
    mov ebx, 0
    mov ecx, var2
    mov edx, 1
    int 0x80
    ret
giveResult:
    mov bl, byte [var1]
    mov cl, byte [var2]
    cmp bl, cl
    jg greater
    jmp lowerOrEqual
greater:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, 5
    int 0x80
    mov eax, 1
    int 0x80
lowerOrEqual:
    cmp bl,cl
    je Equal
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, 5
    int 0x80
    mov eax, 1
    int 0x80
Equal:
    mov eax,4
    mov ebx,1
    mov ecx, msg3
    mov edx, 5
    int 0x80
    mov eax, 1
    int 0x80