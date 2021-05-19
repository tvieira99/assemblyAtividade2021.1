%include "io.inc"
section .data
msg1: db 'PAR '
msg2: db 'NAO '
num: db 100

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    call LOOPHANDLER
    ret
LOOPHANDLER:
    xor eax, eax
    mov al, byte [num]
    mov bl, 2
    div bl
    call PRINTCHAR
    mov al, [num]
    inc al
    mov [num], al
    cmp al, 200
    je EXIT
    call LOOPHANDLER
EXIT:
    mov eax, 1
    int 0x80
PRINTCHAR:
    cmp ah, 0
    je PRINTCHARPAR
    jne PRINTCHARNPAR
PRINTCHARPAR:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, 4
    int 0x80
    ret
PRINTCHARNPAR:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, 4
    int 0x80
    ret