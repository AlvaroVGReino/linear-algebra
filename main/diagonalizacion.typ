#import "../metadata.typ": *
#import "../enviroments.typ": *

#import "../temp/math.typ": *
#import "../temp/text.typ": *
#import "../temp/constants.typ": *


#chapter-counter.step()
#set footnote(numbering: "*")

#pagebreak()


= Diagonalización

Dada una aplicación lineal $f: V to V'$, se pueden encontrar bases $base$ en $V$ y $base'$ en $V'$ de modo qye la matriz de $f$ respecto estas bases sea simple.

Supongamos, por ejemplo, que
$
  dim(V) eq dim(V') eq u\
  dim(ker(f)) eq r
$

Tomamos una base ${v_1,...,v_r}$ del $ker(f)$ y la completamos a una base ${v_1,...,v_r,v_(r+1),...,v_u}$ de $V$. Es inmediato que ${f(v_(r+1)),...,f(v_u)}$ es linealmente independiente, y puede ser, entonces, completado a una base $base' eq {f(v_(r+1)),...,f(v_u),v'_(u-r+1),...,v'_u}$ de $V'$.

La matriz de $f$ con respecto a $base$ y $base'$ tiene todos los elementos nulos salvo los lugares $(1,r+1),(2,r+2),...,(u-r,u)$ en donde tiene unos.

Sin emabargo, para endomorfismos $(V' eq V)$, generalmente interesa considerar la misma base en el dominio y el codominio de $f$, luego el problema de encontrar esa base será mas complicado.

La cuestión principal considerada en el presente tema será: dado un endomorfismo $f:V to V$, ver en qué condiciones existe una base de $V$ tal que la matriz de $f$ con respecto a esa base sea una matriz diagonal.

Dado que este problema no siempre tiene solución, en el tema siguiente se buscará una base tal que la matriz de $f$ con respecto a esa base sea "lo más cercana posible" a una matriz diagonal.

En todo el tema, $V$ será un $K$-espacio vectorial de dimensión finita ($n<infinity$).

== Eigenvalores y eigenvectores

Sea $f: V to V$ un endomorfismo.

#definition(title: [Eigenvalor])[
  Se dice que $lambda in K$ es un eigenvalor, autovalor o valor propio de $f$ si
  $
    exists x in V, x eq.not 0 "tal que" f(x) eq lambda x
  $
]

#definition(title: [Eigenvector])[
  Se dice que $x in V$ es un eigenvector, autovector o vector propio de $f$ si
  $
    exists lambda in K "tal que" f(x) eq lambda x
  $
]

#note()[

  A cada vector propio distinto de 0 le corresponde un único valor propio, pero para cada $lambda in K$ puede haber muchos más vectores propios que le tengan como eigenvalor. Por ejemplo si $ker(f) eq.not 0$, cada elemento del núcleo es un vector propio asociado al eigenvalor 0. Y en general, cada múltiplo no nulo de un vector propio asociado a $lambda$ es un vector propio asociado a $lambda$
]

#definition(title: [Subespacio asociado a un eigenvalor])[

  Sea $f: V to V$ un endomorfismo y sea $lambda in K$, se define
  $
    V_lambda eq.def {x in V : f(x) eq lambda x} eq ker(f - lambda 1_V)
  $
  el cual es un subespacio de V.
]

Si $lambda$ es un eigenvalor de $f$, es decir, si $V_lambda eq.not 0$, este subespacio se llama el subespacio propio asociado al eigenvalor $lambda$. Está formad por todos los vectores propios de $f$ que tienen a $lambda$ como eigenvalor.

#theorem()[

  Si $A in M_(n times n)(K)$ es la matriz de $f$ con respecto a una base de $V$, entonces:
  + $ dim(V_lambda) eq n - ran(A-lambda dot I_n) $

  + $ lambda "eigenvalor de "f <==> det(A- lambda dot I_n) eq 0 $
]

