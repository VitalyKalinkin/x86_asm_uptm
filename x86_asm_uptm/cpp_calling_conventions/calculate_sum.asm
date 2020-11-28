.386
.model flat, C

.code
calculate_sums PROC
               ; prolog
               push ebp
               mov ebp, esp
               sub esp, 12  ; reserve space for 3 dwords
               push ebx
               push esi
               push edi
               
               ; actual code
               mov eax, [ebp + 8]  ; eax = a
               mov ebx, [ebp + 12] ; ebx = b
               mov ecx, [ebp + 16] ; ecx = c

               mov edx, [ebp + 20] ; edx = sum
               mov esi, [ebp + 24] ; esi = sum_squares
               mov edi, [ebp + 28] ; edi = sum_cubes
               ; ---- Sum
               mov [ebp - 12], eax ; temp1 = a
               add [ebp - 12], ebx ; temp1 = a + b
               add [ebp - 12], ecx ; temp1 = a + b + c
               
               ; ---- Sum of Squares
			   imul	eax, eax       ; eax = a * a
               imul ebx, ebx       ; ebx = b * b
               imul ecx, ecx       ; ecx = c * c
               mov [ebp - 8], eax  ; temp2 = a^2
               add [ebp - 8], ebx  ; temp2 = a^2 + b^2
               add [ebp - 8], ecx  ; temp2 = a^2 + b^2 + c^2

               ; ---- Sum of Cubes
               imul	eax, [ebp + 8]  ; eax = a^2 * a
               imul ebx, [ebp + 12] ; ebx = b^2 * b
               imul ecx, [ebp + 16] ; ecx = c^2 * c
               mov [ebp - 4], eax   ; temp3 = a^3
               add [ebp - 4], ebx   ; temp3 = a^3 + b^3
               add [ebp - 4], ecx   ; temp3 = a^3 + b^3 + c^3

               ; ---- Saving sums to parameters
               mov eax, [ebp - 12]
			   mov [edx], eax       ; *sum = temp1

               mov eax, [ebp - 8]
			   mov [esi], eax    	; *sum_squares = temp2

               mov eax, [ebp - 4]
               mov [edi], eax       ; *sum_cubes = temp3

               ; epilog
               pop edi
               pop esi
               pop ebx
               mov esp, ebp         ; Release space from temp variables
               pop ebp
               ret
calculate_sums endp
end
