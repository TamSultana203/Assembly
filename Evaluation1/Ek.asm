.MODEL SMALL

.STACK 100H

.DATA 
NL DB 0DH, 0AH, '$'
  


.CODE
 
 
 MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
 START:
 
    
    
    MOV AH, 1  ; AH = 1 (input)
    INT 21H    ; Call 21st interrept routine 
    MOV BL, AL
    CMP BL, 13
    JE EXIT 
    
    LEA DX, NL 
    MOV AH,9
    INT 21H
    
    JMP START
    
    
    
EXIT:    
       
 MAIN ENDP 


END MAIN  