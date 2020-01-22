.MODEL SMALL

.STACK 100H 

.DATA
ALPHA DB    'A' 
FINA  DB    'Z'   
SPACE DB    ' '
NL DB 0DH, 0AH, '$'
    
    
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX 

START:
     
    
    
    MOV BL, AL
    CMP BL,FINA
    JE NEXT	;JUMP IF EQUAL TO AL
    
    ;MOV CL,BL   ;EXECUTES IF BL > AL 
   
    ;EKTA CHAR PRINT
    
    MOV AH,2
    MOV DL,ALPHA
    INT 21H
    
    ;NEW LINE
    
    LEA DX, NL
    MOV AH, 9
    INT 21H
    
    ;CHAR++ & CONT. LOOP
    
    INC ALPHA 
    MOV AL, ALPHA
    JMP START
    
NEXT:    
    MOV AH,2
    MOV DL,FINA
    INT 21H
    JMP EXIT
    

EXIT:   
    
    MOV AH,4CH
    INT 21H

MAIN ENDP

END MAIN