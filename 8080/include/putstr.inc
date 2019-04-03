; vypis retazca na obrazovku terminalu
; retazec specifikovany adresou v reg. pare HL
; koniec retazca - znak 0

putstr:
    mov a, m
    inx h
    cpi 0
    rz
    out 11h
    jmp putstr
