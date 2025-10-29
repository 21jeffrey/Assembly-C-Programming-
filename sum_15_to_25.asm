global _start

section .bss
    result resb 4      ; buffer for sum string + newline

section .text
_start:
    mov rcx, 15        ; start value
    mov rbx, 0         ; sum

sum_loop:
    add rbx, rcx
    inc rcx
    cmp rcx, 26        ; end at 25
    jl sum_loop

    ; Convert rbx (sum) to string
    mov rax, rbx
    mov rsi, result
    mov rcx, 0

convert_loop:
    mov rdx, 0
    mov rbx, 10
    div rbx            ; rax /= 10, rdx = remainder
    add dl, '0'
    mov [rsi + rcx], dl
    inc rcx
    test rax, rax
    jnz convert_loop

    ; Reverse string
    mov rdi, result
    mov rsi, result
    add rsi, rcx
    dec rsi
reverse_loop:
    cmp rdi, rsi
    jge done_reverse
    mov al, [rdi]
    mov bl, [rsi]
    mov [rdi], bl
    mov [rsi], al
    inc rdi
    dec rsi
    jmp reverse_loop
done_reverse:

    ; Add newline
    mov byte [result + rcx], 10
    inc rcx

    ; Print
    mov rax, 1         ; sys_write
    mov rdi, 1         ; stdout
    mov rsi, result    ; buffer
    mov rdx, rcx       ; length
    syscall

    mov rax, 60        ; sys_exit
    xor rdi, rdi
    syscall
