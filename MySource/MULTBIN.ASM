.model small
.stack 100h
.data
soma    dw      00      
.code
        mov ax,@data
        mov ds,ax

        mov ax,5		  ;MULTIPLIQUE O VALOR DE AX POR QUALQUER INTEIRO POSITIVO
        push ax
        
        mov bx,37		  ;MULTIPLIQUE O VALOR DE BX POR QUALQUER INTEIRO POSITIVO
        mov cl,0                  ;Contador utilizado para deslocar bits
        mov dx,0000000000000001b  ;Registrador de teste 0 ou 1

        test bx,dx
        jnz IMPAR
        jmp ENCONTROUZERO

IMPAR:
        mov [soma],ax
        jmp ENCONTROUZERO

INICIO:
        test bx,dx
        jnz ENCONTROUUM

ENCONTROUZERO:
        inc cl
        shl dx,1
        jc FIM
        jmp INICIO

ENCONTROUUM:
        shl ax,cl
        add [soma],ax
        pop ax
        push ax
        jmp ENCONTROUZERO

 FIM:
        mov dx,[soma]     ;no final para exibir resultado

        mov ax,04ch
        mov al,00
        int 21h
        end