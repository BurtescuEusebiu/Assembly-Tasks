; Interpret as 32 bits code
[bits 32]

%include "../include/io.mac"

section .text
; int check_parantheses(char *str)
global check_parantheses
check_parantheses:
    push ebp
    mov ebp, esp
    ; sa-nceapa concursul
    mov eax,[esp+8] ; str
    xor edx,edx ;;()
    xor esi,esi ;;[]
    xor edi,edi ;;{}
bucla:
    test edx,edx
    js fals
    test esi,esi
    js fals
    test edi,edi
    js fals
    cmp byte[eax],0 ;\0
    je end

    cmp byte[eax],0x28 ;(
    jne skip1
    inc edx
skip1:
    cmp byte[eax],0x29 ;)
    jne skip2
    dec edx
skip2:
    cmp byte[eax],0x5B ;[
    jne skip3
    inc esi
skip3:
cmp byte[eax],0x5D ;]
    jne skip4
    dec esi
skip4:
    cmp byte[eax],0x7B ;{
    jne skip5
    inc edi
skip5:
cmp byte[eax],0x7D ;}
    jne skip6
    dec edi
skip6:
    inc eax
    jmp bucla

end:

    test edx,edx
    jnz fals
    test esi,esi
    jnz fals
    test edi,edi
    jnz fals

good:
    mov eax,0

    leave
    ret

fals: 
    mov eax,1
    leave
    ret
