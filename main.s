.global _start

.section .data
sockaddr:
    .word 2          # AF_INET
    .word 0x5000     # port 80 (network byte order)
    .long 0          # INADDR_ANY
    .quad 0          # padding

_start:
    mov $41, %rax      # syscall number: socket
    mov $2,  %rdi      # AF_INET (IPv4)
    mov $1,  %rsi      # SOCK_STREAM (TCP)
    xor %rdx, %rdx     # protocol = 0
    syscall            # socket(...)

    mov %rax, %rdi

    mov $49, %rax
    lea sockaddr(%rip), %rsi
    mov $16, %rdx
    syscall

    mov $60, %rax      # syscall number: exit
    xor %rdi, %rdi     # exit status = 0
    syscall
