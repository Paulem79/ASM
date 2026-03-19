# Output to ../outs/
nasm -f elf64 hello.asm -o ../outs/hello_asm.o
ld ../outs/hello_asm.o -o ../outs/hello_asm
../outs/hello_asm