#dem[

  + Sea
    $
      n eq dim(V) eq dim(ker(f-lambda dot 1_V)) + dim(im(f-lambda dot 1_V)) eq \
      eq dim(V_lambda) + ran(A-lambda dot 1_V)
    $
  + Sea
    $
      lambda "eigenvalor" <==> V_lambda eq.not 0 <==> dim(V_lambda) eq.not 0 <==> \
      <==> ran(A-lambda I_n) < n <==> dim(im(f-lambda dot 1_V)) < n <==> \
      <==>im(f-lambda dot 1_V) eq.not V <==> f-lambda dot 1_V "no sobreyec." <==>\
      <==> f-lambda dot 1_V "no isom." <==> A-lambda I_n "no invertible" <==> \
      <==> det(A-lambda I_n) eq 0
    $
]

#example()[

  Sea $KK eq RR$ y consideremos el endomorfismo $f:RR^3 to RR^3$ tal que
  $
    f(x,y,z) eq (y+z,x+z,x+y)
  $
  La matriz de $f$ con respecto a la base canónica es
  $
    A eq mat(0, 1, 1; 1, 0, 1; 1, 1, 0) in M_(3 times 3)(RR)
  $
  Luego tenemos que $lambda in RR$ es eigenvalor de A $<==> det(A-lambda I_3) eq 0$
  $
    det(A-lambda I_3) eq mat(delim: "|", -lambda, 1, 1; 1, -lambda, 1; 1, 1, -lambda) stretch(=)^(F_1-F_3)_(F_2-F_3) mat(delim: "|", -lambda -1, 0, 1+lambda; 0, -lambda-1, 1+lambda; 1, 1, -lambda) eq \
    eq -lambda (lambda+1)^2 - [- (lambda+1)^2 - (lambda + 1)^2] eq (-lambda + 2)(lambda + 1)^2
  $
  Por lo que los eigenvalores son las raíces de este determinante, es decir -1 y 2.

  Calculemos ahora $V_2 eq ker(f-2 dot 1_(RR^3))$, para lo que es necesario resolver el sistema
  $
    mat(-2, 1, 1; 1, -2, 1; 1, 1, -2) mat(x; y; z) eq 0
  $
  Y desarrollandolo por el método de Gauss:
  $
    mat(-2, 1, 1; 1, -2, 1; 1, 1, -2) stretch(->)_(F_1 <->F_3) mat(1, 1, -2; 1, -2, 1; -2, 1, 1) stretch(->)_(F_2 - F_1)^(F_3 + 2F_1)mat(1, 1, -2; 0, -3, 3; 0, 3, -3) stretch(->)_(F_3 + F_2) \
    to mat(1, 1, -2; 0, -3, 3; 0, 0, 0) stretch(->)_(1/3 F_2) mat(1, 1, -2; 0, -1, 1; 0, 0, 0)
  $
  entonces
  $
    (x,y,z) in V_2 <==> cases(x+y-2z = 0, -y+z = 0) <==>(x,y,z) in gen((1,1,1))
  $

  Calculemos ahora $V_(-1)$:
  $
    mat(1, 1, 1; 1, 1, 1; 1, 1, 1)mat(x; y; z) eq 0 <==> x+y+z eq 0 then \
    then V_(-1) eq gen((1,-1,0)","(0,1,-1))
  $

  Así quedan los siguientes subespacios asociados a los eigenvalores: $V_2 eq gen((1,1,1))$ y $V_(-1) eq gen((1,-1,0)","(0,1,-1))$.
]

#proposition()[

  Sea $f:V to V$ un endomorfismo. Si $lambda_1,...,lambda_s$ son eigenvalores de $f$ distintos dos a dos, entonces la suma
  $
    V_(lambda_1) + ... + V_(lambda_s)
  $
  es directa.

  Por tanto, si $base_i$ es base de $V_(lambda_i), 1<=i<=s$, entonces  $base_1 union ... union base_s$ es base de $V_(lambda_1) + ... + V_(lambda_s)$
]

