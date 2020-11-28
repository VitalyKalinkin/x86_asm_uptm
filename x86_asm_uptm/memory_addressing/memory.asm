.386
.model flat, C

.const
fib_vals dword 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610 

; num_fib_vals = sizeof(fib_vals)/sizeof(dword)
; $ -- offset of the current memory block
num_fib_vals dword ($-fib_vals)/sizeof dword
; publishing num_fib_vals
public num_fib_vals

.code
memory_addressing PROC
                  ; prolog
                  push ebp
                  mov ebp, esp
                  push ebx
                  push esi
                  push edi

                  ; actual code
                  xor eax, eax
                  mov ecx, [ebp + 8] ; ecx = i
                  cmp ecx, 0         ; 0 - ecx => ZF
                  jl invalid_index   ; jump if less than
                  cmp ecx, [num_fib_vals] ; 
                  jge invalid_index  ; jump if greater or equal than

                  ; v1 -- base register
                  mov ebx, offset fib_vals   ; ebx = *fib_vals
                  mov esi, [ebp + 8]         ; esi = i
				  shl esi, 2                 ; esi = i * 4
				  add ebx, esi               ; ebx = *fib_vals + i * 4
				  mov eax, [ebx]             ; eax = fib_vals[i]            
                  mov edi, [ebp + 12]
                  mov [edi], eax             ; *v1 = fib_vals[i]

                  ; v2 -- base register + displacement
				  mov esi, [ebp	+ 8]         ; esi = i
                  shl esi, 2                 
                  mov eax, [esi + fib_vals]  ; eax = fib_vals[i]
                  mov edi, [ebp + 16]       
                  mov [edi], eax             ; *v2 = fib_vals[i]

                  ; v3 -- base register + index register
                  mov ebx, offset fib_vals
                  mov esi, [ebp + 8]
                  shl esi, 2
                  mov eax, [ebx + esi]       ; eax, fib_vals[i]
                  mov edi, [ebp + 20]
                  mov [edi], eax             ; *v3 = fib_vals[i]

                  ; v4 -- base register + index register * scale_factor
                  mov ebx, offset fib_vals				  
                  mov esi, [ebp + 8]        
                  mov eax, [ebx + esi * 4]
                  mov edi, [ebp + 24]
                  mov [edi], eax

                  ; v5 -- index register * scale_factor + displacement			  
                  mov esi, [ebp + 8]        
                  mov eax, [esi * 4 + fib_vals]
                  mov edi, [ebp + 28]
                  mov [edi], eax
                  mov eax, 1

                  ; epilog
invalid_index:
                  pop edi
                  pop esi
                  pop ebx
                  pop ebp
                  ret
memory_addressing endp
end