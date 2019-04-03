; Bubble sort 10 numbers in place
%include "asm_io.inc"

segment .data
hlaska db "im here",0
dlzka db "Dlzka inputu je: ",0
last_el db "Posledny element je: ",0
; nums  db 3,7,9,1,8,2,4,5,3,6,10
count dw 0       ; One less than count of the array.

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
    call print_as_hex
    popa
    mov EAX, 0
    leave
    ret

print_arr_length:
  pusha

  mov edx, nums
  mov ebx, count

  call print_nl
  mov eax, dlzka
  call print_string
  mov eax, [ebx]
  add eax, '0'
  call print_char
  popa
    ret


print_as_hex:
    pusha
    mov esi, nums
    xor ecx, ecx ; counter = 0

    digit_loop:
        mov eax, [esi]

        and al, 0xF0
        shr al, 4
        call hex
        call print_char

        mov eax, [esi]
        and al, 0x0F
        call hex
        call print_char

        mov al, 'h'
        call print_char
        mov al, ' '
        call print_char


        inc esi
        inc ecx
        cmp ecx, [count]
        jl digit_loop

    popa
    ret

hex:
  ; assume the value is in al
  cmp al, 10d
  jl no_need
  sub al, 10d
  add al, 'A'
  ret

  no_need:
  add al, '0'
  ret

sort_bubble:
    pusha

    mov edx,0
    mov eax, 4
sort:
    mov bl,byte[nums+eax]
    mov cl,byte[nums+eax+1]
    cmp bl,cl
    jl dontswap
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