#dem[

  En general, sabemos que la base del espacio suma directa de varios subespacios vectoriales es equivalente a la union de las bases de los subespacios. Por lo tanto la segunda afirmación es clara.

  Procedamos ahora por inducción en s.
  Para $s eq 1$ no hay nada que demostrar.

  Sea $s>1$, y supongamos que la suma
  $
    V_(lambda_1) + ... + V_(lambda_s-1)
  $
  es directa.

  Sean $x_i in V_(lambda_i), 1<=i<=s$, tales que $x_1+...+x_s eq 0$, y veamos que $x_i eq 0, 1<=i<=s$.

  Aplicando $f-lambda_s dot 1_V$ a la igualdad $x_1+...+x_s eq 0$ resulta:
  $
    0 eq f(x_1+...+x_s)-lambda_s(x_1+...+x_s) eq \
    eq f(x_1)-lambda_s x_1 + ... + f(x_s)-lambda_s x_s eq \
    eq lambda_1 x_1 - lambda_s x_1 + ... + lambda_s x_s - lambda_s x_s eq\
    eq (lambda_1 - lambda_s) x_1 + ... + (lambda_(s-1)-lambda_s) x_(s-1)
  $
  y por la hipotesis de inducción $(lambda_i - lambda_s)x_i eq 0, 1<=i<=s-1$. Como $lambda_i eq.not lambda_s, 1<=i<=s-1$, se sigue que $x_i eq 0, 1<=i<=s-1$. Por tanto también $x_s eq 0$.
]

== Polinomio característico

#definition(title: [Polinomio característico de A])[

  Si $A in M_(n times n) (KK)$, entonces
  $
    p_A (x) eq.def det(A-x I_n) eq mat(delim: "|", a_11-x, a_12, dots, a_(1 n); a_21, a_22-x, dots, a_(2 n); dots.v, dots.v, dots.down, dots.v; a_(n 1), a_(2 n), dots, a_(n n)-x)
  $
  es un polinomio de grando n con coeficientes en $KK$, llamado el polinomio carcaterístico de A.
]

#remark(title: [Propiedades del anillo conmutativo $KK[X]$])[

  Si $p_A (x)$ es el determinante de una matriz perteneciente a $M_(n times n) (KK[X])$. Ocurre que la definición y prácticamente todas la propiedades de los determinantes de matrices sobre un cuerpo se generalizan a una matriz sobre un anillo conmutativo, y en particular, $KK[X]$.

  Se verifica:

  + El coeficiente principal de $p_A(x)$ es $(-1)^n$.

  + El coeficiente de $x^(n-1)$ en $p_A(x)$ es $(-1)^(n-1) tr(A)$, siendo $tr(A)$ la traza de A: $a_(11)+a_22+...+a_(n n)$.

  + El término independiente de $p_A(x)$ es $det(A)$.
]

#dem[
  El determinante de una matriz $(alpha_( i j))$ de tamaño $n times n$ es
  $
    sum_(sigma in S_n) "sig"(sigma) alpha_(1 sigma(1))· ... · alpha_(n sigma(n)) eq \
    eq alpha_(1 1) · ... · alpha_(n n) sum_(sigma eq.not 1) "sig"(sigma) alpha_(1 sigma(1)) · ... · alpha_(n sigma(n))
  $
  Por lo tanto
  $
    p_A (x) eq (a_(1 1)-x)·...·(a_(n n)-x) + s
  $
  donde $s$ es una suma de productos en cada uno de los cuales hay a lo sumo $n-2$ elementos de la diagonal de $A-x I_n$.

  Los monomios de grado n y n-1 en $p_A (x)$ son, entonces, $(-1)^n x^n$ y $(-1)^(n-1) (a_(1 1)+a_(22)+...+a_(n n)) x^(n-1)$. Por lo que quedan probados 1. y 2..

  En cuanto a 3., el término independiente de $p_A (x)$ es
  $
    p_A (0) eq det(A-0 I_n) eq det(A)
  $
]

#definition(title: [Polinomio característico de un endomorfismo])[

  Se define el polinomio característico de un endomorfismo $f:V to V$ como el polinomio característico de la matriz asociada a $f$ respecto a una base de $V$.
]

#proposition(title: [Idependencia de la base])[

  El polinomio característico de un endomorfismo es independiente de la elección de la base
]

