.MODEL SMALL
.STACK 100H

.DATA
NL DB 0DH, 0AH, '$'
A DB 100 DUP(?)

.CODE
   
START PROC
    PUSH AX
    PUSH CX
    PUSH DX    
  L1:
    MOV AH, 1
    INT 21H
    MOV CL, AL
    SUB CL, 48
    CMP AL, 13
    JE Next
    MOV AX, BX
    MOV CH, 0
    MOV BL, 10
    MUL BL
    MOV BX, AX
    ADD BX, CX
    JMP L1
    Next:
    POP DX
    POP CX
    POP AX
    RET
START ENDP
   
PRINTS PROC
    LEA DX, NL   ; LEA = Load Effective Address
    MOV AH, 9
    INT 21H
    MOV DI, 0
  L2:
    MOV AX, BX
    MOV CL, 10
    DIV CL
    MOV CL, AL
    MOV DL, AH
    ADD DL, 30H
    MOV A[DI], DL
    INC DI
    CMP CL, DH
    JE Nexts
    MOV AH, 0
    MOV AL, CL
    MOV BX, AX
    JMP L2
  Nexts:
    Print:
    MOV DL, A[DI-1]
    MOV AH, 2
    INT 21H
    DEC DI
    CMP DI, 0
    JNE Print    
    RET
PRINTS ENDP
   
 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV BX, 0
    CALL START
    CALL PRINTS
   
  MAIN ENDP
 END MAIN

