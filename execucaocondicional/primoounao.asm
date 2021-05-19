%include "io.inc"
;INDICAR SE O NUMERO E PRIMO: <NUM>(1 DIGITO)
section .data
msg1: db 'NAO E PRIMO'
msg2: db 'E PRIMO'
var1: db 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    xor edx, edx
    call takevar1
    xor eax, eax
    xor ebx, ebx
    mov bl, 2
    call PRIMOHANDLER
    ret
PRIMOHANDLER:
    xor eax, eax
    mov al, byte [var1]
    sub al, 0x30
    
    cmp al, 1 ; SAI LOGO SE O NUEMRO FOR 1
    je NAOPRIMO
    cmp al, bl ; sai se os dois numeros forem iguais, o numero e primo
    je PRIMO
    
    div bl
    cmp ah, 0  
    je NAOPRIMO
    inc bl
    call PRIMOHANDLER
takevar1:
    mov eax, 3
    mov ebx, 0
    mov ecx, var1
    mov edx, 1
    int 0x80
    ret
NAOPRIMO:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, 11
    int 0x80
    mov eax, 1
    int 0x80
PRIMO:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, 7
    int 0x80
    mov eax, 1
    int 0x80