; Interpret as 64 bits code
[bits 64]

section .text
global map
global reduce

; Function: map
;void map(int64_t *destination_array, int64_t *source_array, int64_t array_size, int64_t(*f)(int64_t));
map:
    push rbp
    mov rbp, rsp
    push r12

    ; parametrii:
    ; rdi: destination_array
    ; rsi: source_array
    ; rdx: array_size
    ; rcx: function f

    ; aux pt destination
    mov r10, rdi
    ; i=0
    xor r11, r11

mapLoop:
    cmp r11, rdx
    ; if(i >= array_size) 
        ;exit 
    jge mapEnd

    ; bagam source_array[i] in rdi (argument pt f)
    mov rdi, [rsi + r11*8]
    ; call f(src[i])
    call rcx

    ; bag rezultatul in destination_array[i]
    mov [r10 + r11*8], rax

    ; i++
    inc r11
    jmp mapLoop
    ;rez in rax
mapEnd:
    pop r12
    pop rbp
    ret

; Function: reduce
;int64_t reduce(int64_t *destination_array, int64_t *source_array, int64_t array_size, int64_t accumulator_initial_value, int64_t(*f)(int64_t, int64_t));

reduce:
    push rbp
    mov rbp, rsp
    push r13

    ; parametrii:
    ; rdi: destination_array dst
    ; rsi: source_array src
    ; rdx: array_size n
    ; rcx: accumulator_initial_value acc_init
    ; r8: function pointer f

    ; destination_array
    mov r10, rdi  
    ; source_array
    mov r11, rsi   
    ; array_size
    mov r12, rdx   
    ; acc = acc_init
    mov rax, rcx 
    ; i=0 
    xor r13, r13   

reduceLoop:
    cmp r13, r12
    ; if(i >= array_size)
        ;exit
    jge reduceEnd

    ; apelare f(acc, src[i])
    ; acc
    mov rdi, rax   
    ; src[i]
    mov rsi, [r11 + r13*8]  
    call r8

    ; i++
    inc r13
    jmp reduceLoop
    ;rez in rax
reduceEnd:
    pop r13
    pop rbp
    ret
