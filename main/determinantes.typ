#import "../metadata.typ": *
#import "../enviroments.typ": *

#import "../temp/math.typ": *
#import "../temp/text.typ": *
#import "../temp/constants.typ": *


#chapter-counter.step()
#set footnote(numbering: "*")

#pagebreak()


= Determinantes

#definition(title: [Aplicación $n$-lineal])[

  Sean $V_1,...,V_n,W$ y $V_1 times ... times V_n$ $K$-espacios vectoriales.

  Una aplicación $f:V_1 times ... times V_n to W$ es multilineal o $n$-lineal si se verifica:

  1. $
      f(v_1,...,v_i + v'_i,...,v_n) eq \
      f(v_1,...,v_i,...,v_n)+f(v_1,...,v'_i,...,v_n)
    $

  2. $
      f(v_1,...,lambda v_i,...,v_n) eq lambda f(v_1,...,v_i,...,v_n), quad forall lambda in K
    $
]

#example[
  Considerando $f: RR times RR to RR$ tal que $f(x,y) eq x y$ es un aplicación $n$-lineal, en concreto, bilineal por que:
  $
    f(x,y_1+y_2) eq x (y_1 +y_2) eq x y_1 + x y_2 eq f(x,y_1)+f(x,y_2)
  $
  y
  $
    f(x,lambda y) eq x dot lambda dot y eq lambda (x y) eq lambda f(x,y)
  $
]

#definition(title: [Antisimetría])[

  Sea $f: V times .. times V to W$ una aplicación $n$-lineal.

  Se dice que $f$ es antisimétrica si
  $
    f(v_1, dots, v_n) eq 0
  $
  si $v_i eq v_j$ con $i eq.not j$.
]

#proposition()[

  Sea $f$ multilineal, se verifica que

  $
    f(v_1,...,v_n) eq 0 "si" v_i eq v_(i + 1) "con" 1<=i<=n-1 <==> \
    <==> f "es antisimétrica"
  $
]

#dem()[

  "$==>$"

  $
    0 eq f(v_1,...,v_i+ v_(i+1),v_(i+1)+v_i,...,v_n) eq \
    f(v_1,...,v_i,v_(i+1),...,v_n) + underbrace(f(v_1,...,v_i,v_i,...,v_n), 0) + \
    + underbrace(f(v_1,...,v_(i+1),v_(i+1),...,v_n), 0) + f(v_1,...,v_(i+1),v_i,...,v_n)
  $
  Luego,
  $
    0 eq f(v_1,...,v_i,v_i+1,...,v_n) + f(v_1,...,v_i+1,v_i,...,v_n) then \
    then f(v_1,...,v_i,v_(i+1),...,v_n) eq - f(v_1,...,v_(i+1),v_i,...v_n)
  $
  Por lo que si vamos moviendo hasta que los términos iguales esten juntos
  $
    plus.minus f(v_1,...,v_i,v_j,...,v_n) eq 0
  $
  Luego es antisimétrica.

  "$<==$"

  Por ser $f$ antisimétrica tenemos que de existir $v_i eq v_j$ tal que $i eq.not j$ se tendrá que $f(v_1,...,v_i,v_j,...,v_n) eq 0$, en concreto si $j eq i+1$.
]

#proposition(title: [Propiedades de las aplicaciones $n$-lineales antisimétricas])[

  Sea $f$ $n$-lineal antisimétrica, se verifica:

  + $ f(v_1,...,v_i,...,v_j,...,v_n) eq -f(v_1,...,v_j,...,v_i,...,v_n) $

  + $
      f(v_1,...,v_i + lambda v_j,...,v_j,...,v_n) eq f(v_1,...,v_n)
    $

  + $
      f(v_(sigma(1)),...,v_(sigma(n))) eq "sig"(sigma) f(v_1,...,v_n)
    $

  + $
      "Para" e_1,...,e_n in V, quad v_i eq sumjn lambda_(i j) e_j quad (1<=i<=n) \
      then f(v_1,...,v_n) eq [sum_(sigma in S_n) "sig"(sigma) lambda_(1 sigma(1)) dot ... dot lambda_(n sigma(n))] f(e_1,...,e_n)
    $
]

