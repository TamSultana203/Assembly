.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB '*$' 
VAR1 DB 1
INIT DB 0 
NL DB 0DH, 0AH, '$'


.CODE

 MAIN PROC
   MOV AX, @DATA
   MOV DS, AX      ; DS = data segment register   
   
   MOV AH, 1  ; AH = 1 (input)
   INT 21H 
   MOV BL, AL 
   
   LEA DX, NL 
    MOV AH,9
    INT 21H 
   
   JMP START
BEGIN:
    LEA DX, NL 
    MOV AH,9
    INT 21H  
             
    ADD VAR1, 48
     
    
    CMP BL, VAR1
    JE EXIT
    
    SUB VAR1, 48
    INC VAR1
    MOV INIT, 0
 
    
    
   
 START:
      
   LEA DX, MSG1
   MOV AH, 9 
   INT 21H
   INC INIT
            
            
   MOV CL, INIT
   CMP CL, VAR1
   JE BEGIN
   JMP START
   
EXIT:      
 MAIN ENDP 

END MAIN
