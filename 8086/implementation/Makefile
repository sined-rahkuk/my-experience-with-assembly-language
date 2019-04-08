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

binary:
	nasm -f win32 program1.asm
	gcc -o program1 program1.obj driver.c asm_io.obj
	./program1	

hex: asm_io.obj
	nasm -f win32 program.asm
	gcc -o program program.obj driver.c asm_io.obj
	./program	