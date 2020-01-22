.MODEL SMALL

.STACK 100H

.DATA


.CODE
 
 
 MAIN PROC
    
    MOV AH, 1  ; AH = 1 (input)
    INT 21H    ; Call 21st interrept routine
    
    MOV BL, AL ; Save input to BL
    
    MOV DL, BL ; Output from DL
    
    MOV AH, 2  ; AH = 2 (output)
    INT 21H        
    
    mov ah, 4ch 
    int 21h
    
    
       
 MAIN ENDP 


END MAIN