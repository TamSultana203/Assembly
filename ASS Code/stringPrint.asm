.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 'HELLO WORLD!$' 
MSG2 DB 'BYE BYE WORLD!$' 
NL DB 0DH, 0AH, '$'


.CODE

 MAIN PROC
   MOV AX, @DATA
   MOV DS, AX      ; DS = data segment register   
   
   
   LEA DX, MSG1   ; LEA = Load Effective Address
   MOV AH, 9
   INT 21H 
   
   LEA DX, NL   ; LEA = Load Effective Address
   MOV AH, 9
   INT 21H 
   
   LEA DX, MSG2   ; LEA = Load Effective Address
   MOV AH, 9
   INT 21H
      
 MAIN ENDP 

END MAIN
