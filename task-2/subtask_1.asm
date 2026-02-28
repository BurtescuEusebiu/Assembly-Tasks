; subtask 1 - qsort
section .data
    i dd 0
    low dd 0
    pivot dd 0
section .text
    global quick_sort
    ;; no extern functions allowed

quick_sort: ;quick_sort(buff, 0, len - 1);

    ;; create the new stack frame
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov dword [i],0
    mov eax,[ebp+8] ;buff
    mov ebx,[ebp+12] ;0
    mov ecx,[ebp+16] ;len-1
    ;; save the preserved registers
    mov [low],ebx
    cmp ebx,ecx
    jge end
    mov edx,eax
    mov esi,ecx
    shl esi,2
    add edx,esi ;; adresa pivotului
    mov [pivot],edx

    
    mov [i],ebx

bucla:
    cmp ebx,ecx
    jge endBucla
    mov esi,[eax+ebx*4];; arr[j]
    mov edi,[i]
    shl edi,2
    add edi,eax
    mov edi,[edi];;arr[i]
    mov edx,[pivot]
test:    
    cmp esi,[edx]
    jge skipswap
    
    mov edx,edi
    ; mov edi,eax
    ; add edi,[i] 
    mov edi,[i]
    shl edi,2
    add edi,eax

    mov [edi],esi ;; arr[i] -> arr[j]

    mov esi,eax
    mov edi,ebx
    shl edi,2
    add esi,edi 
    mov[esi],edx;; arr[j] -> arr[i]

    

    mov edx,[i]
    inc edx
    mov [i],edx

skipswap:

    inc ebx
    jmp bucla
endBucla:
    mov edi,[i];;arr[i]
    shl edi,2
    add edi,eax
    mov edi,[edi]
    mov esi,[pivot] ;;arr[pivot]
    mov edx,[esi]
    mov esi,[pivot]
    mov [esi],edi 

    mov edi,[i]
    shl edi,2
    add edi,eax
    mov [edi],edx
    ;;swap final

pushing:

    mov edx,[i] ;pivot
    push ecx ;high
    inc edx ;pivot + 1
    push edx ;pivot
    push eax
    dec edx
    dec edx ;pivot - 1
    push edx
    mov esi,[low] 
    push esi ;low
    push eax ;arr
push_test:
    call quick_sort
    add esp, 12
    call quick_sort
    add esp, 12
    ;; recursive qsort implementation goes here
end:
    ;; restore the preserved registers
    pop edi
    pop esi
    pop ebx
    leave
    ret
