BITS 64

%define SYS_WRITE 1
%define SYS_EXIT 60

section .data
    msg1 db 'Hello, World!', 0xA
    len1 equ $ - msg1
    
    msg2 db 'Assembleur est puissant.', 0xA
    len2 equ $ - msg2

section .text
    global _start

_start:
    ; --- Afficher le premier message ---
    mov rdi, msg1       ; Arg 1 : Adresse de la chaîne
    mov rsi, len1       ; Arg 2 : Longueur
    call _print

    ; --- Afficher le deuxième message ---
    mov rdi, msg2
    mov rsi, len2
    call _print

    ; Exit
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall

; ---------------------------------------------------------
; _print : Affiche une chaîne de caractères
; Entrée : RDI = adresse du message, RSI = longueur
; ---------------------------------------------------------
_print:
    mov rdx, rsi        ; On déplace la longueur dans RDX (requis par syscall)
    mov rsi, rdi        ; On déplace l'adresse dans RSI (requis par syscall)
    mov rax, SYS_WRITE
    mov rdi, 1          ; File Descriptor (stdout)
    syscall
    ret