.MODEL SMALL

.STACK 100H

.DATA 

A DW '2'
B DW '5'
C DW '8'


.CODE
 
 
 MAIN PROC
    MOV AX,@DATA
    MOV DS, AX 
    
    
START:
    
    MOV AX, [A]
    CMP AX, [B]
    JG NEXT
    MOV AX, [B]
    
    
NEXT:

    CMP AX,[C]
    JG NN 
    MOV DX,[C]
    MOV AH, 2
    INT 21H
    JMP EXIT
    
    
NN:
    MOV DX,AX
    MOV AH, 2
    INT 21H
    
    
    mov ah, 4ch 
    int 21h
    
    
EXIT:    
       
 MAIN ENDP 


END MAIN