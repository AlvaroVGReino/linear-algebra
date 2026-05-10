#import "../metadata.typ": *
#import "../enviroments.typ": *

#import "../temp/math.typ": *
#import "../temp/text.typ": *
#import "../temp/constants.typ": *


#chapter-counter.step()
#set footnote(numbering: "*")

#pagebreak()


= La forma de Jordan

Sea $f in end_KK (V)$ un endomorfismo tal que todas las raíces de $p_f (x)$ estan en $KK$, por lo que son eigenvalores de $f$. Como sabemos, esta condición es necesaria para que $f$ sea diagonalizable, pero no es suficiente: hace falta, adicionalmente, que las multiplicidades algebraicas y geométricas coincidan para cada eigenvalor.

En este tema estudiaremos los endomorfismos, $f in end_KK (V)$ que verifican que todas sus raíces de $p_f (x)$ estan en $KK$ pero no necesariamente la otra, por lo que no diagonalizan. Para ello, probaremos que hay una base en $V$ con respecto a la cual la matriz asociada a $f$ es particularmente sencilla: está muy próxima a ser una matrioz diagonal, y se llamará matriz de Jordan, o la forma de Jordan o la forma canónica de Jordan de $f$.

La condición de que las raíces de $p_f (x)$ estén en $KK$ se cumple siempre si $KK eq CC$, o más generalmente, si $KK$ es algebraicamente cerrado. Para $KK eq RR$ no siempre es cierto, pero en este caso, como cada $A in M_(n times n) (RR)$ puede ser considerada en $M_(n times n) (CC)$, veremos que hay una base con respecto a la cual la matriz de $f$, sin ser tan sencilla como una matriz de Jordan, sigue siendo bastante sencilla; serña lo que se llama forma de Jordan real de $f$.

Para llevar esto a cabo, necesitamos un resultado previo sobre la descomposición de $V$ en suma directa de ciertos subespacios asociados a los eigenvalores de $f$. A su vez, para demostrar este resultado, necesitamos la triangulareización de endomorfismos y el Teorema de Cayley-Hamilton.

== Triangularización


#definition(title: [Matriz triangular])[

  Una matriz triangular (superior) es aquella $A eq (a_(i j)) in M_(n times n) (KK)$ tal que $a_(i j) eq 0$ si $i>j$.
]

#proposition()[

  Si $A$ es una matriz triangular, los eigenvalores de $A$ son $a_(11), a_(22), ..., a_(n n)$. Y, en efecto, su polinomio característico es de la forma:
  $
    (a_(11)-x)·(a_22 - x)·...·(a_(n n)-x),
  $
  y como sus raíces: $a_11, a_22,...,a_(n n)$, estan en $KK$, son los eigenvalores.
]

#definition(title: [Endomorfismo triangularizable])[

  Un endomorfismo $f: V to V$ se dice triangularizable si existe una base de $V$ con respecto a la cual la matriz de $f$ es triangular.
]

#theorem(label: <theo:triagularizacion>)[

  Un endomorfismo $f in end_KK (V)$ es triangularizable si y solo si, todas las raíces de $p_f (x)$ estan en $KK$.
]

