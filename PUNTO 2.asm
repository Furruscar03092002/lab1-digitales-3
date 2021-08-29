                         ;MARIO RODRIGUEZ MENDOZA 2420191008
;LABORATORIO 1-PUNTO 2 ELECTRONICA DIGITAL 3
;______-_____-__________-__________________-_______-
;HUGO MARIO RODRIGUEZ MENDOZA
            .MODEL  SMALL 
            ORG     100H
            .STACK  64               
;______-____--____________-_______________-________-            
            .DATA  
ENTRADA      DB      'AbCDe'
        
VARIABLE0    DB      0  
VARIABLE1    DB      0
;_____-___________-______________-_________________ 

            .CODE 
            
BEGIN       PROC    NEAR
            LEA     BX,ENTRADA
            MOV     CX,5             
B10:  
            MOV     AH,[BX]
            CMP     AH,61H          ;SE COMPARA QUE EL CARACTER DEL REGISTRO AH CON 61H 
            JB      B20             ;SALTA A B20 SI ESTE ES MENOR
            CMP     AH,7AH          ;COMPARA NUEVAMENTE AH CON 7AH
            JA      B30             ;SALTA A B30 SI ESTE ES MAYOR
            INC     VARIABLE0       ;SE INCREMENTA LA VARIABLE0 SI SE CUMPLE TODO
            MOV     DL,VARIABLE0    ;MOVER EL DATO AL REGISTRO DL
            JMP     B30            
B20:
            CMP     AH,41H          ;COMPARA EL VALOR DEL REGISTRO AH CON 41H
            JB      B30             ;SALTA A B30 SI ES MENOR
            CMP     AH,5AH          ;COMPARA AH CON 5AH 
            JA      B30             ;SALTA SI ESTE ES MAYOR
            INC     VARIABLE1       ;INCREMENTA EN LA VARIABLE1
            MOV     DH,VARIABLE1    ;SE PASA EL VALOR DE LA VARIABLE A DH
            JMP     B30
B30:
        INC     BX           
        LOOP    B10    
        MOV     AX,4C00H     ; SALIR DEL DOS
        INT     21H   
BEGIN          ENDP
               END    BEGIN
  