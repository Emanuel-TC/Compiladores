/*ALUMNO: Rodríguez Martínez Heber Emanuel. PRACTICA 1: “CALCULADORA DE NÚMEROS COMPLEJOS". PROFESOR: ROBERTO TECLA PARRA. GRUPO: 3CM15*/
%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include "Calcu_compleja.h"
#include "y.tab.h"
extern Complejo *creaComplejo(float real, float img);
void RmWs(char* str);
extern YYSTYPE yylval;
%}
/* Add your Flex definitions here              */
/* Some definitions are already provided to you*/
op [-+*/()]
ws [ \t]+
digits [0-9]
number (0|[1-9]+{digits}*)\.?{digits}*
im [i]
complexnum {ws}*[-]*{ws}*{number}{ws}*[+|-]{ws}*{number}{ws}*{im}{ws}*
%%
{complexnum} {
 double r, im;
 RmWs(yytext); 
 sscanf(yytext,"%lf %lf",&r,&im); 
 yylval=creaComplejo(r,im);
 return CNUMBER;}
{op} |
\n {return *yytext;}
{ws} { /* Do nothing */ } 
. { /* Do nothing */ }
%%
/* function provided to student to remove */
/* all the whitespaces from a string.     */
/* input :       a string of chars        */
/* output:       nothing                  */
/* side effect:  whitespace in the        */
/*               original string removed  */
/* return value: none                     */
void RmWs(char* str) {
  int i = 0, j = 0;
  char temp[strlen(str) + 1];
  strcpy(temp, str);
  while (temp[i] != '\0') {
    while (temp[i] == ' ')
      i++;
    str[j] = temp[i];
    i++;
    j++;
  }
 str[j] = '\0';
}



