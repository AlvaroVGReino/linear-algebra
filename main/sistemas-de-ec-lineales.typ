#import "../metadata.typ": *
#import "../enviroments.typ": *

#import "../temp/math.typ": *
#import "../temp/text.typ": *
#import "../temp/constants.typ": *


#chapter-counter.step()
#set footnote(numbering: "*")

#pagebreak()


= Sistemas de ecuaciones lineales

#definition(title: "Sistema de ecuaciones lineales")[

  Sea $K$ un cuerpo. Un sistema con $m$ ecuaciones lineales y $n$ incógnitas con coeficientes en $K$ es
  $
    S equiv cases(
      a_(1 1) & x_1 & + & dots & + a_(1 n) & x_n eq & b_1,
      a_(2 1) & x_1 & + & dots & + a_(2 n) & x_n eq & b_2,
      & dots.v quad && dots.down & quad & dots.v & dots.v,
      a_(m 1) & x_1 & + & dots & + a_(m n) & x_n eq & b_m
    )
  $
  tal que
  $
    a_(i j), b_i in K, quad (1<=i<=m, quad 1<=j<=n)
  $
]

#definition(title: "Solución del sistema de ecuaciones")[

  Un $alpha eq (alpha_1,alpha_2, dots,alpha_3) in K^n$ es solución de un sistema de ecuaciones lineales $S$ sí y solo sí se verifica

  $
    mat(
      delim: #none,
      a_(1 1)alpha_1, +, dots, +, alpha_(1 n)alpha_n, eq, b_1;
      dots.v, , dots.down, , dots.v, , dots.v;
      a_(m 1)alpha_1, +, dots, +, alpha_(m n)alpha_n, eq, b_m;
    )
  $
]

#definition(title: [Componentes de $S$])[

  En un sistema de ecuaciones distinguimos los siguientes componentes:

  - $a_(i j) to$ Coeficientes del sistema,

  - $b_i to$ terminos independientes,

  - $x_i to$ incógnitas.
]

#definition(title: "Clasificación por número de soluciones")[

  Para $S$ un sistema de ecuaciones se tiene:

  + $S$ es compatible si tiene solución.

    - Si la solución es única es compatible determinado (S.C.D.),

    - Si tiene más de una solución es compatible indeterminado (S.C.I).

  + $S$ es incompatible si no tiene solución (S.I.).
]

#remark()[
  Si el cuerpo sobre el que se trabaja es finito, que el sistema sea compatible indeterminado no implica que tenga soluciones infinitas.
]

#example()[
  Consderando un sistema de ecuaciones lineal sencillo
  $
    cases(x+y eq 0)
  $
  podemos afirmar que es un sistema de ecuaciones compatible indeterminado (aunque lo demostraremos a continuación) por tener 1 ecuación y 2 incógnitas.

  Si trabajamos sobre $RR$, cuerpo infinito, lo solucionamos:
  $
    x + y eq 0 then x eq -y
  $
  tomando $y eq t$ con $t in RR$ tenemos
  $
    (x,y) eq (-t,t) in RR^2
  $
  luego
  $
    {(-t,t):t in RR}
  $
  por lo que hay infinitas soluciones.

  Pero si cambiamos el cuerpo sobre el que trabajamos a $ZZ"/"2 ZZ$ finito tal que
  $
    ZZ"/"2ZZ eq {0,1}
  $
  donde $1+1 eq 0$, la misma ecuación se solucionaría:
  - Si $x eq 0$:
  $
    0+y eq 0 then y eq 0,
  $
  - Si $x eq 1$:
  $
    1+y eq 0 then y eq 1.
  $
  Luego las soluciones son
  $
    (0,0),(1,1)
  $
]

#note[
  En general se verificará que un sistema compatible indeterminado de un sistema de ecuaciones lineal sobre un cuerpo $K$ finito tendrá
  $
    abs(K)^n
  $
  soluciones, donde n es el número de variables independtientes.
]

