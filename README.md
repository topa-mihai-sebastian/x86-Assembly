# x86-Assembly

# README

## TASK 1

This task involves verifying a string of characters using assembly language. Here's a detailed explanation of the process:

### Overview

- **epb+8**: The address of the string to be checked.
- **ecx**: Counter.
- **esi**: Pointer to the string.
- **eax**: Set to 0 initially.

### Steps

1. **Initialization**:
   - Set `eax` to 0.

2. **Loop**:
   - Load the first character into `al`.
   - Ensure that `al` is not `'\0'`.
   - Check the type of parenthesis. If it is not a parenthesis, move to the next character.
   - **If `[`:**
     - Jump to `open_paranthesis`.
     - Increment `ecx` and `esi`.
     - Return to the loop.
   - **If `}`:**
     - Jump to `close_paranthesis`.
     - Decrement `ecx` and increment `esi`.
     - Return to the loop.

3. **End of Loop**:
   - When `'\0'` is encountered, exit the loop.
   - Check if `ecx` is 0:
     - If not, return 1.
     - Otherwise, set `eax` to 0 and return 0.

## BONUS

### Map Function

- **Parameters**:
  - `rdi`: Destination array.
  - `rsi`: Source array.
  - `rdx`: Array size.
  - `rcx`: Function `f`.

1. **Initialization**:
   - Use `r10` as auxiliary for the destination array.
   - Set `r11` (counter) to 0.

2. **Loop**:
   - Check if the counter is greater than the array size. If true, jump to `mapEnd`.
   - Load `source_array[i]` into `rdi` (argument for `f`) using `mov rdi, [rsi + r11*8]`.
   - Call function `f`.
   - Store the result in `destination_array[i]`, which is `r10 + r11*8`.
   - Increment the counter `r11`.
   - Continue the loop.

3. **End**:
   - Restore the stack.

### Reduce Function

- **Parameters**:
  - `rdi`: Destination array `dst`.
  - `rsi`: Source array `src`.
  - `rdx`: Array size `n`.
  - `rcx`: Initial accumulator value `acc_init`.
  - `r8`: Function pointer `f`.

1. **Initialization**:
   - Use `r10` as auxiliary for the destination array.
   - Use `r11` as auxiliary for the source array.
   - Use `r12` as auxiliary for the array size.
   - Use `rax` as auxiliary for the initial accumulator value.
   - Set `r13` (counter) to 0.

2. **Loop**:
   - Check if the counter is greater than or equal to the array size. If true, jump to `reduceEnd`.
   - Load `rax` into `rdi` (to use `acc` in `f(acc, src[i])`).
   - Load `src[i]` into `rsi` using `mov rsi, [r11 + r13*8]`.
   - Call function `f` using `r8`.
   - Increment the counter `r13`.
   - Continue the loop.

3. **End**:
   - Restore the stack.
