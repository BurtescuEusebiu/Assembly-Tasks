%include "../include/io.mac"

; The `expand` function returns an address to the following type of data
; structure.
struc neighbours_t
    .num_neighs resd 1  ; The number of neighbours returned.
    .neighs resd 1      ; Address of the vector containing the `num_neighs` neighbours.
                        ; A neighbour is represented by an unsigned int (dword).
endstruc

section .bss
; Vector for keeping track of visited nodes.
visited resd 10000
global visited

section .data
; Format string for printf.
fmt_str db "%u", 10, 0
section .text
global dfs
extern printf

; C function signiture:
;   void dfs(uint32_t node, neighbours_t *(*expand)(uint32_t node))
; where:
; - node -> the id of the source node for dfs.
; - expand -> pointer to a function that takes a node id and returns a structure
; populated with the neighbours of the node (see struc neighbours_t above).
; 
; note: uint32_t is an unsigned int, stored on 4 bytes (dword).

dfs:
    push ebp
    mov ebp, esp
    push esi
    push edi 
    push ebx

    ; TODO: Implement the depth first search algorith, using the `expand`
    ; function to get the neighbours. When a node is visited, print it by
    ; calling `printf` with the format string in section .data.
    mov ebx,[ebp+8] ;node
    mov edx,[ebp+12] ;expand
    mov dword [visited+4*ebx],1
start:
    push edx

    push ebx
    push fmt_str ;;printare nod curent
    call printf
    add esp,4
    pop ebx

    pop edx 

    push edx
    push ebx
    call edx ;;apelam functia expand
    pop ebx
    pop edx
    mov edi,[eax] ;;nr noduri
    
    xor esi,esi
loop_noduri:
    cmp esi,edi 
    je done
    mov ebx,[eax + 4]
    mov ebx,dword [ebx + 4*esi]
    cmp dword [visited+ebx*4],0x0
    jne skip
apelare:
    push eax
    push edx
    push ebx
    call dfs
    pop ebx
    pop edx
    pop eax

skip:
    inc esi
    cmp esi,edi 
    jl loop_noduri
done:
    pop ebx
    pop edi 
    pop esi
    leave
    ret