#dem[

  + Tenemos
    $
      0 eq f(v_1,...,v_i+v_j,...,v_j+v_i,...,v_n)
    $
    por ser antisimétrica, que desglosando:
    $
      0 eq f(v_1,...,v_i,...,v_j,...,v_n) + f(v_1,...,v_i,...,v_i,...,v_n) + \
      + f(v_1,...,v_j,...,v_j,...,v_n) + f(v_1,...,v_j,...,v_i,...,v_n) eq \
      eq f(v_1,...,v_i,...,v_j,...,v_n) + f(v_1,...,v_j,...,v_i,...,v_n)
    $
    Por lo tanto
    $
      f(v_1,...,v_i,...,v_j,...,v_n) eq - f(v_1,...,v_j,...,v_i,...,v_n)
    $

    Que es equivalente a un paso de la demostración de la proposición anterior pero generalizado sin requerir que sean términos contiguos.

  + Es rápido ver
    $
      f(v_1,...,v_i+lambda v_j,...,v_n) eq \
      eq f(v_1,...,v_n) + lambda underbrace(f(v_1,...,v_j,...,v_j,...,v_n), 0) eq \
      eq f(v_1,...,v_n)
    $

  + Sea $sigma in S_n$ una permutación de las índices de 1 hasta n tal que
  $
    sigma eq tau_1 tau_2 ... tau_r eq tau_1 sigma'
  $

  es una descomposición, paso a paso de esta.

  Así,

  $
    f(v_(sigma(1)),...,v_(sigma(n))) eq
  $

  son meras permutaciones, por lo que si deshacemos un paso, por antisimetría
  $
    eq f(v_(tau_1 sigma'(1)),...,v_(tau_1 sigma'(n))) eq -f(v_(sigma'(1)),...,v_(sigma'(n)))
  $

  que ahora si repetimos hasta llegar al orden usual de los índices:
  $
    eq - "sig"(sigma') f(v_1,...,v_n) eq "sig"(tau_1) "sig"(sigma') f(v_1,...,v_n) eq \
    eq "sig"(sigma) f(v_1,...,v_n)
  $

  + Sea ${e_1,...,e_n}$ elementos de una base y definimos
  $
    u_k eq sumin lambda_(i k) e_i
  $
  Luego
  $
    f(u_1,...,u_n) eq f(sum_(i_1 eq 1)^n lambda_(i_1 1) e_i_1,...,sum_(i_n eq 1)^n lambda_(i n) e_n) eq \
    eq sum_(i_1 eq 1)^n sum_(i_2 eq 1)^n dots sum_(i_n eq 1)^n (lambda_(i_1 1) dot lambda_(i_2 2) dot dots dot lambda_(i_n n)) f(e_i_1,...,e_i_n)
  $
  Como es antisimétrica, se van a cancelar todos los términos salvo los que cumplan que $i_1 eq.not i_2 eq.not ... eq.not i_n$. Como todos están entre 1 y n, y hay n índices, deben ser una permitación de $(1,...,n)$.

  Por lo tanto, habrá tantos sumandos no nulos como permutaciones y todos valdrán lo mismo salvo el signo por el punto 3 de la proposición.

  Con esto llegamos entonces a que el sumatorio será sobre todas las permutaciones posibles

  $
    f(v_1,...,v_n) eq sum_(sigma in S_n) "sig"(sigma) (lambda_(sigma(1) 1),...,lambda_(sigma(n) n)) f(e_1,...,e_n)
  $
]

#idea()[

  En tñerminos generales, todos los puntos de la anterior porposición son distintas expresiones de la antisimetría de $f$:

  1,2 son evidentes y directas.

  Para 3, como $sigma$ representa una permitación de los elementos de $RR^n$, el signo final dependerá de la permitación aplicada
]

#exercise()[


]

#definition(title: [Determinante])[

  El determinante es una aplicación n-lineal simétrica
  $
    det: K^n times overbrace(dots, n) times K^n to K
  $
  tal que el determinante de la base canónica es 1,
  $
    det(e_1, ..., e_n) eq det(I_n) eq 1
  $
  Además, la aplicación es única.

  En concreto, para $n eq 1$,
  $
    A eq (a_(i j)) in M_n (K)
  $
  se cumple que
  $
    det(A) eq a quad ("si" A eq (a))
  $
]


#definition()[

  Sean $v_1,...,v_n$ vectores de $K^n$, con
  $
    v_i eq mat(a_(1 j); dots.v; a_(n j))
  $
  El determinante es

  $
    det(A) eq sum_(sigma in S_n) "sig"(sigma) a_(sigma(1) 1) dot ... dot a_("sig"sigma(n) n) eq \
    eq sumjn a_(i j) det(A_(i j))
  $
]

#remark()[

  Sea $A in M_n (K)$ con columnas $v_1,...,v_n$. Se define el determinante de $A$ como:
  $
    det(A) eq det(v_1, ..., v_n)
  $

  Es decir, el determinante de una matriz es el determinante de sus columnas (o filas).
]

#remark()[

  Toda aplicación n-lineal y antisimétrica queda completamente determinada por el valor que toma en la base canónica. Por eso, imponer que ese valor sea 1 define de manera única el determinante.
]

#remark(title: [Consecuencia de la definición])[

  Por ser el determinante una aplicación antisimétrica y ser equivalente
  $
    det(A) eq det(v_1, ..., v_n)
  $
  si existen $v_i eq lambda v_j$ para $i eq.not j$, el determinante será $0$.

  Dicho de otra manera, si la matriz tiene filas o columnas linealmente dependientes, el determinante será 0.
]

#exercise()[

]



