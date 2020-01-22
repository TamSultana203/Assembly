                                             .MODEL SMALL

.STACK 100H 

.DATA
    
    
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX  
    
    MOV AL,'8'
    MOV BL,'7'  
    
    
    MOV CL,AL
    CMP BL,AL
    JLE NEXT	;JUMP IF BL IS LESS THAN OR EQUAL TO AL
    MOV CL,BL   ;EXECUTES IF BL > AL
    
NEXT:    
    MOV AH,2
    MOV DL,CL
    INT 21H
   
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN