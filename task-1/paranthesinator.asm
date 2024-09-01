;[bits 32]

%include "../include/io.mac"

section .text
; int check_parantheses(char *str)
global check_parantheses
check_parantheses:
    push ebp
    mov ebp, esp
    ; 4 octeti pentru adresa
    sub esp, 4    
    ; adresa sirului este stocată la epb+8
    mov eax, [ebp+8]  
    ; ecx este contor
    xor ecx, ecx  
    ; esi pointeaza la sir
    mov esi, eax  
    ; ma asigur vca in eax este 0
    xor eax, eax
loop:
    ; bagam caracterul curent in al
    mov al, byte[esi]  
    ; verific daca am ajuns la '\0'
    cmp al, 0           
    je end_loop
    ; verific daca este o paranteza deschisa
    cmp al, '('         
    je open_parenthesis
    cmp al, '['         
    je open_parenthesis
    cmp al, '{'         
    je open_parenthesis
    ; verific daca este o paranteza inchisa
    cmp al, ')'         
    je close_parenthesis
    cmp al, ']' 
    je close_parenthesis
    cmp al, '}'
    je close_parenthesis
    ; trecem la urm caracter
    inc esi
    jmp loop

open_parenthesis:
    ; contor pt paranteze deschise
    inc ecx 
    ; trecem la urm caracter
    inc esi  
    jmp loop

close_parenthesis:
    ; ecx--
    dec ecx  
    ; verific daca am gasit mai multe paranteze inchise decât deschise
    cmp ecx, 0  
    jl invalid_parentheses
    ; trecem la urm caracter
    inc esi  
    jmp loop

invalid_parentheses:
    ; ret 1 pentru rezultat gresit
    mov eax, 1  
    jmp end_check

end_loop:
    ; paranteze deschise neinchise
    cmp ecx, 0  
    jnz invalid_parentheses
    ; ret 0 pt corect
    xor eax, eax

end_check:
    mov esp, ebp
    pop ebp
    ret