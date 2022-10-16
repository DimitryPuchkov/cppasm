.386
.model   FLAT, C
extern lstrlenA@4:near

.data 
buf1 dd ?
buf2 db 200 dup (?)
len dd ?

.code
squeeze proc   
push ebp; save global ebp
mov ebp, esp; define local ebp

; get args
mov eax, [ebp]+8; source to eax
mov buf1, eax; source to buf1


;proc body
;get source len
push buf1
call lstrlenA@4
mov len, eax

cmp len, 0; check if string is empty
je exit

std; set reverse direction

;esi - pointer to end of source str
mov esi, buf1
add esi, len
sub esi, 1
; edi - pointer to end of result str
mov edi, offset buf2
add edi, len
sub edi, 1

mov ecx, len;set loop counter

; copying a string to buf2
strmove:
mov al, [esi]  ; get current processed element
cmp al, ' '    ; compare current element with space
je space       ;if current elem equals to space, it will not be placed to result
movsb          ; put current element to result
continue:
loop strmove

add edi, 1; edi - pointer to start result str
mov eax, edi ; result str pointer to eax that will be return value

jmp exit

space:
   dec esi ; pointer to next char
   jmp continue

exit:
cld; need to avoid  Access violation executing location 0x00000000 error

pop ebp; reover global ebp
ret; return from procedure: return address to eip
squeeze endp
end   