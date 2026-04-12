#import "../metadata.typ": *
#import "../enviroments.typ": *

#import "../temp/math.typ": *
#import "../temp/text.typ": *
#import "../temp/constants.typ": *


#chapter-counter.step()
#set footnote(numbering: "*")

#pagebreak()


= Determinantes

#definition()[

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

#definition()[

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
  Luego, como demostraremos en la siguiente proposición, podemos afirmar:
  $
    f(v_1,...,v_i,v_(i+1),...,v_n) eq - f(v_1,...,v_(i+1),v_i,...v_n)
  $
  Por lo que si vamos moviendo hasta que los términos iguales esten juntos
  $
    plus.minus f(v_1,...,v_i,v_j,...,v_n) eq 0
  $
  Luego es antisimétrica.

  "$<==$"

  Por ser $f$ antisimétrica tenemos que de existir $v_i eq v_j$ tal que $i eq.not j$ se tendrá que $f(v_1,...,v_i,v_j,...,v_n) eq 0$, en concreto si $j eq i+1$.
]

#proposition()[

  
]