#definition(title: [Matriz y matriz ampliada de $S$])[
  Consideramos
  $
    A eq mat(a_(1 1), dots, a_(1 n); dots.v, dots.down, dots.v; a_(m 1), dots, a_(m n)) in M_(m times n) (K)
  $
  es la matriz del sistema de ecuaciones $S$.

  Asimismo
  $
    (A|B) eq mat(, |, b_1; quad A quad, |, dots.v; , |, b_m)
  $
  es su matriz ampliada.
]

#remark()[
  Si tenemos
  $
    B eq mat(b_1; dots.v; b_m), quad X eq mat(x_1; dots.v; x_n),
  $
  entonces
  $
    A X eq B
  $
  y se tiene que
  $
    alpha "es solución" <==> quad A mat(alpha_1; dots.v; alpha_n) eq mat(b_1; dots.v; b_m).
  $
]

#proposition()[
  Sea $f:K^n to K^m$ una aplicación lineal tal que
  $
    (f)_(basec basec') eq A
  $
  luego $alpha in K^n$ es solución de $A X eq B$ si y solo si
  $
    f(alpha_1,dots,alpha_n) eq (b_1,dots,b_m)
  $
]

#proposition()[
  Un sistema tiene solución si y solo si
  $
    b in im(f).
  $
]

#proposition()[
  Un sistema es compatible si y solo si
  $
    ran(A) eq ran(A|B)
  $
]

#dem[
  Por ser $S$ compatible,
  $
    b in im(F) <==> im(f) eq im(f) + gen(b) <==> \
    <==> dim(im(f)) eq dim(im(f)+gen(b)) <==> \
    <==> ran(A) eq ran(A|B)
  $
]

#proposition()[

  Sea $A X eq B$ un sistema compatible, es decir, existe $alpha in K^n$ solución, luego
  $
    beta in K^n then f(beta) eq b.
  $
  así
  $
    f(alpha) eq f(beta) then f(alpha - beta) eq 0 then alpha - beta in ker(f) then \
    then exists delta in ker(f) : beta eq alpha + delta.
  $
]

#example[
  Sea el sistema de ecuaciones
  $
    S equiv cases(y-z eq 0, x - 3z eq -1, -x +3y eq 1)
  $
  se tiene que $alpha eq (-1,0,0)$ es solución. Pero, ¿hay más?

  Por la proposición anterior sabemos que
  $
    {"Soluciones de "S} eq alpha + ker(f)
  $
  luego
  $
    (f)_(basec basec) eq mat(0, 1, -1; 1, 0, 3; -1, 3, 0) mat(x; y; z) eq mat(y-z; x+3z; -x+3y) eq mat(0; 0; 0)
  $
  Así,
  $
    ker(f) eq {(x,y,z) in RR^3 : mat(delim: #none, y-z; x+3z; -x+3y)} eq {(3z,z,z) : z in R} eq.not {0}
  $
  Por lo que todas las soluciones de $S$ serán
  $
    {(-1,0,0)+(3lambda,lambda,lambda) : lambda in R} eq {(-1+3lambda,lambda,lambda) : lambda in RR}
  $
]

#theorem(title: [Teorema de Rouché-Frobenius])[
  Un sistema $A X eq B$ tal que tiene $n$ incógnitas es:
  - compatible $<==> ran(A) eq ran(A|B) eq r$

    - compatible determinado $<==> r eq n$,

    - compatible indeterminado $<==> r<n$,

  - incompatible $<==> ran(A) eq.not ran(A|B)$.
]

#corollary()[
  Sea $S equiv A X eq B$ un sistema de ecuaciones y $A in M_(n times n) (K)$.
  $
    S "es C.D." <==> A "es no singular"
  $
]

#dem[
  "$<==$"

  Supongamos que existe $A^(-1)$, luego
  $
    A X eq B then a^(-1) A X eq A^(-1) B then X eq A^(-1) B
  $
  que es solución.

  "$==>$"

  Por ser $S$ C.D. tenemos que
  $
    ker(f) eq {0} then f "inyectiva" then f "biyectiva" then A "no singular"
  $
]

#definition(title: [Sistema homogéneo])[
  Un sistema de ecuaciones lineales es homogéneo si $B eq 0$, es decir:
  $
    A X eq 0
  $
]

