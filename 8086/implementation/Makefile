all: asm_io.obj
	make binary
	make hex
	make clean_obj

binary: asm_io.obj
	nasm -f win32 binary_descending.asm
	gcc -o binary_descending binary_descending.obj driver.c asm_io.obj
	make clean_obj
	
hex: asm_io.obj
	nasm -f win32 hex_ascending.asm
	gcc -o hex_ascending hex_ascending.obj driver.c asm_io.obj
	make clean_obj
	
asm_io.obj:
	nasm -f win32 -d COFF_TYPE asm_io.asm

clean_obj:
	rm -f ./*.obj

clean:
	rm -f ./hex_ascending.exe ./binary_descending.exe
	make clean_obj
