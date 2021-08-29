; MARIO RORDRIGUEZ MENDOZA 24020191008
; PRIMER LABORATORIO ELECTRONICA DIGITAL 3
;-------------------------------------
       .MODEL
        ORG     100H
       .STACK 64

                                                                                           
;---------------------------------------------__________
        .DATA
        
INPUT   DB      'AbCD'                      
;-------------------------------------------------------
       .CODE
BEGIN   PROC    NEAR                        
        LEA     SI,INPUT     ; LA ENTRADA A CORREGIR 
        MOV     CX,6         ; LA CANTIDAD DE ITERACCIONES A REALIZAR                         
B10:
        MOV     AL,[SI]      
        CMP     AL,41H       ; COMPARA EL VALRO QUE TIENE EN EL MOMENTO AL CON 30H 
        JB      B30          ; SALTA A B30 SI ES MAYOR 
        CMP     AL,5AH       ; COMPARA EL VALRO QUE TIENE EN EL MOMENTO AL CON 39H
        JA      B20          ; SALTA A B20 SI ES MAYOR A 39H
        OR      AL,00100000B ; AL ESTAR EN LOS INTERVALOS DE VALORES DE LAS MAYUSCULAS
                             ; SE  MULTIPLICA POR 00100000B
        MOV     [BX],AL      ; PASA LO DEL REGISTRO BX AL AH
B20:
        MOV     AH,[SI]      
        CMP     AH,61H       ; COMPARA EL VALOR QUE TOMA AH EN EL MOMENTO CON 61H
        JB      B30          ; SALTA A B30 SI ES MENOR 
        CMP     AH,7AH       ; COMPARA EL VALOR QUE TIENE AH CON 7AH
        JA      B30          ; SALTA A B30 SI NO CUMPLE CON SER MAYOR
        AND     AH,11011111B ; AL ESTAR EN LOS INTERVALOS DE VALORES DE LAS MINUSCULAS
                             ; SE  MULTIPLICA POR 127B
        MOV     [BX],AH      ; PASA LO DEL REGISTRO BX AL AH
B30:
        INC     BX           
        LEA     SI,SI+1      
        LOOP    B10  
;______________________________________________________________---------

        MOV     AX,4C00H     ; PROTOCOLO BASICO PARA SALIR DEL DOS
        INT     21H
BEGIN   ENDP
        END     BEGIN        