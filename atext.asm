[BITS 16]
[ORG 0x7C00]

start:

    xor ax, ax
    mov ds, ax
    mov es, ax


    mov si, welcome
.print_loop:
    lodsb
    or al, al
    jz .input_loop
    call print_char
    jmp .print_loop

.input_loop:

    call get_key

    call print_char
    jmp .input_loop


print_char:
    mov ah, 0x0E
    mov bh, 0x00
    mov bl, 0x07
    int 0x10
    ret


get_key:
    xor ah, ah
    int 0x16
    ret

welcome db "assemblytext 1.0", 13, 10, 0


times 510-($-$$) db 0
dw 0xAA55
