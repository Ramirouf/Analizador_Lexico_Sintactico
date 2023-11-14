#!/bin/bash

flex analizador_lexico.l
echo -e "\nAnalizador lexico compilado correctamente. Se creo un archivo lex.yy.c"
read -n1 -r -p "Presiona una tecla para continuar..." key

gcc lex.yy.c
echo -e "\nArchivo lex.yy.c compilado correctamente. Se creo un archivo a.out"
read -n1 -r -p "Presiona una tecla para continuar..." key

./a.out prueba.txt
echo -e "\nAnalizador lexico ejecutado sobre prueba.txt"


unlink lex.yy.c
unlink a.out
echo -e "\nSe borraron los archivos creados anteriormente. Finalizando programa."
read -n1 -r -p "Presiona una tecla para continuar..." key
