.MODEL SMALL
.STACK 100H
.CODE     
.DATA
MSG1 DB 'EVEN TO ODD$' 
MSG2 DB 'ODD TO EVEN$' 
NL DB 0DH, 0AH, '$'

MAIN PROC 
    MOV AX,@DATA
    MOV DS, AX 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    LEVEL1:        
        MOV BH,BL        
        SHR BL,1
        JMP LEVEL2
        
    LEVEL2:
        MOV CL,'1'
       
        AND BH,CL 
        
        CMP BH,'0'
        JE LEVEL3
        JMP LEVEL4
        
    LEVEL3:
        MOV CL,'1'
        
        AND BL,CL
        
        CMP BL,'0'
        JE LEVEL1
        
        LEA DX,MSG1
        MOV AH,9
        INT 21H
        JMP EXIT
        
    LEVEL4:
        MOV CL,'1'
       
        AND BL,CL
        
        CMP BL,'0'
        JE LEVEL1
        
        LEA DX,MSG2
        MOV AH,9
        INT 21H
        JMP EXIT  
        
    EXIT:
        MOV AH,4CH
        INT 21H
        MAIN ENDP
END MAIN