#remark()[
  Los sistemas homogéneos siempre son compatibles y $(0,dots,0)$ es solución.
]

#definition(title: [Equivalencia de sistemas])[
  Dos sistemas son equivalentes si tienen las mismas soluciones.
]

#definition(title: [Operaciones elementales en $S$])[
  Una operación elemental en un sistema $S$ es

  + Intercambiar dos ecuaciones.

  + Multiplicar una ecuación por un escalar distinto de 0.

  + A una ecuación sumarle un múltiplo de otra.

  Estas ecuaciones estanen correspondencia biunívoca con las operaciones elementales de la matriz ampliada.
]

#proposition()[
  Sea $S$ un sistema $A X eq B$ y $S'$ el sistema obtenido tras hacer en $S$ operaciones elementales. Luego $S$ y $S'$ son equivalentes
]

#dem()[

  Consideremos el conjunto de operaciones elementales:
  $
    mat(delim: #none, (A|B) to dots to dots to (E A|E B); stretch(->)^(quad quad quad quad quad quad quad quad quad quad quad quad quad quad quad quad quad)_E)
  $
  Si $alpha$ es solución de $S$,
  $
    A alpha^t eq B <==> E A alpha^t eq E B
  $
  Luego $alpha$ es solución de $S'$.
]

#definition(title: [Sistema escalonado])[
  Un sistema $S$ es escalonado si su matriz ampliada es escalonada.
]

#example[
  Consideremos el sistema de ecuaciones lineales
  $
    S equiv cases(x-3y+z eq 1, 2x-y-2z eq 2, x+2y-3z eq -1)
  $
  Escalonamos la matriz asociada para resolver
  $
    mat(
      delim: #none,
      1, -3, 1, bar.v.broken, 1;
      2, -1, 2, bar.v.broken, 2;
      1, 2, -3, bar.v.broken, -1
    ) quad to quad mat(
      delim: #none,
      1, -3, 1, bar.v.broken, 1;
      0, 5, -4, bar.v.broken, 0;
      0, 5, -4, bar.v.broken, -2
    ) quad to quad mat(
      delim: #none,
      1, -3, 1, bar.v.broken, 1;
      0, 5, -4, bar.v.broken, 0;
      0, 0, 0, bar.v.broken, 2
    )
  $
  Luego podemos ver que el la matriz $A$ escalonada no es linealmente independiente luego no es invertible, por lo que es un sistema incompatible ($ran(A) eq.not ran(A|B)$).

  Además la última fila del sistema significa
  $
    0x + 0y + 0z eq 2 then 0 eq 2
  $
  lo cual no es posible, por eso es incompatible.
]

#example[

  Consideremos el siguiente sistema
  $
    S equiv cases(x-y+z eq a-1, 2x+y+a z eq a, x+a y+z eq 1)
  $
  Escalonando
  $
    mat(
      delim: #none,
      1, 1, 1, bar.v.broken, a-1;
      2, 1, a, bar.v.broken, a;
      1, a, 1, bar.v.broken, 1
    ) quad to quad mat(
      delim: #none,
      1, 1, 1, bar.v.broken, a-1;
      0, -1, a-2, bar.v.broken, -a+2;
      0, a-1, 0, bar.v.broken, -a+2
    )
  $
  Luego en función del parámetro $a$, distinguimos los siguientes casos:
  - Si $a eq 2$
    $
      ran(A|B) eq 1 eq ran(A) < 3
    $
    Luego el sistema será compatible indeterminado.

  - Si $a eq 1$
    $
      mat(
        delim: #none,
        1, 1, 1, bar.v.broken, 0;
        0, -1, -1, bar.v.broken, 1;
        0, 0, 0, bar.v.broken, -1
      )
    $
    Luego es incompatible el sistema.

  - Si $a eq.not 1$ y $a eq.not 2$
    $
      ran(A|B) eq ran(A) eq 3
    $
    Así que, por el teorema de Rouché-Frobenius, el sistema sería compatible determinado.
]
