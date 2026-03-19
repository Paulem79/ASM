# Supprimer et recréer le dossier de sortie
rm -rf outs
mkdir outs

# 1. Assembler le fichier ASM en objet 64 bits
nasm -f elf64 hello.asm -o outs/hello_asm.o

# 2. Compiler le fichier C en objet
gcc -c hello.c -o outs/hello_c.o

# 3. Lier les deux objets ensemble pour créer l'exécutable final
gcc outs/hello_c.o outs/hello_asm.o -o outs/hello

# 4. Exécuter
./outs/hello

cd ..