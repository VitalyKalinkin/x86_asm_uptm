.386
.model flat

PBYTE TYPEDEF	PTR BYTE
PWORD TYPEDEF	PTR WORD
PDWORD TYPEDEF  PTR DWORD

.data
array_b BYTE 10h, 20h, 30h
array_w WORD 1, 2, 3
array_d DWORD 4, 5, 6

pt_1 PBYTE array_b
pt_2 PWORD array_w
pt_3 PDWORD array_d

.code
main	proc
		mov esi, pt_1
		mov al, [esi]
		mov esi, pt_2
		mov ax, [esi]
		mov esi, pt_3
		mov eax, [esi]
		ret 
main	endp
end		main