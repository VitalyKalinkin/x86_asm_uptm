.386
.model flat, C

extern gl_char: byte
extern gl_short: word
extern gl_int: dword
extern gl_long: qword

.code

integer_addition PROC
                 ; prolog
                 push ebp
                 mov ebp, esp

                 ; actial code
                 mov al, [ebp + 8]
                 add [gl_char], al

                 mov ax, [ebp + 12]
                 add [gl_short], ax

                 mov eax, [ebp + 16]
                 add [gl_int], eax

                 mov eax, [ebp + 20]
                 mov edx, [ebp + 24]
                 add dword ptr[gl_long], eax
                 adc dword ptr[gl_long + 4], edx ; add with carry

                 ; epilog
                 pop ebp
                 ret
integer_addition endp
end