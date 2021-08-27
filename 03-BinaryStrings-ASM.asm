format PE console
entry start

include 'win32a.inc'

section '.text' code executable
start:

	invoke printf, ecnt
	add esp,4
	invoke scanf, nisf, n
	add esp,8
	push [n]
	invoke printf, enprmpt
	add esp,4
	pop ecx
	xor eax,eax
    enter_nums:
	push ecx
	push eax
	add eax, a
	invoke scanf, nisf, eax
	add esp, 8
	pop eax
	add eax, 4
	pop ecx
	loop enter_nums
	invoke printf, ps1
	add esp, 4
    mc:
	mov eax, b
    mcl1:
	mov bl, [eax]
	test bl, bl
	jz mcl2
	dec byte [eax]
	inc eax
	jmp mcl1
    mcl2:
	inc byte [eax]
	sub eax, b
	cmp eax, [n]
	je mce
	push eax
	invoke printf, ps2
	add esp, 4
	pop eax
    mcl3:
	push eax
	add eax, b
	test byte [eax], 1
	jz mcl4
	sub eax, b
	mov ebx, 4
	mul ebx
	add eax, a
	invoke printf, ps3, [eax]
	add esp, 8
    mcl4:
	pop eax
	inc eax
	cmp eax, [n]
	jne mcl3
	invoke printf, ps4
	add esp, 4
	jmp mc
    mce:
	invoke printf, ps5
	add esp, 4

	invoke getchar
	invoke getchar

	push 0
	call [ExitProcess]

section '.rdata' data readable
	ecnt	  db 'Enter number of elements: ', 0
	nisf	  db '%d', 0
	enprmpt   db 'Enter elements: ', 0
	ps1	  db '{}, ', 0
	ps2	  db '{', 0
	ps3	  db '%d,', 0
	ps4	  db 8,'}, ', 0
	ps5	  db 8,8,' ',8,0

section '.data'  data writable
	n	  dd ?
	a	  dd 100 dup(0)
	b	  db 100 dup(0)

section '.idata' data readable import
	library kernel32, 'kernel32.dll', \
		msvcrt,   'msvcrt.dll'
	import kernel32, ExitProcess, 'ExitProcess'
	import msvcrt,\
	       printf,	 'printf',\
	       scanf,	 'scanf',\
	       getchar,  'getchar'