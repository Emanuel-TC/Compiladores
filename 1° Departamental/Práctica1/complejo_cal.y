/*ALUMNO: Rodríguez Martínez Heber Emanuel. PRACTICA 1: “CALCULADORA DE NÚMEROS COMPLEJOS". PROFESOR: ROBERTO TECLA PARRA. GRUPO: 3CM15*/
%{
#include <stdio.h>
#include <math.h>
#include "Calcu_compleja.h"
#define YYSTYPE ComplejoAP 
void yyerror (char *s);
int yylex ();
void warning(char *s, char *t);

void *(*add_)(void *dob1, void *dob2)=Complejo_add;
void *(*sub_)(void *dob1, void *dob2)=Complejo_sub;
void *(*mul_)(void *dob1, void *dob2)=Complejo_mul;
void *(*div__)(void *dob1, void *dob2)=Complejo_div;
void (*print_)(void *dob)=imprimirC;
%}
%token CNUMBER
%left '+' '-'
%left '*' '/'
%% 
list:   
    | list '\n'
    | list exp '\n'  { print_($2); }
    ;
exp: CNUMBER         { $$ = $1;  }
    | exp '+' exp     { $$ = add_($1, $3);  }
    | exp '-' exp     { $$ = sub_($1, $3);  }
    | exp '*' exp     { $$ = mul_($1, $3);  }
    | exp '/' exp     { $$ = div__($1,$3);  }
    | '(' exp ')'     { $$ = $2;}
    ;
%%

#include <stdio.h>
#include <ctype.h>
char *progname;
int lineno = 1;

void main (int argc, char *argv[]){
	progname=argv[0];
  	yyparse ();
}
void yyerror (char *s) {
	warning(s, (char *) 0);
}
void warning(char *s, char *t){
	fprintf (stderr, "%s: %s", progname, s);
	if(t)
		fprintf (stderr, " %s", t);
	fprintf (stderr, "está cerca de la linea -> %d\n", lineno);
}

