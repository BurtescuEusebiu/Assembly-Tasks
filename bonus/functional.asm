; Interpret as 64 bits code
[bits 64]

; nu uitati sa scrieti in feedback ca voiati
; assembly pe 64 de biti

section .text
global map
global reduce
;void map(int64_t *destination_array, int64_t *source_array, int64_t array_size, int64_t(*f)(int64_t));
;int64_t map_func1(int64_t curr_elem);

map:
    ; look at these fancy registers
    push rbp
    mov rbp, rsp
    ; rdi = dest_arr
    ; rsi = src_arr
    ; rdx = array_size
    ; rcx = f()
    ; sa-nceapa turneu'
    dec rdx
bucla:
    test rdx,rdx
    js endBucla
    mov rbx, [rsi + 8 * rdx]

    push rdi ;salvam pe stack val lui rdi
    mov rdi,rbx ; punem in rdi valoarea lui rbx pt call 
    call rcx
    pop rdi

    mov [rdi + 8 * rdx],rax

    dec rdx
    jmp bucla
endBucla:
    leave
    ret


; int reduce(int *dst, int *src, int n, int acc_init, int(*f)(int, int));
; int f(int acc, int curr_elem);
reduce:
    ; look at these fancy registers
    push rbp
    mov rbp, rsp
    ;int64_t reduce(int64_t *destination_array, int64_t *source_array, int64_t array_size, int64_t accumulator_initial_value, int64_t(*f)(int64_t, int64_t));
    ;int64_t reduce_func1(int64_t accumulator, int64_t current_elem);
    ;rdi = dest
    ;rsi = sourc
    ;rdx = sz
    ;rcx = acc
    ;r8 = f
    dec rdx
bulcaRed:
    test rdx,rdx
    js endRed
    push rdx
    push rdi ;;salvam valorile registrilor repsectivi
    push rsi
    mov rbx, [rsi + 8 * rdx]
    mov rsi,rbx ;;punem in primii registri argumentele functiei
    mov rdi,rcx 
    call r8
    pop rsi
    pop rdi
    pop rdx
    mov rcx,rax
    dec rdx
    jmp bulcaRed
    ; sa-nceapa festivalu'
endRed:
    leave
    ret

