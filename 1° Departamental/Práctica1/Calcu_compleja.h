//ALUMNO: Rodríguez Martínez Heber Emanuel PRACTICA 1: "CALCULADORA DE NÚMEROS COMPLEJOS". PROFESOR: ROBERTO TECLA PARRA. GRUPO: 3CM15 
#include <string.h>
struct complejo {
  double real, img;
};
typedef struct complejo Complejo;
typedef struct complejo *ComplejoAP;
/*  prototypes of the provided functions */ 
Complejo *creaComplejo(float real, float img);
Complejo *Complejo_add(Complejo *, Complejo *);
Complejo *Complejo_sub(Complejo *, Complejo *);
Complejo *Complejo_mul(Complejo *, Complejo *);
Complejo *Complejo_div(Complejo *, Complejo *);
void imprimirC(Complejo *c);
/*  prototypes of the provided functions */ 
/* define the return type of FLEX */
#define YYSTYPE ComplejoAP
