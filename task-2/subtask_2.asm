; subtask 2 - bsearch

section .text
    global binary_search
    ;; no extern functions allowed

binary_search:
    ;; create the new stack frame
    enter 0, 0
    push esi
    push edi
    push ebx
    ;; save the preserved registers
    
    ;; recursive bsearch implementation goes here

    ;;binary_search(int32_t *buff, uint32_t needle, uint32_t start, uint32_t end); 
    ; ecx = buff
    ; edx = needle
    mov esi,[ebp+8] ;start
    mov edi,[ebp+12] ;end

    cmp esi,edi
    jg end

    mov ebx,edi
    sub ebx,esi
    shr ebx,1
    add ebx,esi ;;mid  
    mov ebx,[ecx+4*ebx];;arr[mid]

    cmp ebx,edx
    je gasit
    jl right

left:
    mov ebx,edi
    sub ebx,esi
    shr ebx,1
    add ebx,esi ;;mid  
    dec ebx
    push ebx
    push esi
    call binary_search
    add esp,8
    jmp fin
right:
    mov ebx,edi
    sub ebx,esi
    shr ebx,1
    add ebx,esi ;;mid  
    inc ebx
    push edi
    push ebx
    call binary_search
    add esp,8
    jmp fin

end:
    ;; restore the preserved registers
    mov eax,-1

    jmp fin


gasit:
    ;; restore the preserved registers
    mov ebx,edi
    sub ebx,esi
    shr ebx,1
    add ebx,esi ;;mid  
    mov eax,ebx

fin:
    pop ebx
    pop edi 
    pop esi
    leave
    ret