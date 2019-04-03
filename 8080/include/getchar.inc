; nacitanie znaku z klavesnice
; vysledok v reg. A

getchar:
    in 10h
    ani 1 ; test status byte if char is ready
    jz getchar
    in 11h 	; read char
    out 11h	; echo char
    ret