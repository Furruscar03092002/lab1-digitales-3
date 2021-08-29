;MARIO RODRIGUEZ 2420191008 
;-------------------------------------
        .MODEL  
        ORG     100H
        BEGIN:  JMP   MAIN 
        .STACK 64
;-------------------------------------
        .DATA
            
INPUT   DB   'A1BC5De'   ; INICIALIZACION DE LAS VARIABLES 
SALIDA  DB   0000000B


        .CODE    

MAIN   PROC     NEAR
LEA    BX,INPUT+6
LEA    SI,SALIDA
MOV    CX,7           ; CANTIDAD DE VECES A ITERAR
           
B10:

MOV    AH,[BX]        ; PASA EL VECTOR DE CARACTERES DE BX A AH
MOV    [SI],AH        ; PASAN EL VECTOR DE AH A SI
MOV    [BX],AH        ; SE VUELVE A PASAR A BX
DEC    BX             ; LEE LOS CARACTERES DEL VECTOR Y A SU VEZ VA DECREMENTANDO 
INC    SI             ; VA PASANDO LOS DATOS DECREMENTADOS A SI
DEC    CX             ; LIMPIA LOS ESPACIOS QUE DEBE CRUZAR 
JNZ    B10

MOV    AX,4C00H       ;PROTOCOLO BASICO PARA SALIR DEL DOS
INT    21H
MAIN   ENDP
END    BEGIN           


