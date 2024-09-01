# x86-Assembly

# README

## TASK 1

Acest task implică verificarea unui șir de caractere folosind limbajul de asamblare. Iată o explicație detaliată a procesului:

### Prezentare generală

- **epb+8**: Adresa șirului de caractere care trebuie verificat.
- **ecx**: Contorul.
- **esi**: Pointer către șirul de caractere.
- **eax**: Inițial setat la 0.

### Pași

1. **Inițializare**:
   - Setează `eax` la 0.

2. **Loop**:
   - Încarcă primul caracter în `al`.
   - Asigură-te că `al` nu este `'\0'`.
   - Verifică tipul de paranteză. Dacă nu este nicio paranteză, treci la următorul caracter.
   - **Dacă `[`:**
     - Jump la `open_paranthesis`.
     - Incrementăm `ecx` și `esi`.
     - Ne întoarcem în loop.
   - **Dacă `}`:**
     - Jump la `close_paranthesis`.
     - Decrementăm `ecx` și incrementăm `esi`.
     - Ne întoarcem în loop.

3. **Sfârșitul Loop-ului**:
   - Când se întâlnește `'\0'`, ieșim din loop.
   - Verificăm dacă `ecx` este 0:
     - Dacă nu este 0, returnăm 1.
     - Altfel, facem `xor eax, eax` și returnăm 0.

## BONUS

### Funcția Map

- **Parametri**:
  - `rdi`: Array-ul de destinație.
  - `rsi`: Array-ul sursă.
  - `rdx`: Dimensiunea array-ului.
  - `rcx`: Funcția `f`.

1. **Inițializare**:
   - Folosește `r10` ca auxiliar pentru array-ul de destinație.
   - Setează `r11` (contor) la 0.

2. **Loop**:
   - Verifică dacă contorul este mai mare decât dimensiunea efectivă. Dacă da, jump la `mapEnd`.
   - Încarcă `source_array[i]` în `rdi` (argument pentru `f`) folosind `mov rdi, [rsi + r11*8]`.
   - Apelează funcția `f`.
   - Stochează rezultatul în `destination_array[i]`, adică `r10 + r11*8`.
   - Incrementează contorul `r11`.
   - Continuă loop-ul.

3. **Sfârșit**:
   - Restaurează stiva.

### Funcția Reduce

- **Parametri**:
  - `rdi`: Array-ul de destinație `dst`.
  - `rsi`: Array-ul sursă `src`.
  - `rdx`: Dimensiunea array-ului `n`.
  - `rcx`: Valoarea inițială a accumulator-ului `acc_init`.
  - `r8`: Pointer-ul către funcție `f`.

1. **Inițializare**:
   - Folosește `r10` ca auxiliar pentru array-ul de destinație.
   - Folosește `r11` ca auxiliar pentru array-ul sursă.
   - Folosește `r12` ca auxiliar pentru dimensiunea array-ului.
   - Folosește `rax` ca auxiliar pentru valoarea inițială a accumulator-ului.
   - Setează `r13` (contor) la 0.

2. **Loop**:
   - Verifică dacă contorul este mai mare sau egal cu dimensiunea array-ului. Dacă da, jump la `reduceEnd`.
   - Încarcă `rax` în `rdi` (pentru a avea `acc` în `f(acc, src[i])`).
   - Încarcă `src[i]` în `rsi` folosind `mov rsi, [r11 + r13*8]`.
   - Apelează funcția `f` folosind `r8`.
   - Incrementează contorul `r13`.
   - Continuă loop-ul.

3. **Sfârșit**:
   - Restaurează stiva.
