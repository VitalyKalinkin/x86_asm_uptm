.386
.model flat, C

.code
adder_asm	PROC
            ; prolog
            push ebp
            mov ebp, esp
            
            ; actual code
            mov eax, [ebp+8]   ; eax = a
            mov ecx, [ebp+12]  ; ecx = b
            mov edx, [ebp+16]  ; edx = c

            add eax, ecx       ; eax = a + b
            add eax, edx       ; eax = (a + b) + c

            ; epilog
            ; eax contains the return value
            pop ebp
            ret
adder_asm	endp
end
