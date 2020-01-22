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
    CMP BL, '1' 
    JE ODDPRINT
    
    
    CMP BL, '2'
    JE EVNPRINT
    
    
    CMP BL, '3'
    JE ODDPRINT
    
    CMP BL, '4'
    JE EVNPRINT
    
    CMP BL, '5'
    JE ODDPRINT
    
    CMP BL, '6'
    JE EVNPRINT
    
    CMP BL, '7'
    JE ODDPRINT
    
    CMP BL, '8'
    JE EVNPRINT
    
    CMP BL, '9'
    JE ODDPRINT
    
    CMP BL, '0'
    JE EVNPRINT
    
    
     
         
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