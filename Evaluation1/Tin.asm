.MODEL SMALL

.STACK 100H 

.DATA 

ODD DB 'ODD'
EVN DB 'EVEN' 
INIT DB 1 
NL DB 0DH, 0AH, '$'
    
    
.CODE

MAIN PROC   
    MOV AX,@DATA
    MOV DS, AX  
    
    MOV CL, 0
    MOV DL, 0
    
    
    
START: 

    MOV AH, 1
    INT 21H 
    
    CMP AL, 13
    JE PRINT
    
    MOV BL, AL
    SUB BL, 30H 
    SHL CL, 1
    OR CL, BL
    INC INIT 
    
    
    
    
    MOV DL, 8
    CMP DL, INIT
    JE PRINT
    JMP START
   
       
    
    
    
    
     
         
PRINT:

 LEA DX, NL 
    MOV AH,9
    INT 21H 
    MOV DL, CL 
    MOV AH, 2
    INT 21H  
     
   
MAIN ENDP

END MAIN