#dem[
  Sean $A$ y $B$ matrices asociadas a un endomorfismo $f$ con respecto a dos bases distintas, entonces $A$ y $B$ son semejantes:
  $
    B eq P^(-1) A P
  $
  por lo tanto:
  $
    p_B (x) eq det(B-x I_n) eq det(P^(-1) A P - x I_n) eq \
    eq det(P^(-1) A P - P^(-1) x I_n P) eq det(P^(-1) (A-x I_n) P) eq \
    eq det(P^(-1)) det(A-x I_n) det(P) eq det(A-x I_n) eq p_A (x)
  $
]

#remark[
  Ya se vio que $lambda in KK$ es eigenvalor de $f$ si y solo si $det(A-lambda I_n) eq 0$. Luego para alguna matriz asociada a $f$ podemos decir lo siguiente.
]

#proposition()[

  Sea $lambda in KK$, enotnces:
  $
    lambda "es eigenvalor de" f <==> lambda "es raíz de" p_f (x)
  $
]

#remark[

  Si bien los eigenvalores de $f$ son, enotnces, las raíces de $p_f (x)$ que  estan en $KK$, puede haber raíces de $p_f (x) in KK[x]$ que no esten en $KK$, y por tanto, no serán eigenvalores.
]

#definition(title: [Multiplicidad algebraica])[

  Sea $lambda in KK$ un eigenvalor del endomorfismo $f:V to V$. LLamaremos multiplicidad algebraica del eigenvalor $lambda$, $m_a (lambda)$, a su multiplicidad como raíz de $p_f (x)$.
]

#definition(title: [Multiplicidad geométrica])[

  Se llama multiplicidad geométrica de $lambda$, $m_g (lambda)$, a la dimensión del subespacio propio asociado a $lambda$. Equivalentemente:
  $
    m_g (lambda) eq.def dim(V_lambda)
  $
  Según ya hemos visto:
  $
    m_g (lambda) eq n-ran(A- lambda I_n)
  $
  siendo $A$ la matriz asociada de $f$ respecto a alguna base  de $V$.
]

#example()[

  Sea $f: RR^3 to RR^3$ el endomorfismo cuya matriz asociada respecto a la base canónica es
  $
    A eq mat(1, 2, 3; 0, 1, 4; 0, 0, 1)
  $
  tal que su polinomio característico es $p_f (x) eq (1-x)^3$. Luego $f$ tiene un solo eigenvalor: 1, con $m_a (1) eq 3$.

  Ahora, para calcular $m_g (1)$, calcularemos $V_1 eq ker(A-I_3)$
  $
    mat(0, 2, 3; 0, 0, 4; 0, 0, 0) · mat(x; y; z) eq 0 <==> cases(2y+3z eq 0, 4z eq 0) <==> cases(y eq 0, z eq 0)
  $
  Por tanto, $V_1 eq gen((1,0,0))$, y así, $m_g (1) eq 1$.
]

#lemma(label: <lemma:determinantes>)[

  Sea $A in M_(n times n) (KK)$ una matriz de la forma
  $
    #align(center)[
      #pavemat($mat(X, "", "", Y; 0, "", "", Z;)$, pave: "ddSDDaaAAddS", stroke: (black))
    ]
  $
  con $X in M_(r times r) (KK)$, $Y in M_(r times (n-r)) (KK)$ y $Z in M_((n-r) times (n-r)) (KK)$. Entonces:
  $
    det(A) eq det(X) · det(Z)
  $
]

