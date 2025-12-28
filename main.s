.global _start

_start:
    mov $41, %rax      # syscall number: socket
    mov $2,  %rdi      # AF_INET (IPv4)
    mov $1,  %rsi      # SOCK_STREAM (TCP)
    xor %rdx, %rdx     # protocol = 0
    syscall            # socket(...)

    mov $60, %rax      # syscall number: exit
    xor %rdi, %rdi     # exit status = 0
    syscall
