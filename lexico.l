%{
	#include<stdio.h>
    #include <string.h>
    #include<float.h> // Para los rangos del flotante
    #include"sintactico_yacc.tab.h"
    int funct_val_integer_rango(char*ptr);
    int funct_val_float_rango(char*ptr);
    int yyerror_lexico(void);
    int linea = 1;
%}

/* DECLARACIONES ELEMENTALES */
CORCHETE_ABIERTO    "["
CORCHETE_CERRADO    "]"
LLAVE_ABIERTA       "{"
LLAVE_CERRADA       "}"
IGUAL               "="
DIGITO              [0-9]
PUNTO               ["."]

IDENTIFICADOR       [a-zA-Z][_A-Za-z0-9]*
FLOTANTE            {DIGITO}{0,8}{PUNTO}{DIGITO}{1,8}
ENTERO              (-?[1-9]{DIGITO}{0,4})|0
CARACTER            ['][a-zA-Z][']
CADENA              \"[^\n"]*\"
PUNTO_Y_COMA        ";"

/* PALABRAS RESERVADAS */

INT                 "int"
FLOAT               "float"
STRING              "string"
CHAR                "char"

/* En el return nos tira un warning, si retornas yytext no tira el warnig */
/* El prinf lo coloque solo para verificar si retorna el token correcto despues deberiamos sacarlo*/
%%

{FLOTANTE}          {funct_val_float_rango(yytext);return FLOTANTE;}
{FLOAT}             {return TYPE_FLOAT;}
{ENTERO}            {funct_val_integer_rango(yytext); return INT;}
{INT}               {return TYPE_INT;}
{CARACTER}          {return CHAR;}
{CHAR}              {return TYPE_CHAR;}
{CADENA}            {return STRING;}
{STRING}            {return TYPE_STRING;}
{CORCHETE_ABIERTO}  {return CORCHETE_ABIERTO;}
{CORCHETE_CERRADO}  {return CORCHETE_CERRADO;}
{LLAVE_ABIERTA}     {return LLAVE_ABIERTA;}
{LLAVE_CERRADA}     {return LLAVE_CERRADA;}
{IDENTIFICADOR}     {return IDENTIFICADOR;}
{PUNTO_Y_COMA}      {return PUNTO_Y_COMA;}
{IGUAL}             {return IGUAL;}
" "
"\n" {linea+=1;}
"\t"
"." yyerror_lexico();
%%

int yywrap(){
    return 1;
}

int funct_val_integer_rango(char*ptr){
    int value = atoi(ptr);
    if(value < -32768 || value > 32767){
        printf("\n¡ERROR! VARIABLE FUERA DE RANGO: %s\n", yytext);
        return yyerror_lexico();
    }
    return 0;
}

int funct_val_float_rango(char*ptr){
    float value = atof(ptr);
    if(value < FLT_MIN || value > FLT_MAX){
        printf("\n¡ERROR! VARIABLE FUERA DE RANGO: %s\n", yytext);
        return yyerror_lexico();
    }
    return 0;
}

int yyerror_lexico(void){
    printf("hola");
    printf("\nERROR DE LEXICO: CARACTER (%s) NO VALIDO. FINALIZANDO...\n", yytext);
    exit(1);
}
