section .data
    max_value equ 99999
    array_size equ (max_value >> 4) + 1

section .bss
    sieve_array resb array_size

section .text
    global _start

_start:
    ; Initialize the sieve array
    mov ecx, array_size
    mov edi, sieve_array
    xor eax, eax
init_loop:
    mov [edi], al
    inc edi
    loop init_loop

    ; Set the first two bits (0 and 1) to 1 as they are not prime
    mov byte [sieve_array], 0b11000000

    ; Main loop for Sieve of Eratosthenes
    mov esi, 2  ; Current prime candidate
sieve_loop:
    cmp esi, max_value
    jnbe end_program

    ; If the current number is prime, mark its multiples as not prime
    mov edx, esi
    imul edx, esi
    mov ecx, edx
mark_multiples:
    cmp ecx, max_value
    jnbe next_prime

    ; Mark the current multiple as not prime
    mov ebx, ecx
    shr ebx, 4
    mov al, [sieve_array + ebx]
    bts dword [sieve_array + ebx], edx
    add ecx, esi
    jmp mark_multiples

next_prime:
    ; Find the next prime number
    mov eax, esi
    add eax, 1
    mov esi, eax
    jmp sieve_loop

end_program:
    ; Print the prime numbers
    mov esi, 2  ; Restart from 2
print_loop:
    cmp esi, max_value
    jnbe end_program

    ; Check if the current number is prime
    mov edx, esi
    shr edx, 4
    mov al, [sieve_array + edx]
    btr dword [sieve_array + ebx], edx
    bts dword [sieve_array + ebx], edx
    jnc not_prime

    ; Print the prime number
    mov eax, esi
    call print_number
    mov eax, 0xA  ; Newline character
    call print_char

not_prime:
    ; Move to the next number
    add esi, 1
    jmp print_loop

print_char:
    ; System call to print a character
    mov eax, 4
    mov ebx, 1
    lea ecx, [eax]
    mov edx, 1
    int 0x80
    ret

print_number:
    ; System call to print a number
    mov eax, 4
    mov ebx, 1
    lea ecx, [eax]
    mov edx, 1
    int 0x80
    ret
