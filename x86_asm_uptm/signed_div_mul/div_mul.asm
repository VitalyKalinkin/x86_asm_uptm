.386
.model flat, C

.code
; Returns 0 if there was an error (division by 0)
; Returns 1 if everything is ok
; Parameters:
;           prod = a * b
;           quo = a / b
;           rem
integer_mul_div  PROC
                 ; prolog
                 push ebp
                 mov ebp, esp
                 push ebx

                 ; actual code
                 xor eax, eax
                 
                 mov ecx, [ebp + 8]  ; ecx = a
                 mov edx, [ebp + 12] ; edx = b

                 or edx, edx
                 jz invalid_divizor

                 imul edx, ecx        ; edx = a * b

                 mov ebx, [ebp + 16] ; ebx = prod
                 mov [ebx], edx      ; *prod = a * b

				 mov eax, ecx        ; eax = a
                 cdq                 ; edx:eax contains divident
                 idiv dword ptr[ebp + 12]   ; edx:eax / b
                 mov ebx, [ebp + 20]
				 mov [ebx],	eax      ; *quo = a // b
                 mov ebx, [ebp + 24]
				 mov [ebx],	edx      ; *rem = a % b
                 mov eax, 1

invalid_divizor:
                 ; epilog
                 pop ebx
                 pop ebp
                 ret
integer_mul_div  endp
end