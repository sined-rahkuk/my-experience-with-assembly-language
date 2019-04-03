org 1000
; Na??tajte z kl?vesnice re?azec znakov ukon?en? znakom "nov?ho riadku". Slov? vo vstupe s? oddelen? najmenej jedn?m znakom "medzera". Uva?ujte aj prv?, resp. posledn? slovo vstupu. Ur?te po?et slov obsahuj?cich len p?smen? malej abecedy. Po?et (0-255) vytla?te osmi?kovo.
dcx sp			; inicializacia zasobnika (0FFFFh)
jmp init

init:
	mvi c,0	    ; matched_words_amount = 0
	mvi b,0     ; conditions_broken = 0
	mvi l,0     ; in_word_indicator = 0
	jmp in_word_loop

words_amount_increment:
	inr c
ret

increment_broken:
	inr b
	jmp in_word_loop

check_new_line:
	call check
	jmp end

check_space:
	call check
	jmp in_word_loop

check:
	mov a,l
	cpi 0
		jnz reset_and_check
ret

reset_and_check:
	mov a,b
	cpi 0
		cz words_amount_increment
	mvi l,0     ; in_word_indicator = 0
	mvi b,0     ; conditions_broken = 0
ret

in_word_loop:
	call getchar
	mov h, a ; zachovam si char
	cpi 10			
		cz check_new_line ; koniec vstupu?
	cpi 13
		cz check_new_line ; koniec vstupu?
	cpi 32      ; space?
		jz check_space
	mvi l,1
	mov a,h
	cpi 'a' 
		jc increment_broken	; menej ako 'a'?	
	cpi 'z'+1
		jnc increment_broken	; viac ako 'z'+1?
	jmp in_word_loop

end:
	call newline
	mov a,c			; 1000 1010 if с = 138d
	; adi '0'			; hodnota a jej ASCII tvar ...
	; beriem horne 2 bity (najvacsie) 
	; tzn AND s 1100 0000 
	ani 0C0H
	; shift doprava na 6 miest abo 2 krat otocim do lava
	rlc
	rlc
	; vypisem starsie cislo osmickovo 
	adi '0'
	call putchar
	; bity 3-5
	mov a, c
	; tzn AND s 00111000
	ani 038H
	; shift do prava na 3
	rrc
	rrc
	rrc
	; vypisem strednu cislicu
	adi '0'
	call putchar
	; beriem bity 6-8
	mov a, c
	; AND s 00000111
	ani 07H
	; vypisem
	adi '0'
	call putchar

	mvi a, 'o'
	call putchar
	
	hlt


include 'examples\8080\include\putchar.inc'
include 'examples\8080\include\getchar.inc'
include 'examples\8080\include\newline.inc'


; text1: db 'Pocet slov v malom registre ...',10,13,'Vloz text: ',0
; text2: db 10,13,'slov: ',0
; vlozeny: ds 30