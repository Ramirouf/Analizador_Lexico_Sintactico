%{
    int yyerror(char *s);
    #include <stdio.h>
    extern FILE *yyin;
    extern int linea;
    int yylex();
    
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
INPUT                : /* empty */
    |                  INPUT DECLARATION_VECTORES PUNTO_Y_COMA 
    |                  INPUT DECLARATION_MATICES  PUNTO_Y_COMA 
    |                  INPUT ASSIGNMENT_CAD       PUNTO_Y_COMA 
    |                  INPUT ASSIGNMENT_CAR       PUNTO_Y_COMA 
    |                  INPUT ASSIGNMENT_INT       PUNTO_Y_COMA 
    |                  INPUT ASSIGNMENT_FLOAT     PUNTO_Y_COMA 
    ;

DECLARATION_VECTORES : TYPE_CHAR    IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO {printf("\nDeclaracion de vector tipo char valido sin colocar datos - LINEA %d\n",linea);}
    |                  TYPE_CHAR    IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL LLAVE_ABIERTA CHAR LLAVE_CERRADA {printf("\nDeclaracion de vector tipo char valido agregando el primer dato - LINEA %d\n",linea);}
    |                  TYPE_INT     IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO {printf("\nDeclaracion de vector tipo int valido sin colocar datos - LINEA %d\n",linea);}
    |                  TYPE_INT     IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL LLAVE_ABIERTA INT LLAVE_CERRADA {printf("\nDeclaracion de vector tipo int valido agregando el primer dato - LINEA %d\n",linea);}
    |                  TYPE_FLOAT   IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO {printf("\nDeclaracion de vector tipo flotante valido sin colocar datos - LINEA %d\n",linea);}
    |                  TYPE_FLOAT   IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL LLAVE_ABIERTA FLOTANTE LLAVE_CERRADA {printf("\nDeclaracion de vector tipo flotante valido agregando el primer dato - LINEA %d\n",linea);}
    |                  TYPE_STRING  IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO {printf("\nDeclaracion de vector tipo string valido sin colocar datos - LINEA %d\n",linea);}
    |                  TYPE_STRING  IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL LLAVE_ABIERTA STRING LLAVE_CERRADA {printf("\nDeclaracion de vector tipo string valido agregando el primer dato - LINEA %d\n",linea);}
    ;

DECLARATION_MATICES  : TYPE_CHAR    IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO {printf("\nDeclaracion de matriz tipo char valida sin colocar datos - LINEA %d\n",linea);}
    |                  TYPE_CHAR    IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL LLAVE_ABIERTA LLAVE_ABIERTA CHAR LLAVE_CERRADA LLAVE_CERRADA {printf("\nDeclaracion de matiz tipo char valida agregando el primer dato - LINEA %d\n",linea);}
    |                  TYPE_INT     IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO {printf("\nDeclaracion de matriz tipo int valida sin colocar datos - LINEA %d\n",linea);}
    |                  TYPE_INT     IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL LLAVE_ABIERTA LLAVE_ABIERTA INT LLAVE_CERRADA LLAVE_CERRADA {printf("\nDeclaracion de matiz tipo int valida agregando el primer dato - LINEA %d\n",linea);}
    |                  TYPE_FLOAT   IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO {printf("\nDeclaracion de matriz tipo flotante valida sin colocar datos - LINEA %d\n",linea);}
    |                  TYPE_FLOAT   IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL LLAVE_ABIERTA LLAVE_ABIERTA FLOTANTE LLAVE_CERRADA LLAVE_CERRADA {printf("\nDeclaracion de matiz tipo float valida agregando el primer dato - LINEA %d\n",linea);}
    |                  TYPE_STRING  IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO {printf("\nDeclaracion de matriz tipo string valida sin colocar datos - LINEA %d\n",linea);}
    |                  TYPE_STRING  IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL LLAVE_ABIERTA LLAVE_ABIERTA STRING LLAVE_CERRADA LLAVE_CERRADA {printf("\nDeclaracion de matiz tipo string valida agregando el primer dato - LINEA %d\n",linea);}
    ;

ASSIGNMENT_CAD     :   IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL STRING {printf("\nAsignacion de vector tipo string valido - LINEA %d\n",linea);}
    |                  IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL STRING {printf("\nAsignacion de matriz tipo string valida - LINEA %d\n",linea);}
    ;

ASSIGNMENT_CAR     :   IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL CHAR {printf("\nAsignacion de vector tipo char valido - LINEA %d\n",linea);}
    |                  IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL CHAR {printf("\nAsignacion de matriz tipo char valida - LINEA %d\n",linea);}
    ;

ASSIGNMENT_FLOAT   :   IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL FLOTANTE {printf("\nAsignacion de vector tipo float valido - LINEA %d\n",linea);}
    |                  IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL FLOTANTE {printf("\nAsignacion de matriz tipo float valida - LINEA %d\n",linea);}
    ;

ASSIGNMENT_INT     :   IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL INT {printf("\nAsignacion de vector tipo int valido - LINEA %d\n",linea);}
    |                  IDENTIFICADOR CORCHETE_ABIERTO INT CORCHETE_CERRADO CORCHETE_ABIERTO INT CORCHETE_CERRADO IGUAL INT {printf("\nAsignacion de matriz tipo int valida - LINEA %d\n",linea);}
    ;
%%

int main(int argc, char **argv){
    FILE* InputFile = fopen("codigo.txt", "r");
    if (!InputFile){ 
        printf("\nEl archivo no se pudo abrir");
        return 1;
    }
    yyin = InputFile;
    yyparse();
    printf("\nAnalisis Lexico - Sintactico");
    fclose(InputFile);
    return 0;
}


int yyerror (char *s) {printf("%s - LINEA %d\n", s, linea);}