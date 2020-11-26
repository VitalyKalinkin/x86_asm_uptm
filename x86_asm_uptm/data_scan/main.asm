.386
.model flat
.data
;int_array SWORD 0, 0, 0, 0, 4, 3, 0, -34, -56, 7, 8
int_array SWORD 0, 0, 0, 0
.code
main	PROC
		mov ebx, OFFSET int_array
		mov ecx, LENGTHOF int_array

L1:
		cmp WORD PTR[ebx], 0
		jnz found
		add ebx, 2
		loop L1
		jmp not_found

found:
		movsx eax, WORD PTR[ebx]
		jmp quit
	
not_found:
		mov eax, 99999

quit:
		ret
main	endp
end		main