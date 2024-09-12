[org 0x7c00]
;   /----------\
;   |kernel.asm|
;   \----------/

init:
    mov bh, 0
    mov bx, welcome_message

welcome_func:
    call print

print:
    mov ah, 0x0E    ; BIOS teletype output function
    mov al, [bx]
    inc bx

    cmp al, 0
    je done

    int 0x10

    jmp welcome_func

    ret

welcome_message db 'Hello', 0

done:

hlt

times 510 - ($ - $$) db 0 ; Fill the rest of the boot sector with zeros
dw 0xAA55              ; Boot sector signature