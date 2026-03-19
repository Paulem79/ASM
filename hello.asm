BITS 64

%define SYS_WRITE 1
%define SYS_EXIT 60

section .data
    ; IMPORTANT : Ajout du , 0 à la fin pour marquer la fin de la chaîne (null-terminated)
    msg1 db 'Hello, World!', 0xA, 0
    msg2 db 'Assembleur est puissant.', 0xA, 0

section .text
    global _print

_print:
    ; 1. Calcul de la longueur
    mov rsi, rdi        ; On garde l'adresse de départ dans RSI pour le futur syscall
    xor rdx, rdx        ; RDX servira de compteur (longueur)

.count_loop:
    cmp byte [rdi + rdx], 0 ; Vérifie le caractère à l'adresse (RDI + RDX)
    je .count_done          ; Si c'est 0, on a fini
    inc rdx                 ; Sinon, longueur++
    jmp .count_loop

.count_done:
    ; 2. Appel système SYS_WRITE
    ; RDX contient déjà la longueur calculée
    ; RSI contient déjà l'adresse du message
    mov rax, SYS_WRITE
    mov rdi, 1              ; File Descriptor 1 (stdout)
    syscall
    ret