#dem[
  "$==>$"

  Consecuencia de que si $A in M_(n times n) (KK)$ es triangular, entonces las raíces de $p_A (x)$ son las $a_(i i), 1<=i<=n$.

  "$<==$"

  Procedamos por inducción en $n eq dim(V)$.

  Para $n eq 1$ no hay nada que demostrar. Luego supongamos que $n>1$ y que es cierto para $n-1$. Sea $lambda_1$ un eigenvalor de $f$, y sea $v_1 in V, v_1 eq.not 0$, tal que $f(v_1) eq lambda_1 v_1$.

  Consideremos una base de $V$ de la forma ${v_1, w_2,...,w_n}$, y sea $W eq.def gen(w_2","...","w_n)$. Se tiene, entonces:
  $
    V eq gen(v_1) plus.o W
  $
  Sea $p:V to W$ la proyección canónica:
  $
    p(alpha v_1 + w) eq w, forall alpha in KK, forall w in W
  $
  y sea
  $
    q eq.def (p compose f)|_W : W to W
  $
  de modo que para $w in W$ se cumple que
  $
    g(w) "es la componente de" f(w) "en" W
  $<proper:gw-fw>
  Sea $B in M_((n-1) times (n-1)) (KK)$ la matriz de $g$ con respecto a la base ${w_2,...,w_n}$ de W.

  Para $2<=i<=n$, se tiene
  $
    f(w_i) eq a'_(1 i) · v_1 + g(w_i), quad "con" a'_(1 i) in KK
  $
  y la matriz de $f$ respecto a la base ${v_1,w_2,...,w_n}$ de $V$ es:

  #align(center)[
    $A eq$ #pavemat(
      pave: "dsSSSDDDWWWAAA",

      stroke: (dash: "dashed", thickness: 1pt, paint: black),
      fills: (
        "1-1": blue.transparentize(60%),
      ),
      delim: "(",
    )[$mat(lambda_1, a'_(1 2), ..., a'_(1 n); 0, "", "", ""; dots.v, "", B, ""; 0, "", "", "")$]
  ]
  Entonces, para los polinomio característicos se tiene:

  $
    p_f (x) eq (lambda_1 - x) p_g (x)
  $
  Puesto que todas las raíces de $p_f (x)$ estan en $KK$, lo mismo ocurre con las de $p_g (x)$.

  Por inducción, existe ${v_2,...,v_n}$ base de $W$ tal que la matriz de $g$ asociada a esta base es triangular:

  $
    mat(b_22, b_23, ..., b_(2 n); 0, b_33, ..., b_(3 n); dots.v, dots.v, dots.down, dots.v; 0, 0, ..., b_(n n))
  $
  Es obvio que ${v_1,v_2,...,v_n}$ es base de $V$. Para $2<=i<=n$, se tiene $v_i in W$, y entonces por la propiedad de la @proper:gw-fw
  $
    f(v_i) eq a_(1 i)v_1 + g_(v_i), quad a_(1 i) in KK
  $
  veremos que la matriz de $f$ respecto a la base ${v_!,v_2,...,v_n}$ es
  $
    mat(lambda_1, a_12, ..., a_(1 n); 0, b_22, ..., b_(2 n); dots.v, dots.v, dots.down, dots.v; 0, 0, ..., b_(n n))
  $
  la cual es triangular.

  Ya sabemos que $f(v_1) eq lambda_1 v_1$.

  Para $2<=i<=n$, se tiene, por ser $(b_(r s))_(mat(delim: #none, 2<=r<=n; 2<=s<=n))$ la matriz de $g$ respecto a ${v_2,...,v_n}$:
  $
    g(v_i) eq b_(2 i) v_2 + b_(3 i) v_3 + ... + b_(i i) v_i,
  $

  y por tanto
  $
    f(v_i) eq a_(1 i) v_1 + q b_(2 i) v_2 + b_(3 i) v_3 + ... + b_(i i) v_i
  $
]

== El Teorema de Cayley-Hamilton

#definition(title: [Evaluación de un polinomio en $f$])[

  Sea $V$ un $kesp$ de dimensión $n$, y sea $f: V to V$ un endomorfismo. Llamaremos evaluación en $f$ a la siguiente aplicación:
  $
    Phi_f : KK[x] to end_KK (V)\
    p(x) eq sum_(i eq 0)^s |-> sum_(i eq 0)^s a_i f^i
  $
  donde
  $
    f^0 eq.def 1_V, quad f^i eq.def f compose overbrace(..., i) compose f, forall i>= 1
  $

  Denotaremos $p(f) eq.def Phi_f (p)$, y denotaremos $KK[f] eq.def Phi_f (KK[x])$ a la imagen de la aplicación $Phi_f$.
]


#proposition(title: [Propiedades del subanillo $KK[f]$])[

  Nótese que $KK[f]$ es un subanillo conmutativo y unitario del anillo $end_KK (V)$.

  Luego tenemos que $forall p,q in KK[x], forall lambda in KK$ se tienen las siguentes propiedades:

  + $ (p+q)(f) eq p(f) + q(f) $

  + $ (lambda p)(f) eq lambda p(f) $

  + $ (p q)(f) eq p(f) compose q(f) $

  + $ 1(f) eq 1_V $
]

