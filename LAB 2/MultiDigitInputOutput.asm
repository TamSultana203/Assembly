

.MODEL SMALL

.STACK 100H

.DATA
VAR DB 0  
NL DB 0DH, 0AH, '$'

.CODE              
 
 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
   
    MOV CL, 10
    ;MOV DX, 0
   
 START:
 
    INC VAR          
   
    MOV AH, 1  ; AH = 1 (input)
    INT 21H    ; Call 21st interrept routine  
   
    CMP AL, 13
    JE PRINT
   
    SUB AL, '0'
    ADD DL, AL
    MOV AL, DL
   
   
   
    CMP VAR, 2
    JE PRINT
   
    MUL CL
    MOV DL, AL
   
   
    JMP START
   
   
PRINT:
  ;  MOV VAR, 10
    MOV BL, DL
    MOV AH, 0
      
    
    LEA DX, NL
    MOV AH, 9
    INT 21H

L1:
    MOV AL, BL  
    MOV AH, 0      
   
    DIV CL  
   
    MOV DL, AH
    ADD DL, '0'
    MOV BL, AL
   
    MOV AH, 2
    INT 21H   
    
    MOV AL, BL  
    CMP AL, 0
    JE EXIT
    JMP L1

   
   

EXIT:
 MAIN ENDP


END MAIN  
