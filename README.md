# x86-Assembly

TASK1

Adresa sirului de caractere pe care il verific este in epb+8

ecx este contorul

esi este pointer la sirul de caractere

il fac pe eax 0

loop:

se baga in al primul caractere

ma asigur ca nu este '\\0'

verific ce tip de paranteza este, iar daca nu este nicio paranteze trec la umratorul caracter

sa spunem ca este '\[', se face jump la open\_paranthesis

incrementam contorul (ecx), si pointerul la sir (esi), adica trecem la umratorul caracter

ne intoarcem in loop

sa spunem ca este '}', se face jump la close\_paranthesis

decrementam conotrul (ecx), si incrementam pointerul la sir (esi)

ne intoarcem in loop

cand se ajunge la '\\0' se iese din loop

end\_loop:

verificam daca ecx este 0

daca nu este 0 se returneaza 1

altfel se face xor eax, eax, deci se retunreaza 0

BONUS

map:

; parametrii:

; rdi: destination\_array

; rsi: source\_array

; rdx: array\_size

; rcx: function f

fac un aux pentru destination\_array in r10

r11 este contorul si il fac 0

mapLoop:

verific daca contorul este mai mare decat marimea efectiva

daca da fac jmp la mapEnd

bag source\_array\[i\] in rdi (argument pt f) -> mov rdi, \[rsi + r11\*8\]

apelez f

rezultatul il pun in destination\_array\[i\] adica r10 + r11\*8

incrementez i adica r11

si continui sa fac acest mapLoop

mapEnd:

restaurez stiva

reduce:

; parametrii:

; rdi: destination\_array dst

; rsi: source\_array src

; rdx: array\_size n

; rcx: accumulator\_initial\_value acc\_init

; r8: function pointer f

fac un aux pentru destination\_array in r10

fac un aux pentru source\_array in r11

fac un aux pentru array\_size in r12

fac un aux pentru acc\_init in rax

r13 = i = 0

reduceLoop:

verific daca contorul este >= array\_size

daca da jmp reduceEnd

restaurez stiva

pun rax in rdi (pentru a avea in rdi acel acc din f(acc, src\[i\]))

pun in rsi src\[i\](r11 + r13\*8)

apelez f, r8

incrementez i

jump la reduceLoop