#remark()[

  Dicho de otro modo, la aplicación $Phi_f$ es una aplicación $KK$-lineal, que transforma productos en composiciones y lleva el 1 de $KK[x]$ en $1_V$. Es, pues, un homomorfismo de $kesps$ y un homomorfismo de anillos unitarios #footnote[Una aplicación de este tipo se llama un homomorfismo de $KK$-álgebras].
]

#definition(title: [Polinomio anulador de $f$])[

  Un polinomio $p(x) in ker(Phi_f)$ se llama un polinomio anulador de $f$. Por lo tanto:
  $
    p(x) in KK[x] "es polinomio anulador de" f <==> p(f) eq 0
  $
]

#definition(title: [Polinomio anulador de $A$])[

  Del mismo modo se define, para una matriz $A in M_(n times n) (KK)$, el homomorfismo de $KK$-álgebras:
  $
    Phi_A : KK[x] to M_(n times n) (KK) \
    p(x) eq sum_(i eq 0)^s a_i x^i
  $

  con
  $
    A^0 eq I_n, quad A^i eq A · overbrace(..., i) · A, forall i>=1
  $
  Luego los polinomios $p in ker(Phi_A)$ se llaman los polinomios anuladores de $A$, de modo que
  $
    p(A) eq 0
  $
]

#proposition(title: [Relación entre polinomios anuladores])[

  Sean $f:V to V$ un endomorfismo de $V$, $base$ una base de $V$, $A$ la matriz de $f$ respecto a esta base, y consideremos el homomorfismo de $KK$-álgebras determinado por $base$:
  $
    cal(O): end_KK (V) to^~ M_(n times n) (KK)
  $
  En particular, se tiene $cal(O)(f) eq A$, y esto implica que el diagrama siguente es conmutativo:

  #align(center)[#commutative-diagram(
    node((0, 1), $KK[x]$, "k"),
    node((1, 0), $end_KK (V)$, "e"),
    node((1, 2), $M_(n times n)$, "m"),
    arr("e", "m", $cal(O)$, label-pos: right),
    arr("k", "m", $Phi_A$),
    arr("k", "e", $Phi_f$, label-pos: right),
  )]

  Y en efecto, si $p(x) eq sum_(i eq 0)^s a_i x^i$:
  $
    (cal(O) compose Phi_f)(p) eq cal(O)(p(f)) eq cal(O)(sum_(i eq 0)^s a_i f^i) eq \
    eq sum_(i eq 0)^s a_i cal(O)(f)^i eq sum_(i eq 0)^s a_i A^i eq p(A) eq Phi_A (p)
  $
  Se tiene entonces:
  $
    ker(Phi_f) eq ker(Phi_A),
  $
  por lo que los polinomios anuladores de $f$ son exactamente los mismos que los de $A$.

]

#theorem(title: [Teorema de Cayley-Hamilton], label: <theo:cayley-hamilton>)[

  Sea $f in end_KK (V)$. Entonces, el polinomio característico $p_f (x)$ es un polinomio anulador de $f$:
  $
    p_f (f) eq 0.
  $
]

