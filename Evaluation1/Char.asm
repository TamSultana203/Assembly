.MODEL SMALL

.STACK 100H 

.DATA 

ODD DB 'ODD'
EVN DB 'EVEN'
    
    
.CODE

MAIN PROC   
    MOV AX,@DATA
    MOV DS, AX  
    
    
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
START:
    DIV BL, 2
    
    
    
     
         
ODDPRINT:
    LEA DX,ODD
    MOV AH,2
  
    INT 21H
    JMP EXIT  
    
EVNPRINT:
    LEA DX,EVN 
    MOV AH,2
   ; MOV DL,EVN
    INT 21H
    JMP EXIT  

   
EXIT:    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN