all: asm_io.obj
	nasm -f win32 program.asm
	gcc -o program program.obj driver.c asm_io.obj
	./program	
asm_io.obj:
	nasm -f win32 -d COFF_TYPE asm_io.asm
program.obj:
	nasm -f win32 program.asm
clean:
	rm ./*.obj ./program.exe