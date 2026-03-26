#import "../metadata.typ": *
#import "../temp/math.typ": *
#import "../temp/text.typ": *
#import "../temp/constants.typ": *
#import "../enviroments.typ": *
#import "@preview/cetz:0.4.2"
#import "@preview/larrow:1.0.1": *
#import "@preview/wrap-it:0.1.1": wrap-content
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#set footnote(numbering: "*")

#pagebreak()

= Aplicaciones Lineales

#definition(title: "Matriz")[

  Una matriz de orden (o tipo o tamaño) $m times n$ con coeficientes en el cuerpo $K$ es un conjuntod e $m times n$ escalares colocados en filas o en columnas.
  $
    A eq (a_(i j))_cases(delim: #none, 1 <= i <= m, 1 <= j <= n) #footnote[en general, emplearemos la notación $(a_(i j))_(i j)$ para representar $(a_(i j))_cases(delim: #none, 1 <= i <= m, 1 <= j <= n)$ por comodidad.] eq mat(
      a_(1,1), dots, a_(1,n);
      dots.v, dots.down, dots.v;
      a_(m,1), dots, a_(m,n)
    )
  $
  En concreto, si:
  - $m eq n$, se denomina _matriz cuadrada_,
  - $m times 1$, es _matriz columna_,
  - $1 times n$, es _matrix fila_

]
