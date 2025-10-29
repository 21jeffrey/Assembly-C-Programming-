; nasm -felf64 sum_25_to_15.asm && ld -o sum_25_to_15 sum_25_to_15.o

global _start
section .data
    msg db "Sum: "
    msg_len equ $-msg
    num_buf db "00000", 10, 0 ; buffer for number and newline

section .text

_start:
    mov     rax, 0          ; sum
    mov     rbx, 25         ; i = 25
.loop:
    add     rax, rbx        ; sum += i
    dec     rbx             ; i--
    cmp     rbx, 14         ; continue while i >= 15
    jg      .loop

    ; Convert rax (sum) to ASCII decimal in num_buf
    mov     rcx, 5           ; 5 digits max
    mov     rbx, rax         ; sum to rbx
    mov     rsi, num_buf
    add     rsi, 4           ; point to last digit
convert:
    mov     rdx, 0
    mov     rax, rbx
    div     qword [ten]
    add     dl, '0'
    mov     [rsi], dl
    dec     rsi
    mov     rbx, rax
    loop    convert

    ; Write "Sum: "
    mov     rax, 1           ; sys_write
    mov     rdi, 1           ; stdout
    mov     rsi, msg
    mov     rdx, msg_len
    syscall

    ; Write number and newline
    mov     rax, 1           ; sys_write
    mov     rdi, 1           ; stdout
    mov     rsi, num_buf
    mov     rdx, 6           ; 5 digits + newline
    syscall

    mov     rax, 60          ; sys_exit
    xor     rdi, rdi
    syscall

section .data
ten:    dq 10