#dem[

  Sea ${u_1,...,u_n}$ una base de $V$ y expresemos:
  $
    f(u_i) eq sumjn a_(i j) u_i, quad 1<=i<=n
  $
  Considerando las deltas de Kronecher $delta_(i j):cases(delta_(i j) eq 0 ", si" j eq.not i, delta_(i j) eq 1 ", si" i eq j)$. Estas igualdades se pueden escribir:
  $
    sumjn delta_(i j) f(u_j) eq sumjn a_( i j) u_j, quad 1<=i<=n
  $
  y por tanto:
  $
    sumjn (a_(i j) · 1_V - delta_(i j) f)(u_j) eq 0, quad 1<=i<=n
  $

  Sea $B$ la matriz $n times n$ con elementos en el anillo conmutativo $KK[f] subset end_KK (V)$ cuyo elemento del lugar $(b_(i j))$ es $a_(i j) · 1_V -delta_(i j) f$:

  $
    B eq mat(a_11 -f, a_12, ..., a_(1 n); a_21, a_22 - f, ..., a_(2 n); dots.v, dots.v, dots.down, dots.v; a_(n 1), a_(n 2), ..., a_(n n)-f) in M_(n times n) (KK)
  $
  Y las igualdades anteriores se pueden expresar en la forma matricial:
  $
    B · U eq 0,
  $
  donde
  $
    U eq mat(u_1; u_2; dots.v; u_n)
  $
  Así, es facil ver que se verifica la propiedad asociativa:
  $
    C · (B · U) eq (C · B) · U, quad forall C in M_(n times n) (KK[f])
  $
  siendo $C · B$ el producto ordenado de matrices en $M_(n times n) (KK[f])$.

  Si multiplicamos la igualdad $B · U eq 0$, por la matriz $"Adj"(B)^t$, se tiene, en virtud de esta asociatividad:
  $
    0 eq "Adej"(B)^t ·(B · C) eq ["Adj"(B)^t · B]· U eq det(B)·U,
  $
  donde $det(B) in KK[f] subset end_KK (V)$.

  Por lo tanto:
  $
    det(B) · U eq 0 then det(B) (u_i) eq 0, quad forall i eq 1,...,n
  $
  Como ${u_1,...,u_n}$ es base de $V$, se sigue que el endomorfismo $det(B) in end_KK (V)$ es el endomorfismo nulo.

  Pero teniendo en cuenta que $(a_(i j)) in M_(n times n) (KK)$ es la matriz de $f$ con respecto a la base ${u_1,...,u_n}$, resulta que $det(B)$ es precisamente $p_f (f)$. Luego
  $
    p_f (f) eq 0
  $
]

#corollary()[

  Si $A in M_(n times n) (KK)$, entonces el polinomio característico $p_A (x)$ verifica $p_A (A) eq 0$.
]

#remark()[

  El Teorema de Cayley-Hamilton permite usar el polinomio característico para calcular la inversa de una matriz no singular (aunque, generalmente, no es el método más rápido).
]

#example(title: [Cálculo de la inversa con el polinomio característico])[

  Tomemos
  $
    A eq mat(1, 1; -1, 1)
  $
  entonces $p_A (x) eq x^2 - 2 x+ 2$, con lo que, de $p_A (A) eq 0$, se obtiene
  $
    A^2 -2 A + 2 I eq 0 then (A-2 I) A eq -2 I then \
    (A - 2 I) A A^(-1) eq -2 A^(-1) then - 1/2 (A-2I) eq A^(-1)
  $
]

== El Teorema de descomposición

#theorem(title: [Teorema de descomposición])[

  Sea $f in end_KK (V)$, y supongamos que todas la raíces de $p_f (x)$ estan en $KK$:
  $
    p_f (x) eq (-1)^n (x-lambda_1)^(alpha_1) ·...· (x - lambda_r)^(alpha_r)
  $
  con $lambda_i in KK, forall i, quad lambda_i eq.not lambda_j, forall i eq.not j$.

  Sea
  $
    W_i eq.def ker(f-lambda_i · 1_V)^(alpha_i), quad 1<=i<=r
  $
  Entonces:
  $
    V eq W_1 plus.o ... plus.o W_r
  $
  y además:
  $
    f(W_i) subset W_i quad "y"quad dim(W_i) eq alpha_i, quad forall i.
  $
]

