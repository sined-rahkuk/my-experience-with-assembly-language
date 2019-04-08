; Bubble sort 10 numbers in place
%include "asm_io.inc"

segment .data
count dw 0       

segment .bss
nums resb 20

segment .text
    global _asm_main

_asm_main:
    enter 0,0
    pusha

    mov esi, nums
    @input_loop:
    call read_char
    cmp eax, ' '
    jz @input_loop
    cmp eax, 10
    jz @end_input_loop
    cmp eax, 13
    jz @end_input_loop
    ; greater digit to convert and store in edx
    sub eax, '0'
    mov ecx, 10
    mul ecx
    mov edx, eax
    ; second digit to conver, add and store

    call read_char
    sub eax, '0'
    add edx, eax
    ; store normal number in memory
    mov [esi], edx
    inc esi
    jmp @input_loop

    @end_input_loop:
    ; Store array size in memory
    sub esi, nums
    mov [count], esi

    call sort_bubble

    ; Print sorted result
    call print_binary
    popa
    mov EAX, 0
    leave
    ret


print_binary:
    pusha
    mov esi, nums
    xor ecx, ecx ; counter = 0

    digit_loop:
        mov eax, [esi]

        call binary_digit_print

        mov al, 'b'
        call print_char
        mov al, ' '
        call print_char


        inc esi
        inc ecx
        cmp ecx, [count]
        jl digit_loop

    popa
    ret

binary_digit_print:
    pusha

    and al, 10000000b
    shr al, 7
    add al, '0'
    call print_char

    mov al, [esi]
    and al, 01000000b
    shr al, 6
    add al, '0'
    call print_char

    mov al, [esi]
    and al, 00100000b
    shr al, 5
    add al, '0'
    call print_char
    
    mov al, [esi]
    and al, 00010000b
    shr al, 4
    add al, '0'
    call print_char

    mov al, [esi]
    and al, 00001000b
    shr al, 3
    add al, '0'
    call print_char

    mov al, [esi]
    and al, 00000100b
    shr al, 2
    add al, '0'
    call print_char

    mov al, [esi]
    and al, 00000010b
    shr al, 1
    add al, '0'
    call print_char

    mov al, [esi]
    and al, 00000001b
    add al, '0'
    call print_char

    popa
    ret

sort_bubble:
    pusha

    mov edx,0
    mov eax, 4
sort:
    mov bl,byte[nums+eax]
    mov cl,byte[nums+eax+1]
    cmp bl,cl
    jg dontswap
    mov byte[nums+eax+1],bl
    mov byte[nums+eax],cl
    dontswap:
    add eax,1
    mov bl,byte[count]
    sub bl,1
    cmp al,bl
    jne sort
    mov eax,0
    add edx,1
    mov bl,byte[count]
    add bl,1
    cmp dl,bl
    jne sort


    popa
    ret