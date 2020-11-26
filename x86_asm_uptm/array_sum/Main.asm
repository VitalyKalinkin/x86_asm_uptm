.386
.model flat

.data
int_array dword 10000h, 20000h, 30000h, 40000h

.code
start	PROC
		mov edi, OFFSET int_array
		mov ecx, LENGTHOF int_array
		mov eax, 0

LP:
		add eax, [edi]
		add edi, TYPE int_array
		loop LP

		ret
start	endp
end		start
