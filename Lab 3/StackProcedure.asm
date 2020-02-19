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
   ; MOV BL, 0  
   CALL START 
   MOV BH, 0
   PUSH BX
   CALL PRINT
   CALL EXIT
   
 START:
 
    MOV AH, 1  ; AH = 1 (input)
    INT 21H    ; Call 21st interrept routine  
   
    CMP AL, 13  
    RET  
    
    MOV AH, 0
    SUB AL, '0'
    ADD AL, BL
    MOV BH, AL
       
    MUL CL
    MOV BL, AL
   
   
    JMP START
   
   
PRINT:
  
    LEA DX, NL
    MOV AH, 9
    INT 21H  
    
    MOV CL, 10 
    POP BX

L1:
    MOV AL, BL 
    MOV AH, 0      
   
    DIV CL  
   
    MOV DL, AH
    ADD DL, '0'
    MOV BH, AL
   
    MOV AH, 2
    INT 21H   
    
    MOV AL, BH  
    CMP AL, 0
    RET
    JMP L1

   
   

EXIT:
 MAIN ENDP


END MAIN 