#dem[
  Recordemos que
  $
    det(A) eq sum_(sigma in S_n) sig(sigma) a_(1 sigma(1)) · ... · a_(n sigma(n))
  $
  Vistos los elementos nulos que hay en la matriz $A$, resulta que si para $i in {r+1,...,n}$, ocurre $sigma(i) in {1,...,r}$, entonces $a_(i sigma(i)) eq 0$.

  #align(center)[
    $mat(delim: #none, , 1, ..., r, r+1, ..., n; sigma, arrow.b; , 1, ..., r, r+1, ..., n)$
  ]
  Luego los $sigma$ para los que es posible un sumando no nulo en $det(A)$ son los de la forma $sigma eq tau_1 tau_2$ con $tau_1 in S_n$, $tau_2 in S_(n-r)$, donde $S_r$ se identifica con las permutaciones de ${1,...,r}$ y $S_(n-r)$ con las de ${r+1,...,n}$.

  Por tanto
  $
    det(A) eq\
    eq sum_((tau_1,tau_2) in S_r times S_(n-r)) sig(sigma) a_(1 tau_1 (1)) · ... · a_(r tau_1 (r))·a_(r+1 tau_2 (r+1))·...·a_(n tau_2 (n)) eq \
    eq (sum_(tau_1 in S_r) sig(tau_1)a_(1 tau_1 (1))·...·a_(r tau_1 (r)))·\
    (sum_(tau_2 in S_(n-r)) sig(tau_2)a_(r+1 tau_2 (r+1)) ·...·a_(n tau_2 (n))) eq \
    eq det(X)·det(Z)
  $
]

#proposition()[
  Para un eigenvalor $lambda$ se verifica:
  $
    1<=m_g (lambda)<= m_a (lambda)
  $
]

#dem[

  Si $lambda$ es un eigenvalor, $V_lambda$ no puede ser 0, y por lo tanto
  $
    1<= dim(V_lambda) = m_g (lambda)
  $
  Para ver la otra desigualdad, sea ${v_1,...,v_s}$ una base de $V_lambda$ y completemosla a una base $base eq {v_1,...v_s,v_(s+1),...,v_n}$ de $V$. Entonces, la matriz $A$ de $f$ con respecto a esta base es de la forma:
  $
    #align(center)[
      #pavemat($mat(lambda I_n, "", "", A'; 0, "", "", A'';)$, pave: "ddSDDaaAAddS", stroke: (black))
    ]
  $
  Por tanto, aplicando el @lemma:determinantes:
  $
    p_f (x) eq det(A-x I_n) stretch(=)^"Lema" (lambda-x)^s det(A'' -x I_(n-s))
  $
  Así:
  $
    s<=m_a (lambda), quad m_g (lambda) <= m_a (lambda)
  $
]

#corollary()[

  Si para un eigenvalor $lambda$ se tiene $m_a (lambda) eq 1$, entonces $m_g (lambda) eq 1$.
]

== Dialgonalización

#definition(title: [Endomorfismo diagonalizable])[

  Un endomorfismo en un $f:V to V$ se dice que es diagonalizable si existe una base de $V$ con respecto a la cual la matriz de $f$ es diagonal.
]

#proposition()[

  Si $base eq {v_1,...,v_n}$ es una base de $V$, que la matriz de $f$ respecto a $base$ sea diagonal:
  $
    mat(lambda_1, ..., 0; dots.v, dots.down, dots.v; 0, ..., lambda_n)
  $
  equivale a $f(v_i) eq lambda_i V_i, 1<=i<=n$, es decir, a que $base$ sea una base formada por vectores propios.
]

#proposition(title: [Caracterizacion de los endomorfismos diagonalizables ])[
  Para un endomorfismo $f:V to V$ equivalen:

  + $f$ es idagonalizable,

  + $V$ siene una base formada por vectores propios de $f$,

  + Existen n vectores propios de $f$ linealmente independientes.
]

#remark[

  Si $f$ es diagonalizable, entonces el polimonio característico de $f$es de la forma:
  $
    p_f (x) eq (lambda_1 - x)^(alpha_1) ·...·(lambda_r - x)^(alpha_r)
  $
  con $lambda_i in KK, lambda_1 eq.not lambda_j, i eq.not j$. Las $lambda_i$ son, enotnces, los eigenvalores de $f_i$,
  $
    alpha_i eq m_a (lambda_i) eq "nº de veces que aparece" lambda_i "en la diagonal"
  $
  y $alpha_1 + ... + alpha_r eq n$
]

#definition()[

  Una matriz $A in M_(n times n) (KK)$ se dice diagonalizable si es semejante a una matriz diagonal:
  $
    P^(-1) A P "diagonal para alguna" P in M_(n times n) (KK) "inversible"
  $
]

