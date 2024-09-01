# x86-Assembly

# TASK 1

- Adresa șirului de caractere pe care îl verific este în `epb+8`.
- `ecx` este contorul.
- `esi` este pointerul la șirul de caractere.
- Inițializez `eax` cu 0.

## Loop

loop: se bagă în al primul caracter mă asigur că nu este '\0' verific ce tip de paranteză este; dacă nu este nicio paranteză, trec la următorul caracter

perl

dacă este '[':
    se face jump la `open_paranthesis`
    incrementăm contorul (`ecx`) și pointerul la șir (`esi`), adică trecem la următorul caracter
    ne întoarcem în `loop`

dacă este '}':
    se face jump la `close_paranthesis`
    decrementăm contorul (`ecx`) și incrementăm pointerul la șir (`esi`)
    ne întoarcem în `loop`

când se ajunge la `'\0'`, se iese din `loop`

shell


## End Loop

end_loop: verificăm dacă ecx este 0 dacă nu este 0, se returnează 1 altfel, facem xor eax, eax, deci se returnează 0

markdown


# BONUS

## `map`

- Parametrii:
  - `rdi`: `destination_array`
  - `rsi`: `source_array`
  - `rdx`: `array_size`
  - `rcx`: `function f`

fac un auxiliar pentru destination_array în r10

r11 este contorul și îl fac 0

mapLoop: verific dacă contorul este mai mare decât mărimea efectivă dacă da, fac jmp la mapEnd

go

bag `source_array[i]` în `rdi` (argument pentru `f`) -> `mov rdi, [rsi + r11*8]`
apelez `f`

rezultatul îl pun în `destination_array[i]`, adică `r10 + r11*8`

incrementăm `i`, adică `r11`
și continuăm să facem acest `mapLoop`

shell


## `mapEnd`

mapEnd: restaurez stiva

markdown


## `reduce`

- Parametrii:
  - `rdi`: `destination_array dst`
  - `rsi`: `source_array src`
  - `rdx`: `array_size n`
  - `rcx`: `accumulator_initial_value acc_init`
  - `r8`: `function pointer f`

fac un auxiliar pentru destination_array în r10 fac un auxiliar pentru source_array în r11 fac un auxiliar pentru array_size în r12 fac un auxiliar pentru acc_init în rax r13 = i = 0

reduceLoop: verific dacă contorul este >= array_size dacă da, fac jmp la reduceEnd restaurez stiva

go

pun `rax` în `rdi` (pentru a avea în `rdi` acel `acc` din `f(acc, src[i])`)
pun în `rsi` `src[i]` (`r11 + r13*8`)
apelez `f`, `r8`

incrementăm `i`
fac `jump` la `reduceLoop`
