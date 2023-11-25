%{
void yyerror(char *s);
#include <stdio.h>
int yyparse(); //no se si esta bien
%}

%union{
    char cadena[100];
    char caracter;
    int entero;
    float flotante;
}

%token  IGUAL CORCHETE_ABIERTO CORCHETE_CERRADO LLAVE_ABIERTA LLAVE_CERRADA IDENTIFICADOR PUNTO_Y_COMA
%token  TYPE_FLOAT TYPE_INT TYPE_CHAR TYPE_STRING
%token  <cadena> STRING
%token  <caracter> CHAR
%token  <entero> INT
%token  <flotante> FLOTANTE

%type <cadena> ASSIGNMENT_CAD
%type <caracter> ASSIGNMENT_CAR
%type <entero> ASSIGNMENT_INT
%type <flotante> ASSIGNMENT_FLOAT

%%
INPUT                : DECLARATION_VECTORES PUNTO_Y_COMA
    |                  DECLARATION_MATICES  PUNTO_Y_COMA
    |                  ASSIGNMENT_CAD       PUNTO_Y_COMA
    |                  ASSIGNMENT_CAR       PUNTO_Y_COMA
    |                  ASSIGNMENT_INT       PUNTO_Y_COMA
    |                  ASSIGNMENT_FLOAT     PUNTO_Y_COMA
    ;

DECLARATION_VECTORES : TYPE_CHAR    IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO {printf("\nDeclaracion de vector valido");}
    |                  TYPE_CHAR    IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL LLAVE_ABIERTA CHAR LLAVE_CERRADA {printf("\nDeclaracion de vector valido");}
    |                  TYPE_INT     IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO {printf("\nDeclaracion de vector valido");}
    |                  TYPE_INT     IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL LLAVE_ABIERTA INT LLAVE_CERRADA {printf("\nDeclaracion de vector valido");}
    |                  TYPE_FLOAT   IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO {printf("\nDeclaracion de vector valido");}
    |                  TYPE_FLOAT   IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL LLAVE_ABIERTA FLOTANTE LLAVE_CERRADA {printf("\nDeclaracion de vector valido");}
    |                  TYPE_STRING  IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO {printf("\nDeclaracion de vector valido");}
    |                  TYPE_STRING  IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL LLAVE_ABIERTA STRING LLAVE_CERRADA {printf("\nDeclaracion de vector valido");}
    ;

DECLARATION_MATICES  : TYPE_CHAR    IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO {printf("\nDeclaracion de matriz valida");}
    |                  TYPE_CHAR    IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL LLAVE_ABIERTA LLAVE_ABIERTA CHAR LLAVE_CERRADA LLAVE_CERRADA {printf("\nDeclaracion de matriz valida");}
    |                  TYPE_INT     IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO {printf("\nDeclaracion de matriz valida");}
    |                  TYPE_INT     IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL LLAVE_ABIERTA LLAVE_ABIERTA INT LLAVE_CERRADA LLAVE_CERRADA {printf("\nDeclaracion de matriz valida");}
    |                  TYPE_FLOAT   IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO {printf("\nDeclaracion de matriz valida");}
    |                  TYPE_FLOAT   IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL LLAVE_ABIERTA LLAVE_ABIERTA FLOTANTE LLAVE_CERRADA LLAVE_CERRADA {printf("\nDeclaracion de matriz valida");}
    |                  TYPE_STRING  IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO {printf("\nDeclaracion de matriz valida");}
    |                  TYPE_STRING  IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL LLAVE_ABIERTA LLAVE_ABIERTA STRING LLAVE_CERRADA LLAVE_CERRADA {printf("\nDeclaracion de matriz valida");}
    ;

ASSIGNMENT_CAD     :   IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL STRING {printf("\nAsignacion de vector valido");}
    |                  IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL STRING {printf("\nAsignacion de matriz valido");}
    ;

ASSIGNMENT_CAR     :   IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL CHAR {printf("\nAsignacion de vector valido");}
    |                  IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL CHAR {printf("\nAsignacion de matriz valido");}
    ;

ASSIGNMENT_FLOAT   :   IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL FLOTANTE {printf("\nAsignacion de vector valido");}
    |                  IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL FLOTANTE {printf("\nAsignacion de matriz valido");}
    ;

ASSIGNMENT_INT     :   IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL INT {printf("\nAsignacion de vector valido");}
    |                  IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL INT {printf("\nAsignacion de matriz valido");}
    ;
%%

int main_sint(void){
    return yyparse();
}

void yyerror (char *s) {printf("\nInstruccion invalida para el lenguaje\n");}