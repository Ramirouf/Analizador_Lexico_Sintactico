#!/bin/bash

flex lexico.l
echo -e "\nAnalizador lexico compilado correctamente. Se creo un archivo lex.yy.c"
read -n1 -r -p "Presiona una tecla para continuar..." key

bison -d sintactico_yacc.y
echo -e "\nAnalizador sintactico compilado correctamente. Se creo un archivo y.tab.h"
read -n1 -r -p "Presiona una tecla para continuar..." key

gcc  lex.yy.c sintactico_yacc.tab.c
echo -e "\nArchivo lex.yy.c compilado correctamente. Se creo un archivo a.out"
read -n1 -r -p "Presiona una tecla para continuar..." key

./a.out codigo.txt
echo -e "\nAnalizador lexico ejecutado sobre prueba.txt"


unlink lex.yy.c
unlink sintactico_yacc.tab.c
unlink sintactico_yacc.tab.h
unlink a.out
echo -e "\nSe borraron los archivos creados anteriormente. Finalizando programa."
read -n1 -r -p "Presiona una tecla para continuar..." key