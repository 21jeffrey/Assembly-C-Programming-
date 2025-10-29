; nasm -felf64 fact_asm.asm
; gcc -no-pie -o call_asm main_call_asm.c fact_asm.o

section .note.GNU-stack noalloc noexec nowrite progbits

global fact_asm
section .text
; uint64_t fact_asm(uint32_t n)
fact_asm:
    ; rdi = n (zero-extended from edi)
    mov     eax, 1              ; res = 1 (rax is return reg)
    test    edi, edi            ; if n == 0, return 1
    jz      .done

    mov     ecx, edi            ; ecx = n
.loop:
    imul    rax, rcx            ; res *= i
    loop    .loop               ; dec ecx; jnz .loop
.done:
    ret
