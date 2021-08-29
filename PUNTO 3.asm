; MARIO RODRIGUEZ MENDOZA 2420191008 
; LABORATORIO 1 ELECTRONICA DIGITAL 3
;-------------------------------------
       .MODEL SMALL
        ORG     100H

;---------------------------------------------
        .DATA
        
INPUT   DB      'A1bC2D'
;---------------------------------------------
       .CODE
BEGIN   PROC    NEAR                        
        LEA     SI,INPUT     ; SE MUEVE LA VARIABLE AL REGISTRO SI     
        MOV     CX,6         ; NUMERO DE VECES A ITERAR                        
B10:
        MOV     AL,[SI]      ; MOVEMOS EL REGISTRO SI A AL
        CMP     AL,30H       ; COMPARA AL CON 30H 
        JB      B30          ; SALTA SI A B30 ES MENOR A 30H  
        CMP     AL,39H       ; COMPARA EL REGISTRO AL CON 39H

        JA      B20          ; SALTA A B30 SI ES MAYOR A 39H
        AND     AL,00000000B ; SI NO SALTA A OTRAS ETIQUETAS SE MULTIPLICA POR 0B
        MOV     AL,2AH       ; Cambia el registro por 2AH
        MOV     [BX],AL      ; MUEVE EL REGISTRO BX A AL
B20:
        MOV     AH,[SI]      ; SE REALIZA CASI EL MISMO PROCEDIMIENTO QUE EN LA ANTERIOR
        CMP     AH,61H       ; ETIQUETA SOLO QUE AH DE SER 61H<AH<7AH, SI ESTE SE MANTIENE
        JB      B30          ; EN LA ETIQUETA B20 SE MULTIPLICA POR 11011111B, SI NO 
        CMP     AH,7AH       ; ESTE SALTA A LA ETIQUETA B30 PARA REINICIAR EL CICLO 
        JA      B30          ; 
        AND     AH,11011111B ;
        MOV     [BX],AH      ; 
B30:
        INC     BX           
        LEA     SI,SI+1      ; LEE EL REGISTRO Y PASA AL SIGUIENTE CARACTER DE INPUT

        LOOP    B10
        MOV     AX,4C00H     ; PROTOCOLO DE SALIDA DEL DOS
        INT     21H
BEGIN   ENDP
        END     BEGIN      