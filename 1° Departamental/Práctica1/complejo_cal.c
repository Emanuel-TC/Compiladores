//ALUMNO: Rodríguez Martínez Heber Emanuel PRACTICA 1: "CALCULADORA DE NÚMEROS COMPLEJOS". PROFESOR: ROBERTO TECLA PARRA. GRUPO: 3CM15 
#include <stdio.h>
#include <stdlib.h>
#include "Calcu_compleja.h"


Complejo *creaComplejo(float real, float img){
   Complejo *nvo = (Complejo*)malloc(sizeof(Complejo));
   nvo -> real = real;
   nvo -> img = img;
   return nvo;
}
Complejo *Complejo_add(Complejo *c1, Complejo *c2){
  return creaComplejo(c1->real + c2->real, c1->img + c2->img);
}
Complejo *Complejo_sub(Complejo *c1, Complejo *c2){
  return creaComplejo(c1->real - c2->real, c1->img - c2->img);
}
Complejo *Complejo_mul(Complejo *c1, Complejo *c2){
  return creaComplejo( c1->real*c2->real - c1->img*c2->img,
                       c1->img*c2->real + c1->real*c2->img);
}
Complejo *Complejo_div(Complejo *c1, Complejo *c2){
   double d = c2->real*c2->real + c2->img*c2->img;
   return creaComplejo( ((c1->real*c2->real) + (c1->img*c2->img)) / d,
                        ((c1->img*c2->real) - (c1->real*c2->img)) / d);
}
void imprimirC(Complejo *c){
   if(c->img != 0)
      printf("%f%+fi\n", c->real, c->img);
   else
      printf("%f\n", c->real);
}


