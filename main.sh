#!/bin/bash

yacc -d sintactico_yacc.y
echo -e "\nAnalizador sintactico compilado correctamente. Se creo un archivo y.tab.h"
read -n1 -r -p "Presiona una tecla para continuar..." key

flex lexico.l
echo -e "\nAnalizador lexico compilado correctamente. Se creo un archivo lex.yy.c"
read -n1 -r -p "Presiona una tecla para continuar..." key

gcc y.tab.c lex.yy.c #verificar este llamado
echo -e "\nArchivo lex.yy.c compilado correctamente. Se creo un archivo a.out"
read -n1 -r -p "Presiona una tecla para continuar..." key

./a.out codigo.txt
echo -e "\nAnalizador lexico ejecutado sobre prueba.txt"


unlink lex.yy.c
unlink y.tab.c
unlink y.tab.h
unlink a.out
echo -e "\nSe borraron los archivos creados anteriormente. Finalizando programa."
read -n1 -r -p "Presiona una tecla para continuar..." key