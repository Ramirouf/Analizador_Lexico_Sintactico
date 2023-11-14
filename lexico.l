%option noyywrap
%{
	#include<stdio.h>
    #include<float.h> // Para los rangos del flotante
    FILE *yyin;
    int funct_val_integer_rango(char*ptr);
    int funct_val_float_rango(char*ptr);
    int yyerror(void);
%}

/* DECLARACIONES ELEMENTALES */
CORCHETE_ABIERTO    ["["]
CORCHETE_CERRADO    ["]"]
DIGITO              [0-9]
PUNTO               ["."]

IDENTIFICADOR       [a-zA-Z][_A-Za-z0-9]*
FLOTANTE            {DIGITO}{0,8}{PUNTO}{DIGITO}{1,8}
ENTERO              (-?[1-9]{DIGITO}{0,4})|0
CARACTER            [a-zA-Z]
CADENA              \"[^\n"]*\"
PUNTO_Y_COMA        ";"

 /* PALABRAS RESERVADAS */

INT                 "int"
FLOAT               "float"
STRING              "string"
CHAR                "char"

%%

{FLOTANTE}      {funct_val_float_rango(yytext); return "FLOTANTE";}
{FLOAT}         {return "FLOAT";}
{ENTERO}        {funct_val_integer_rango(yytext); return "INT";}
{INT}           {return "INT";}

%%

int main(int argc, char *argv[]){
    if((yyin=fopen(argv[1], "rt")) == NULL){
        printf("\nNo se puede abrir el archivo: %s\n",argv[1]);
        return 1;
    }
    else{
        printf("\nEL archivo %s se abrio correctamente\n",argv[1]);
        yylex();
    }
    printf("\nFLEX finalizo la lectura del archivo %s\n",argv[1]);
    fclose(yyin);
    return 0;
}

int funct_val_integer_rango(char*ptr){
    int value = atoi(ptr);
    if(value < -32768 || value > 32767){
        printf("\n¡ERROR! VARIABLE FUERA DE RANGO: %s\n", yytext);
        return yyerror();
    }
    return 0;
}

int funct_val_float_rango(char*ptr){
    float value = atof(ptr);
    if(value < FLT_MIN || value > FLT_MAX){
        printf("\n¡ERROR! VARIABLE FUERA DE RANGO: %s\n", yytext);
        return yyerror();
    }
    return 0;
}

int yyerror(void){
    printf("\nERROR DE LEXICO: CARACTER (%s) NO VALIDO. FINALIZANDO...\n", yytext);
    exit(1);
}
