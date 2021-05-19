%include "io.inc"
section .data
 
section .text
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    call CONTROLLOOP
    ret
CONTROLLOOP:
    inc eax
    cmp eax, ecx
    jne SOBREEAXECX
    mov edx, 10
    jmp BODY
    SOBREEAXECX:
        mov edx, 20
    BODY:
        cmp eax,ebx
        jg CONTROLLOOP
    
    