#dem[

  Sea $q_i (x) eq.def (x-lambda_i)^(alpha_i)$ para simplificar y
  $
    s_i (x) eq (p_f (x))/(q_i (x)) eq q_1 (x)·...· cancel(q_i (x)) ·...·q_r (x)
  $
  Entonces $s_1 (x),...,s_r (x)$ tienen de máximo divisor común el 1, y por tanto, existen $t_i (x) in KK[x], 1<=i<=r$, tales que:
  $
    sum_(i eq 1)^r t_i (x) · s_i (x) eq 1.
  $
  Luego sean $cal(O)_i eq q_i (f), S_i eq s_i (f), T_i eq t_i (f) in end_KK (V)$.

  Estos tres homomorfismos rdtan en $KK[f]$, y, por tanto, conmutan entre si. Además
  $
    sum_(i eq 1)^(r) T_i compose S_i eq 1_V then v eq sum_(i eq 1)^r T_i (S_i (v)), quad forall v in V
  $

  Por  el @theo:cayley-hamilton de Cayley-Hamilton:
  $
    0 eq p_f (f) eq q_i (f) compose s_i (f) eq cal(O) compose S_i, quad 1<=i<=r
  $
  con lo que $T_i compose cal(O) compose S_i eq 0$, y así, $cal(O) compose T_i compose S_i eq 0$.

  Para $v in V$, esto implica
  $
    T_i (S_i (v)) in ker(cal(O)_i) eq W_i, quad 1<=i<=r,
  $
  y entonces, teniendo en cuenta esto,
  $
    v eq sum_(i eq 1)^r T_i (S_i (v)) in W_1+ ...+ W_r
  $
  Por tanto,
  $
    V eq W_1 + ...+ W_r
  $
  Como $alpha_1+...+alpha_r eq grad(p_f (x) eq dim(V))$, para ver que esta suma es directa y que $dim(W_i) eq alpha_i$, es suficiente ver que $dim(W_i) <= alpha_i, forall i$.

  Dado que $W_i eq ker(cal(O)_i)$ y $f$ y $cal(O)_i$ conmutan, se tiene $f(W_i) subset W_i, forall i$.

  En polinomio carcaterístico de la restricción
  $
    f_i eq.def f|_(W_i) : W_i to W_i
  $
  verifica $p_f_i (x) | p_f (x)$.

  En efecto, extendiendo una base de $W_i$ a una base de $V$, se verifica que la matriz de $f$ con respecto a esta base de $V$ tenen la forma
  $
    #align(center)[
      #pavemat($mat(A, "", "", B; 0, "", "", C;)$, pave: "ddSDDaaAAddS", stroke: (black))
    ]
  $

  siendo $A$ la matriz de $f_i$ respecto a la base de $W_i$. Del @lemma:determinantes se sigue, entonces, que $p_f (x) eq p_A (x) · p_C (x) eq p_f_i (x) · p_C (x)$.

  Ahora, de $p_f_i (x)|p_f (x)$ y de que las raíces de $p_f (x)$ estan en $KK$, se obtiene que las raíces de $p_f_i (x)$ están en $KK$, y por el @theo:triagularizacion de triagularización, hay una base de $W_i$ con respecto a la cual la matriz de $f_i$ es triangular. Sea $A_i$ esa matriz.

  Por la definición de $W_i$, se tiene $(f_i -lambda_i · 1_W_i)^(alpha_i) eq 0$. La matriz de este endomorfismo también es, entonces, nula:
  $
    (A_i - lambda_i I)^(alpha_i) eq 0
  $
  La matriz $A_i -lambda_i I$ es triangular, y es inmediato qye al elevar una matriz triangular a una potencia, los elementos de la diagonal quedan elevalos s esa potencia. Se sigue que la diagonal de $A_i - lambda_i I$ es nula, y por tanto, los elementos de la diagonal de $A_i$ son todos iguales a $lambda_i$.

  Esto implica que $p_f_i (x) eq (lambda_i -x)^(dim(W_i))$ y al ser $p_f_i (x)|p_f (x)$, se obtiene finalmente que $dim(W_i)<= alpha_i$.

]

#remark()[

  Cuando $f in end_KK (V)$ y se tiene una descomposición
  $
    V eq W_i plus.o ... plus.o W_r
  $
  tal que $f(W_i) subset W_i, 1<=i<=r$, el estudio de $f$ se reduce al estudio de las restricciones $f_i eq f|_(W_i):W_i to W_i$.

  Si $A_i$ es la matriz de $f_i$ con respecto a una base de $W_i$, y unimos estas bases para formar una base de $V$, entonces la matriz de $f$ respecto a esta base es:
  $
    A eq mat(A_1, 0, ..., 0; 0, A_2, ..., 0; dots.v, dots.v, dots.down, dots.v; 0, 0, ..., A_r)
  $
  es la matriz formada a partir de las matrices $A_1,...,A_r$ con diagonal sobre la diagonal de $A$, y 0 en todos los deás lugares.
]

== La forma de Jordan