#proposition()[
  Un endomorfismo es diagonalizable si y solo si su matriz respecto a una base (y, por tanto, con respecto acualquier base) es diagonalizable. Equivalentemente:
  $
    f "es diagonalizable" <==> A "es diagonalizable"
  $
  siendo $A$ la matriz asociada a $f$ con respecto a cualqier base.
]

#theorem()[

  Un endomorfismo $f:V to V$ es diagonalizable si, y solo si, todas las raíces de $p_f (x)$ estan en $KK$ y $m_a (lambda) eq m_g (lambda)$ para todo eigenvalor $lambda$ de $f$.
]

#dem[

  "$==>$"

  Existe una base $base$ de $V$ con respecto a la cual la matriz $A$ de $f$ es diagonal. Sea $r$ el número de elementos distintos de la diagonal de esa matriz, denotemoslos $lambda_1,...,lambda_r$ y sea $alpha_i$ eq número de veces que se repìte $lambda_i, 1<=i<=r$. Entonces $alpha_1+...+alpha_r eq n$ y
  $
    p_f (x) eq (lambda_1 - x)^(alpha_1) ·...·(lambda_r - x)^(alpha_r) eq \
    eq (-1)^n (x-lambda_1)^(alpha_1)·...·(x-lambda_r)^(alpha_r)
  $

  Se sigue que las raíces de $p_f (x)$ son los $lambda_1,...,lambda_r$, cada una con la multiplicidad $alpha_i$.

  Por tanto, todas las raíces estan en $KK$. Se sigue también que los eigenvalores de $f$ son $lambda_1,...,lambda_r$ y $m_a (lambda_i) eq alpha_i, 1<=i<=r$.

  Como la desigualdad $m_g (lambda_i) <= m_a (lambda_i), forall i$ se verifica siempre. Veamos la desigualdad opuesta:
  $
    m_g (lambda_i) eq dim_(V_(lambda_i)) eq n-ran(A-lambda_i I_n)
  $
  y es obvio que $ran(A-lambda_i I_n) <= n-alpha_i$. Por tanto, $m_g (lambda_i)>= n-(n-alpha_i) eq alpha_i eq m_a (lambda_i)$.

  "$<==$"

  Sean $lambda_1,...,lambda_r$ las raíces distintas de $p_f (x)$ y sea $alpha_i$ la multiplicidad de $lambda_i, 1<=i<=r$, de modo que $alpha_1+...+alpha_r eq grad(p_f (x)) eq n$.

  Por hipòtesis, $lambda_1,...,lambda_r in KK$. Entonces $lambda_1,...,lambda_r$ son eigenvalores de $f$.

  Sabemos que la suma
  $
    V_lambda_1 +...+V_lambda_r
  $
  es directa, entonces:
  $
    dim(V_lambda_1 + ... + V_lambda_r) eq dim(V_lambda_1) + ... + dim(V_lambda_r) eq \
    eq m_g (lambda_1) + ... + m_g (lambda_r)
  $
  que poir hipótesis, es igual a la multiplicidad algebrica:
  $
    eq m_a (lambda_1) +...+m_a (lambda_r) eq alpha_1 + ... + alpha_r eq \
    eq n eq dim(V)
  $
  Luego $V_lambda_1 +...+V_lambda_r eq V$. Sabemos también que uniendo las bases de los $V_lambda_i$ se obtiene una base de $V$, la cual estará formada por vectores propios de $f$. Por tanto, $f$ es diagonalizable.

]

#corollary()[

  Sea $f:V to V$ un endomorfismo. Si todas las raíces de $p_f (x)$ están en $KK$ y son simples, entonces $f$ es diagonalizable.
]


#dem[

  Es consecuencia inmediata del teorema anterior y de las desigualdades $1<=m_g (lambda) <= m_a (lambda)$ para cualquier lambda eigenvalor.
]

#note[

  La condición de que $p_f (x)$ tenga todas sus raíces en $KK$, se expresa a veces diciendo que $p_f (x)$ se descompone en factores lineales en $KK[x]$. Es obvio que ambas condiciones son equivalentes.
]
