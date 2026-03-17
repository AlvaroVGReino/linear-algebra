#import "/metadata.typ": *
#import "@preview/clean-cnam-template:1.6.2": *
#import "/enviroments.typ": *
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

#definition(title: "Conjunto de matrices")[

  El conjunto de todas las matrices $m times n$ se denota $M_(m times n) (K)$ (también $M_m (K)$ si es cuadrada) y es un K-espacio vectorial que verifica:
  $
    (a_(i j))_cases(delim: #none, 1 <= i <= m, 1 <= j <= n) + (b_(i j))_(i j) eq (a_(i j) + b_(i j))_(i j)
  $
  Y para todo $lambda in K$:
  $
    lambda (a_(i j))_(i j) eq (lambda a_(i j))_(i j)
  $
]

#definition(title: "Matriz identidad")[

  Sea $I_m in M_m (K)$ una matriz cuadrada llamada identidad:
  $
    I_m eq(delta_(i j))_(i j) : delta_(i j) eq.def cases(1"," quad i eq j, 0"," quad i eq.not j)
  $
  $
    I_m eq mat(
      1, 0, dots, 0, 0;
      0, 1, dots, 0, 0;
      dots.v, dots.v, dots.down, dots.v, dots.v;
      0, 0, dots, 1, 0;
      0, 0, dots, 0, 1
    )
  $
]

#definition(title: "Matriz elemental")[

  Sea $E_(i j) in M_(m times n) (K)$ una matriz llamada elemental:
  $
    E_(i j) eq(e_(i j))_(i j) : e_(i j) eq.def cases(1"," quad "en la posición" i j, 0"," quad "en todas las demás")
  $
  $
    E_(i j) eq mat(
      0, 0, dots, e_(1 j), dots, 0;
      0, 0, dots, 0, dots, 0;
      dots.v, dots.v, dots.down, dots.v, dots.down, dots.v;
      e_(i, 1), 0, dots, 1, dots, 0;
      dots.v, dots.v, dots.down, dots.v, dots.down, dots.v;
      0, 0, dots, 0, dots, 0
    )
  $
]<def:matrix-elem>

#proposition()[

  Para toda matriz, se tiene
  $
    dim(M_(m times n)(K)) eq m dot n
  $
]

#dem[

  Consideremos  el conjunto
  $
    {E_(i j) : E_(i j) in M_(m times n) (K), quad cases(delim: #none, 1 <= i <= m, 1 <= j <= n)}
  $
  que contiene las matrices elementales de cada posición.


  Sea $A eq (a_(i j)) in M_(m times n) (K)$, entonces podemos escribir
  $
    A eq sum_(i eq 1)^m sum_(j eq 1)^n a_(i j) E_(i j)
  $
  Es decir, cualquier matriz es una combinación lineal de las matrices elementales y
  $
    gen({E_(i j)}_(cases(delim: #none, 1 <= i <= m, 1 <= j <= n))) eq M_(m times n) (K)
  $

  Luego
  $
    sum_(i eq 1)^m sum_(j eq 1)^n lambda_(i j) E_(i j) eq 0 then (lambda_(i j)) eq 0 then lambda_(i j) eq 0, quad forall i,j
  $
  Por lo que es linealmente independiente.

  Como el conjunto ${E_(i j)}_(cases(delim: #none, 1 <= i <= m, 1 <= j <= n))$ tiene $m · n$ elementos y es base,
  $
    dim(M_(m times n) (K)) eq m · n
  $
]

#definition()[

  Sea $f: V to V'$ una aplicación K-lineal tal que
  $
    base eq {v_1,...,v_n} "base de" V \
    base' eq {v'_1,...,v'_m} "base de" V'
  $
  LLamamos matriz asociada a $f$ respecto de $base$ y $base'$
  $
    (f)_(base base') eq (a_(i j)) in M_(m times n) (K)
  $
  tal que
  $
    f(v_j) eq sum_(i eq 1)^m a_(i j) v'_i, quad (1<=j<=n)
  $
]

#ideabox()[

  Sea $f:V to V'$ una aplicación lineal tal que
  $
    base eq {u_1,...,u_n} "base de" V \
    base' eq {u'_1,...,u'_m} "base de" V'
  $

  Entonces cada imagen de un vector de la base del dominio se puede escribir como combinación lineal de la base del codominio:
  $
    f(u_1) eq a_1 u'_1 + a_2 u'_2 + ... + a_n u'_n \
    f(u_2) eq b_1 u'_1 + b_2 u'_2 + ... + b_n u'_n \
    dots.v \
    f(u_m) eq m_1 u'_1 + m_2 u'_2 + ... + m_n u'_n \
  $
  y la matriz sería
  $
    (f)_(base base') eq mat(
      a_1, b_1, dots, m_1; a_2, b_2, dots, m_2; dots.v, dots.v, dots.down, dots.v;
      a_n, b_n, dots, m_n
    )
  $
]

#remark[
  Sea $v in V$.

  Queremos saber $f(v)$ a partir de la matriz asociada a $f$.
  $
    v eq sumjn lambda_j u_j then f(v) eq f(sumjn lambda_j u_j) eq sumjn lambda_j f(u_j) eq \
    eq sumjn lambda_j (sumim a_(i j) u'_i) eq sumim(sumjn lambda_j a_(i j)) u'_i eq \
    eq (sumjn lambda_j a_(1 j))v'_1 + ... + (sumjn lambda_j a_(m j)) u'_m
  $
  Donde cada término $sumjn lambda_j a_(i j) eq (x_1 a_(i 1) + ... + x_n a_(1 n))$, por lo que
  $
    mat(a_(1 1), dots, a_(1 n); dots.v, dots.down, dots.v; a_(m 1), dots, a_(m n)) mat(x_1; dots.v; x_n) eq mat(x_1 a_(i 1) + ... + x_n a_(1 n); dots.v; x_1 a_(m 1) + ... + x_n a_(m n))
  $
  Concluyendo
  $
    (f(v))_(base') eq (f)_(base base') (u)_(base)
  $
]

#example[

  Definimos la aplicación $f: RR^3 to RR^3$ tal que $f(x,y,z) eq (x+y,y,z)$.

  Queremos encontrar la matriz asociada a $f$ respecto a la base canónica. Considerando
  $
    e_1 eq (1,0,0), quad e_2 eq (0,1,0), quad e_3 eq (0,0,1)
  $
  La idea consiste en obtener la matriz que se obtiene al calcular $f$ sobre los vectores de la base.

  La imagen de cada vector:
  $
    f(e_1) eq (1,0,0) \
    f(e_2) eq (1,1,0) \
    f(e_3) eq (0,0,1)
  $
  Las columnas de la matriz son las coordenadas de estas imagenes:
  $
    (f)_(cal(C) cal(C)) eq mat(#text(fill: academic-colors.primary)[1], #text(fill: academic-colors.primary)[1], #text(fill: academic-colors.primary)[0] ; #text(fill: academic-colors.success)[0], #text(fill: academic-colors.success)[1], #text(fill: academic-colors.success)[0] ; #text(fill: academic-colors.error)[0], #text(fill: academic-colors.error)[0], #text(fill: academic-colors.error)[1])
  $

  Luego para verficar, se debería cumplir $f(v) eq (f)_(cal(C) cal(C)) · v$, así
  $
    mat(#text(fill: academic-colors.primary)[1], #text(fill: academic-colors.success)[1], #text(fill: academic-colors.error)[0] ; #text(fill: academic-colors.primary)[0], #text(fill: academic-colors.success)[1], #text(fill: academic-colors.error)[0] ; #text(fill: academic-colors.primary)[0], #text(fill: academic-colors.success)[0], #text(fill: academic-colors.error)[1]) mat(x; y; z) eq mat(x +y+0; 0+y+0; 0+0+z) eq mat(x+y; y; z)
  $
]

#example[

  Consideremos la aplicación identidad
  $
    id: RR^3 to RR^3
  $
  con bases
  $
    base eq {e_1,e_2 + e_3, e_3} \
    cal(C) eq {e_1,e_2,e_3}
  $

  En este caso, las columnas de la matriz serán las coordenadas en $cal(C)$ de las imagenes de los vectores de $base$.

  Aplicando $id_(RR^3)$ a $base$ se obtiene:
  $
    id(e_1) eq e_1 eq (1,0,0) \
    id(e_2+e_3) eq e_2 + e_3 eq (0,1,1) \
    id(e_3) eq e_4 eq (0,0,1)
  $

  luego
  $
    (id_(RR^3))_(base cal(C)) eq mat(1, 0, 0; 0, 1, 0; 0, 1, 1)
  $

  La inversa de esta aplicación sería
  $
    id(e_1) eq (1,0,0) \
    id(e_2) eq (0,1,0) \
    id(e_3) eq (0,0,1)
  $
  y expresando la imagen de $cal(C)$ con la base $base$
  $
    e_1 eq 1 e_1 + 0(e_2 + e_3) + 0 e_3 \
    e_2 eq 0 e_1 + 1(e_2 + e_3) + (-1) e_3 \
    e_3 eq 0 e_1 + 0 (e_2 + e_3) + 1 e_3
  $
  luego
  $
    (id_(RR^3))_(cal(C) base) eq mat(1, 0, 0; 0, 1, 0; 0, -1, 1)
  $
]

#example[
  Sea
  $
    f: RR^3 to RR^2 \
    (x,y,z) ~~> (x+y,z)
  $
  tal que
  $
    base_3 eq {(1,0,0),(0,1,0),(0,1,1)} \
    base_2 eq {(1,1),(0,1)}
  $
  luego
  $
    f(base_3) eq {(1,0),(1,0),(1,1)}
  $
  que escrito en función de $base_2$
  $
    (1,0) eq 1 (1,1) + (-1) (0,1) \
    (1,1) eq 1(1,1)+0(0,1)
  $
  por lo tanto
  $
    (f)_(base_3 base_2) eq mat(1, 1, 1; -1, -1, 0)
  $
]

#definition()[

  Sean $V$, $V'$ K-espacios vectoriales.

  El conjunto de las aplicaciones lineales entre $V$ y $V'$ se denota:
  $
    lik (V,V') eq {f: V to V': f "es aplicación lineal"}
  $
]

#definition(title: "Endomorfismo")[

  Sea $V$ un K-espacio vectorial.

  Un endomorfismo de $V$ es una aplicación lineal
  $
    f: V to V
  $
  El conjunto de todos los endomorfismos de $V$ se denota
  $
    end_K (V) eq lik(V, V)
  $
]

#remark[

  Sean $V$, $V'$ K-espacios vectoriales.

  Para $f,g in lik(V, V')$ definimos
  $
    (f + g)(v) eq f(v) + g(v), quad forall v in V
  $
  y la aplicación nula
  $
    0(v) eq 0, quad forall v in V
  $
  Para $f in lik(V, V')$ definimos
  $
    (-f)(v) eq -f(v)
  $
  Con estas operaciones se tiene que $(lik(V, V'),+)$ es un grupo abeliano.

  También para $lambda in K$ y $f in lik(V, V')$ definimos
  $
    (lambda f)(v) eq lambda f(v)
  $
  Con esta operación externa, $lik(V, V')$ es un K-espacio vectorial.

  Finalmente, si ahora consideramos
  $
    end_K (V) eq lik(V, V)
  $
  entonces para $f,g in end_K (V)$ se cumple que
  $
    g compose f in end_K (V)
  $
  Además la composición satisface la propiedad distributiva
  $
    (f+g) compose h eq f compose h + g compose h \
    f compose (g+h) eq f compose g + f compose h
  $
  Por lo que $(end_K (V),+,compose)$ es un anillo no conmutativo.
]

#proposition()[

  Seam $V$, $V'$ K-espacios vectoriales tales que
  $
    base "es base de" V, quad base' "es base de" V'
  $
  y
  $
    dim(V) eq n, quad dim(V') eq m
  $
  Luego la aplicación
  $
    phi_(base base'): lik(V, V') to M_(m times n) (K) \
    f ~~> (f)_(base base')
  $
  es un isomorfismo.
]

#dem[
  Sea $phi_(base base')$ un aplicación, luego para todo $f,g in lik(V, V')$,

  ¿Es $phi_(base base')$ lineal?

  Por definición
  $
    phi_(base base')(f+g) eq.def (f+g)_(base base') eq (f)_(base base') + (g)_(base base') eq\
    eq phi_(base base') (f) + phi_(base base') (g)
  $
  Análogamente se verifica para el producto por escalares
  $
    phi_(base base') (lambda f) eq lambda phi_(base base') (f), quad (forall lambda in K)
  $
  Luego $phi_(base base')$ es lineal.

  ¿Es $phi_(base base')$ inyectiva?

  Supongamos
  $
    phi_(base base') (f) eq 0 then (f)_(base base') eq 0
  $
  lo que significa que todas las columnas de la matriz son nulas. Por tanto
  $
    f(v_j) eq 0, quad (1<=j<=n)
  $
  Sea ahora $v in V$. Como $base$ es bas,
  $
    v eq sumjn x_j v_j
  $
  entonces
  $
    f(v) eq f(sumjn x_j v_j) eq sumjn x_j f(v_j) eq sumjn x_j 0 eq 0
  $
  Por lo que $f eq 0$ y
  $
    ker(phi_(base base')) eq {0}
  $
  Luego $phi_(base base')$ es inyectiva.

  ¿Es $phi_(base base')$ sobreyectiva?

  Sea $A eq (a_(i j)) in M_(m times n) (K)$. Definimos $f: V to V'$ como la única aplicación lineal tal que
  $
    f(v_j) eq sumim a_(i j) v'_i, quad (1<=j<=n)
  $
  Por construcción, las coordenadas de $f(v_j)$ en la base $base'$ son precisamente
  $
    (a_(1,j),...,a_(m j))
  $
  que forman la columna $j$ de $A$. En general
  $
    (f)_(base base') eq A eq phi_(base base') (f)
  $
  Así que $phi_(base base')$ es sobreyectiva.

  En conclusión, $phi_(base base')$ es un isomorfismo.
]

#proposition()[

  Sean $V,V',V''$ K-espacios vectoriales tales que
  $
    base eq {u_1,...,u_n} "es base de" V \
    base' eq {u'_1,...,u'_m} "es base de" V' \
    base'' eq {u''_1,...,u''_p} "es base de" V'' \
  $
  Definamos las aplicaciones K-lineales
  $
    f:V to V' \
    g:V' to V''
  $
  Luego la composición de aplicaciónes lineales ($g compose f$) induce por isomorfismo un producto en el espacio de matrices.

  Es decir:
  $
    (g compose f)_(base base'') eq (g)_(base base') (f)_(base' base'')
  $
]

#dem[
  Sean
  $
    A eq (f)_(base base') eq (a_(i j)) in M_(m times n) (K), \
    B eq (g)_(base' base'') eq (b_(k i)) in M_(p times m) (K)
  $
  Por definición de la matriz asociada:
  $
    f(u_j) eq sumim a_(i j) u'_j
  $
  Aplicando $g$:
  $
    g(f(u_j)) eq g(sumim a_(i j) u'_i) eq sumim a_(i j) g(u'_i) eq
  $
  Como
  $
    g(u'_i) eq sum_(k eq 1)^p b_(k i) u''_k
  $
  Se tiene
  $
    g(f(u_j)) eq sumim a_(i j) (sum_(k eq 1)^p b_(k i) u''_k) eq sum_(k eq 1)^p (sumim b_(k i) a_(i j))u''_k
  $
  Donde los coeficientes
  $
    sumim b_(k i) a_(i j)
  $
  son precisamente las entradas del producto de matrices $B A$. Por lo tanto
  $
    (g compose f)_(base base'') eq B A
  $
]

#ideabox()[

  Esto podemos interpretarlo paso a paso, como ya hemos visto que
  $
    f(v) eq (f)_(basec basec) (v)_(basec) eq A (v)_(basec)
  $
  De la misma manera
  $
    g(f(v)) eq (g)_(basec basec) (f(v))_(basec) eq B (f(v))_(basec)
  $
  Sustituyendo
  $
    g(f(v)) eq B(A (v)_(basec)) eq (B A) (v)_(basec)
  $
]

#example[

  Veamos como esto se produce tomando
  $
    V eq RR^3, quad V' eq RR^3, quad V'' eq RR^3
  $
  con la base canónica y definimos $f$ tal que
  $
    f(x,y,z) eq (x+y, y,z)
  $
  Luego su matriz ya calculada es
  $
    A eq mat(1, 1, 0; 0, 1, 0; 0, 0, 1)
  $
  Y $g$ tal que
  $
    g(x,y,z) eq (2x,y,2z)
  $
  Luego su matriz
  $
    (2,0,0) eq 2 e_1 + 0 e_2 + 0 e_3 \
    (0,1,0) eq 0 e_1 + 1 e_2 + 0 e_3 \
    (0,0,2) eq 0 e_1 + 0 e_2 + 2 e_3 \
    B eq mat(2, 0, 0; 0, 1, 0; 0, 0, 2)
  $
  La composición de las funciones
  $
    (g compose f)(x,y,z) eq g(x+y,y,z) eq (2(x+y),y,2z)
  $
  su matriz es
  $
    (g compose f)_(basec basec) eq mat(2, 2, 0; 0, 1, 0; 0, 0, 2)
  $
  que efectivamente verifica
  $
    B A eq mat(2, 0, 0; 0, 1, 0; 0, 0, 2) mat(1, 1, 0; 0, 1, 0; 0, 0, 1) eq mat(2, 2, 0; 0, 1, 0; 0, 0, 2)
  $

]

#definition()[

  Sea $A in M_(n) (K)$, si existe $B in M_n (K)$ tal que
  $
    A B eq I_n eq B A
  $
  se dice que $A$ es invertible o no singular y que $B$ es la inversa de $A$.

  Tambien se denota
  $
    B eq A^(-1)
  $
]

#ideabox()[

  Para que una matriz sea invertible debe ser cuadrada. Las matrices no cuadradas nunca tienen inversa.
]

#example[

  Consideremos la matriz
  $
    A eq mat(2, 4, 0; 1, 0, 1; 2, 2, 0)
  $
  Queremos buscar la inversa de $A$.

  Para ello, podemos hacer, secuencialmente, las mismas transformaciones elementales (similares a las que usabamos para escalonar) a $A$ y a $I$, intentando transformar a $A$ en $I$, con lo que $I$ se transformará en $A^(-1)$.

  La demostración y explicación de este método se verá más avanzada esta unidad.

  Luego veamos:

  $
    A||I to mat(2, 4, 0; 1, 0, 1; 2, 2, 0) mat(delim: "|", ; ; ;) mat(1, 0, 0; 0, 1, 0; 0, 0, 1) to^(F_1/2) mat(1, 2, 0; 1, 0, 1; 2, 2, 0) mat(delim: "|", ; ; ;) mat(1/2, 0, 0; 0, 1, 0; 0, 0, 1) \
    to^(F_3 - F_1) mat(1, 2, 0; 1, 0, 1; 1, 0, 0) mat(delim: "|", ; ; ;) mat(1, 0, 0; 0, 1, 0; -1/2, 0, 1) to^(F_1 <->F_3) mat(1, 0, 0; 1, 0, 1; 1, 2, 0) mat(delim: "|", ; ; ;) mat(-1/2, 0, 1; 0, 1, 0; 1, 0, 0) \
    to^(F_2 - F_1) mat(1, 0, 0; 0, 0, 1; 1, 2, 0) mat(delim: "|", ; ; ;) mat(-1/2, 0, 1; 1/2, 1, -1; 1, 0, 0) to^(F_3 - F_1) mat(1, 0, 0; 0, 0, 1; 0, 2, 0) mat(delim: "|", ; ; ;) mat(-1, 0, 1; 1, 1, -1; 3/2, 0, -1) \
    to^(F_3/2) mat(1, 0, 0; 0, 0, 1; 0, 1, 0) mat(delim: "|", ; ; ;) mat(-1, 0, 1; 1, 1, -1; 3/4, 0, -1/2) to^(F_3 <-> F_2) mat(1, 0, 0; 0, 1, 0; 0, 0, 1) mat(delim: "|", ; ; ;) mat(-1, 0, 1; 3/4, 0, -1/2; 1, 1, -1)
  $
  Así, la matriz inversa de $A$ es
  $
    A^(-1) eq mat(-1, 0, 1; 3/4, 0, -1/2; 1, 1, -1)
  $
]

#proposition()[

  Sean $V,V'$ K-espacios vectoriales tales que
  $
    dim(V) eq n eq dim(V')
  $
  Sea $base$ base de $V'$ y $base'$ base de $V'$. Para $f in lik(V, V')$ se tiene:
  $
    f "es isomorfismo" <==> (f)_(base base') "es invertible"
  $
]

#dem[

  "$==>$"

  Sea $f$ un isomorfismo, luego existe
  $
    f^(-1) : f^(-1) compose f eq id_(V), quad f compose f^(-1) eq id_(V')
  $
  Así, tenemos
  $
    f^(-1) compose f eq id_V then (f^(-1) compose f)_(base base) eq (id_V)_(base base) then \
    then (f^(-1))_(base' base) (f)_(base base') eq (id_V) eq I_n
  $
  Equivalentemente
  $
    (f)_(base base') (f^(-1))_(base' base) eq (id_V') eq I_n
  $

  "$<==$"

  Supongamos que existe $C$ tal que
  $
    (f)_(base base') C eq I_n eq C (f)_(base base')
  $
  definida para $g:V' to V$ como
  $
    C eq (g)_(base' base)
  $
  Luego
  $
    phi_(base' base') eq I_n eq (f)_(base base') (g)_(base' base) eq (f compose g)_(base' base') eq phi_(base' base') (f compose g)
  $
  Se tiene que $f compose g eq id_V'$ es un isomorfismo por $phi_(base' base')$ siempre serlo.
]

#definition(title: "Matriz de cambio de base")[

  Consideremos la función identidad en un K-espacio vectorial $V$ tal que $base$ es base del dominio y $base'$ es base del codominio.

  Luego $(id_V)_(base base')$ es la matriz de cambio de base y esta es siempre invertible por ser $id_V$ un isomorfismo.

  Además:
  $
    ((id_V)_(base base'))^(-1) eq (id_V)_(base' base)
  $
]

#example[

  Sea $V eq RR^3$ y
  $
    base eq {(1,2,0),(2,0,1),(0,0,1)} \
    base' eq {(1,1,1),(0,0,1),(0,1,0)}
  $
  Luego la matriz asociada a la identidad:
  $
    (1,2,0) eq 1(1,1,1) + (-1)(0,0,1) + 1(0,1,0) \
    (2,0,1) eq 2(1,1,1) + (-1)(0,0,1) + (-2)(0,1,0)\
    (0,0,1) eq 0(1,1,1) + 1 (0,0,1) + 0 (0,1,0)\
    (id_V)_(base base') eq mat(1, 2, 0; -1, -1, 1; 1, -2, 0)
  $
]

#proposition()[

  Sea $A in M_n (K)$ una matriz no singular tal que $A$ es una matriz de cambio de base y
  $
    base "base de" V \
    dim(V) eq n
  $
  Luego si $f: V to V$ una aplicación tal que $(f)_(base base) eq A$ se tiene que
  $
    cases(reverse: #true, A "invertible" then f "isomorfismo", #h(90pt) base "base de" V) then f(base) "es base de"V
  $
]

#proposition()[

  Sean $V,V'$ K-espacios vectoriales y $f:V to V'$ una aplicación lineal tal que
  $
    base, base_1 "base de" V \
    base' base'_1 "base de" V'
  $
  Luego se tendrá que
  $
    (f)_(base_1 base'_1) eq (1_V' compose f compose 1_V)_(base_1 base'_1) eq (id_V')_(base' base'_1) (f)_(base base') (id_V)_(base_1 base)
  $

  Gráficamente:

  #align(center)[#diagram(
    cell-size: 15mm,
    $
      V_base edge(f, ->) edge("d", id_(base_1 base), <-->) & V_base' edge("d", id_(base'_1 base'), <-->) \
                                      V_base_1 edge(f, ->) & V_base'_1
    $,
  )]
]<prop:factorizacion-cambio-base>

#example[

  Veamos como se puede interpretar el cambio de base.

  Supongamos primero un vector $v in V$ con la base habitual en $RR^2$. Es decir
  $
    basec eq {(1,0),(0,1)}
  $
  y
  $
    base eq {(1,1),(0,2)}
  $
  Luego $v$ gráficamente
  #align(center)[
    #figure(
      kind: "Figura",
      supplement: [*Figura*],
      cetz.canvas({
        import cetz.draw: *
        scale(y: 75%, x: 75%)
        grid(
          (-4, -4),
          (4, 4),
          help-lines: true,
          name: "V",
        )
        set-style(mark: (symbol: ")>"))
        content((-3.5, 4.5))[
          $V_basec eq RR^2$
        ]
        // Ejes
        line((-4, 0), (4, 0))
        line((0, -4), (0, 4))

        //Puntos representativos
        circle((1, 0), name: "a", radius: 2pt)
        content("a", text(fill: academic-colors.neutral-dark.lighten(40%))[$(1,0)$], anchor: "north", padding: .15)
        circle((-1, 0), name: "b", radius: 2pt)
        content("b", text(fill: academic-colors.neutral-dark.lighten(40%))[$-(1,0)$], anchor: "north", padding: .15)
        circle((0, 1), name: "c", radius: 2pt)
        content("c", text(fill: academic-colors.neutral-dark.lighten(40%))[$(0,1)$], anchor: "east", padding: .1)
        circle((0, -1), name: "d", radius: 2pt)
        content("d", text(fill: academic-colors.neutral-dark.lighten(40%))[$-(0,1)$], anchor: "north-east", padding: .1)

        //Vector representativo
        line((0, 0), (2, 3), name: "v", stroke: academic-colors.primary)
        content((2, 3), text(size: 10pt)[$2(1,0) + 3(0,1)$], anchor: "south")
        content((2, 2.5), text(size: 10pt)[$eq (2,3)$], anchor: "north-west")

        //---------------------------------------------------
        grid(
          (6, -4),
          (14, 4),
          help-lines: true,
          name: "V",
        )
        set-style(mark: (symbol: ")>"))
        content((6.5, 4.5))[
          $V_base eq RR^2$
        ]
        // Ejes
        line((6, 0), (14, 0))
        line((10, -4), (10, 4))

        //Puntos representativos
        circle((11, 0), name: "a1", radius: 2pt)
        content("a1", text(fill: academic-colors.neutral-dark.lighten(40%))[$(1,1)$], anchor: "north", padding: .15)
        circle((9, 0), name: "b1", radius: 2pt)
        content("b1", text(fill: academic-colors.neutral-dark.lighten(40%))[$-(1,1)$], anchor: "north", padding: .15)
        circle((10, 1), name: "c1", radius: 2pt)
        content("c1", text(fill: academic-colors.neutral-dark.lighten(40%))[$(0,2)$], anchor: "east", padding: .1)
        circle((10, -1), name: "d1", radius: 2pt)
        content(
          "d1",
          text(fill: academic-colors.neutral-dark.lighten(40%))[$-(0,2)$],
          anchor: "north-east",
          padding: .1,
        )

        //Vector representativo
        line((10, 0), (12, 3), name: "v", stroke: academic-colors.accent)
        content((12, 3), text(size: 10pt)[$2(1,1) + 3(0,2)$], anchor: "south")
        content((12, 2.5), text(size: 10pt)[$eq (2,8)$], anchor: "north-west")
      }),
      caption: [Representación gráfica de los \ cambios de base.],
    )
  ]
  Veamos como para $(v)_basec eq (2,3)$, a través del cambio de base
  $
    (1,1) eq 1(1,0) + 1(0,1) \
    (0,2) eq 0(1,0) + 2(0,1) \
    (id)_(basec base) eq mat(1, 0; 1, 2)
  $
  se obtiene que
  $
    (id)_(basec base) (v)_(basec) eq mat(1, 0; 1, 2) mat(2; 3) eq mat(2+0; 2+2·3) eq mat(2; 8) eq (v)_(base)
  $
  Como se aprecia gráficamente.
]

#definition(title: "Equivalencia de matrices")[

  Dadas $A,B in M_(m times n) (K)$ se dice que las matrices son equivalentes si existen matrices no singulares $P in M_n (K), Q in M_m (K)$ tales que
  $
    Q A P eq B
  $
]

#proposition()[

  Sean $A,B in M_(m times n) (K)$, luego
  $
    A "y" B "son equivalentes" <==> \
    <==> exists f:V to V' "lineal" : cases(dim(V) eq n, dim(V') eq m) "con"
  $
  $base$ y $base_1$ bases de $V$ y $base'$ y $base'_1$ bases de $V'$ tales que
  $
    (f)_(base base') eq A \
    (f)_(base_1 base'_1) eq B
  $
]

#dem[

  "$==>$"

  Supongamos que existen $Q,P$ no singulares tales que se verifica que $Q A P eq B$. Sean $V,V'$ K-espacios vectoriales  tales que
  $
    dim(V) eq n, quad dim(V') eq m
  $
  con $base$ base de $V$ y $base'$ base de $V'$ tal que
  $
    (f)_(base base') eq A
  $
  Definimos
  $
    P eq (id_V)_(base_1 base)
  $
  y como $P$ es no singular, es un cambio de base. Equivalentemente
  $
    Q eq (id_V)_(base' base'_1)
  $
  Luego se verifica:
  $
    Q A P eq B equiv (id_V')_(base' base'_1) (f)_(base base') (id_V)_(base_1 base) eq (f)_(base_1 base'_1)
  $

  "$<==$"

  Esta implicación es trivial porque gracias a la @prop:factorizacion-cambio-base podemos generar la factorización por cambios de base que demuestra la equivalencia de $A$ y $B$.
]

#corolary()[

  Sea $f in end_K (V)$ tal que
  $
    base, base_1 "bases de" V
  $
  luego
  $
    (f)_(base_1 base_1) eq (id_V)_(base base_1) (f)_(base base) (id_V)_(base_1 base) eq \
    eq ((id_V)_(base_1 base))^(-1) (f)_(base base) (id_V)_(base_1 base)
  $
]

#definition(title: "Semejanza de matrices")[

  Sean $A,B in M_n (K)$. Se dice que son semejantes si existe $P in M_n (K)$ no singular tal que
  $
    P^(-1) A P eq B
  $
]

#ideabox()[

  Enfaticemos en el parecido de las definiciones de equivalencia y semejanza.

  Para que dos matrices sean equivalentes no tienen porqué ser cuadradas y $P,Q$ no tienen que estar relacionadas.

  En cambio, cuando dos matrices equivalentes cumplen que sean cuadradas y que $Q$ sea inversa de $P$, se verifica que son semejantes.

  Todas las matrices semejantes son equivalentes pero no se cumple el recíproco.
]

#definition(title: "Espacio dual")[

  Sea $V$ un K-espacio vectorial. Luego el espacio dual de $V$, denotado por $hat(V)$, se define como:

  $
    lik(V, K) eq hat(V) eq hom_K (V,K)
  $
  Es decir que se trata de aplicaciones lineales de un espacio vectoria a un cuerpo escalar.

  Y aquellos $phi in hat(V)$ se llaman covectores.
]

#proposition()[

  Sea $V$ un espacio vectorial y ${v_i}_(i in I)$ una base de $V$.

  Sea $phi_i in hat(V)$ tales que
  $
    phi_i (v_j) eq delta_(i j) eq cases(1 quad i eq j, 0 quad i eq.not j)
  $
  Entonces
  + ${phi_i}_(i in I)$ es linealmente independiente.
  + Para todo $v in V$ se cumple que $phi_i(v) eq 0$ para casi todo $i in I$ y
    $
      v eq sumi phi_i (v) v_i
    $
  + Si $V$ tiene dimensión finita, entonces ${phi_i}_(i in I)$ es una base de $hat(V)$.
]

#dem[

  1.
  Supongamos que existe una combinación lineal nula
  $
    sumi a_i phi_i eq 0
  $
  Por lo que si evaluamos en $v_j$
  $
    (sumi a_i phi_i)(v_j) eq 0 then sumi a_i phi_i (v_j) eq 0
  $
  Pero por hipotesis tenemos $phi_i (v_j) eq delta_(i j)$. Entonces
  $
    sumi a_i delta_(i j) eq a_j eq 0
  $
  Luego
  $
    a_i eq 0, quad forall i in I
  $
  Así que ${phi_i}$ es linealmente independiente.

  2.

  Sea $v in V$. Como ${v_i}$ es base, existe una única combinación lineal tal que
  $
    v eq sumi a_i v_i
  $
  Aplicando $phi_j$:
  $
    phi_j (v) eq phi_j (sumi a_i v_i) eq sumi a_i phi_j (v_i)
  $
  Que sustituyendo de nuev
  $
    phi_j (v) eq sumi a_i delta_(i j) eq a_j
  $
  Luego $a_i eq phi_i (v)$, por lo que en en la expresión inicial:
  $
    v eq sumi phi_i (v) v_i
  $
  Como la base es finita, entonces $phi_i (v) eq 0, quad forallmost i in I$.

  3.

  Si $dim(V) eq n in NN$ finito, ${v_i}_(i in I)$ tiene $n$ elementos y entonces ${phi_i}_(i in I)$ tiene $n$ elementos. Además, ya probamos que son L.I.

  Luego un conjunto de $n$ funcionales independientes de $hat(V)$ es una base.

  En concreto
  $
    hat(base) eq {phi(v_i),...,phi(v_n)}
  $

]

#example[

  Sea $V eq RR^3$. Consideremos una función lineal $f in hat(V)$ que lleve los vectores de $V$ a un escalar. Por ejemplo:
  $
    f(x,y) eq x+y
  $


  #let body = ""

  #wrap-content(
    [
      #figure(
        kind: "Figura",
        supplement: [*Figura*],
        cetz.canvas({
          import cetz.draw: *
          scale(y: 75%, x: 75%)
          grid(
            (-4, -4),
            (4, 4),
            help-lines: true,
            name: "V",
          )
          set-style(mark: (symbol: ")>"))
          content((3, 4.5))[
            $V eq RR^2$
          ]
          // Ejes
          line((-4, 0), (4, 0))
          line((0, -4), (0, 4))

          //Puntos representativos
          circle((1, 0), name: "a", radius: 2pt)
          content(
            "a",
            text(fill: academic-colors.neutral-dark.lighten(40%))[$(1,0)$],
            anchor: "south-west",
            padding: .15,
          )
          circle((0, 1), name: "c", radius: 2pt)
          content(
            "c",
            text(fill: academic-colors.neutral-dark.lighten(40%))[$(0,1)$],
            anchor: "south-west",
            padding: .1,
          )
          circle((2, -1), name: "d", radius: 2pt)
          content(
            "d",
            text(fill: academic-colors.neutral-dark.lighten(40%))[$(2,-1)$],
            anchor: "north-east",
            padding: .1,
          )
          circle((3, -2), name: "e", radius: 2pt)
          content(
            "e",
            text(fill: academic-colors.neutral-dark.lighten(40%))[$(3,-2)$],
            anchor: "north-east",
            padding: .1,
          )
          circle((-1.5, 2.5), radius: 2pt)
          circle((-2, 3), radius: 2pt)
          circle((-1, 2), radius: 2pt)


          //Vector representativo
          line((4, -3), (-3, 4), name: "v", stroke: academic-colors.primary)
          content(
            ("v.start", 81%, "v.end"),
            text(size: 10pt)[$f(x,y) eq 1$],
            anchor: "south",
            angle: -45deg,
            padding: .1,
          )

          //Vector representativo
          line((2, -4), (-4, 2), name: "w", stroke: academic-colors.primary)
          content(
            ("w.start", 81%, "w.end"),
            text(size: 10pt)[$f(x,y) eq -2$],
            anchor: "south",
            angle: -45deg,
            padding: .1,
          )

          //Vector representativo
          line((0, -4), (-4, 0), name: "w", stroke: academic-colors.primary)
          content(
            ("w.start", 50%, "w.end"),
            text(size: 10pt)[$f(x,y) eq -4$],
            anchor: "south",
            angle: -45deg,
            padding: .1,
          )
        }),
        caption: [Representación gráfica de las \ lineas equipotenciales de un covector \ de $RR^2$.],
      )<fig:equival-dual>
    ],
    [
      Por lo que al ser lineal, si tomaremos todos los valores tales que $x+y eq 1$, nos daría una lineal recta en $V$. Para los $x+y eq 0$ nos daría otra recta paralela.

      Gráficamente, lo podríamos ver como en la @fig:equival-dual

      $quad quad quad f(1,0) eq 1+0 eq 1$

      $quad quad quad f(0,1) eq 0+1 eq 1$

      $quad quad quad f(2,-1) eq 2-1 eq 1$

      $quad quad quad f(3,-2) eq 3-2 eq 1$

    ],
    align: right,
    column-gutter: 1pt,
  )

  Y en general, para cualquier elemento $(x,y) in RR^2$ se le asocia un valor escalar $c in K eq RR$.

  El conjunto de todos los coovectores, es decir, todas las posibles funciones lineales que asignen valores de $R$ a elementos de $V eq RR^2$ es el espacio dual de $V$ ($hat(V)$).

  Otros ejemplos de coovectores de $RR^2$ pueden ser:

  - $f(x,y) eq y to quad$ las lineas de equivalencia son las horizontales.
  - $f'(x,y) eq y-2 to quad$ las lineas son las horizontales desplazadas 2 unidades.
  - $f''(x,y) eq 2x to quad$ las lineas son las verticales 2 veces más pegadas entre sí.
  - $f'''(x,y) eq x+pi^3 to quad$ las lineas son las verticales desplazadas $pi^3$ unidades.

  Cabe destacar que a estas funciones lineales $f$ del espacio dual se las suele representar mediante $phi$'s.

]

#example[

  Tomemos
  $
    base eq {(1,1,0,-1),(0,1,1,0),(0,0,1,1),(0,0,0,1)} \
    hat(base) eq {phi_1,phi_2,phi_3,phi_4}
  $
  tal que, por la definición de base, se tiene
  $
    phi_1(v_1) eq 1, quad & phi_1 (v_2) eq 0, quad & phi_1 (v_3) eq 0, quad & phi_1 (v_4) eq 0 \
    phi_2(v_1) eq 0, quad & phi_2 (v_2) eq 1, quad & phi_2 (v_3) eq 0, quad & phi_2 (v_4) eq 0 \
    phi_3(v_1) eq 0, quad & phi_3 (v_2) eq 0, quad & phi_3 (v_3) eq 1, quad & phi_3 (v_4) eq 0 \
    phi_4(v_1) eq 0, quad & phi_4 (v_2) eq 0, quad & phi_4 (v_3) eq 0, quad & phi_4 (v_4) eq 1
  $

  Luego toda aplicación lineal del dual va a ser de la siguiente forman
  $
    phi(x_1, x_2, x_3, x_4) eq a x_1 + b x_2 + c x_3 + d x_4
  $
  Luego sabemos que $phi_1 (v_1) eq 1$ y $v_1$ de la base es $(1,1,0,-1)$, así:
  $
    phi_1(1,1,0,-1) eq 1 a + 1 b + 0 c + (-1) d eq a + b -d eq 1
  $
  Para el resto de vectores de la base:
  $
    phi_1(0,1,1,0) eq b+d eq 0 \
    phi_1(0,0,1,1) eq c+d eq 0 \
    phi_1(0,0,0,1) eq d eq 0
  $
  Luego resolviendo obtenemos
  $
    a eq 1, quad b eq 0, quad c eq 0, quad d eq 0.
  $
  Quedandonos
  $
    phi_1 (x_1,x_2,x_3,x_4) eq x_1
  $
  Haciendo lo mismo para el resto
  $
    phi_2 (x_1,x_2,x_3,x_4) eq -x_1+x_2 \
    phi_3 (x_1,x_2,x_3,x_4) eq x_1 - x_2 + x_3 \
    phi_4 (x_1,x_2,x_3,x_4) eq -2x_1 + x_2 - x_3 + x_4
  $
  Que satisface que $phi_i (v_j) eq delta_(i j)$, por lo que  es la base dual de $base$.

]

#example[

  Sea $base eq {v_1,v_2,v_3,v_4}$ una base de $V eq RR^4$ del ejemplo anterior y sea $hat(base) eq {phi_1,phi_2,phi_3,phi_4}$ la base dual de $base$.

  Si
  $
    v eq alpha_1 v_1 + alpha_2 v_2 + alpha_3 v_3 + alpha_4 v_4
  $
  entonces sus coordenadas en la base $base$ son
  $
    v_base eq (alpha_1,alpha_2, alpha_3, alpha_4)
  $
  que por linearidad:
  $
    phi_i (v) eq phi_i (alpha_1 v_1 + alpha_2 v_2 + alpha_3 v_3 + alpha_4 v_4) eq \
    eq alpha_1 phi_i(v_1) + alpha_2 phi_i(v_2) + alpha_3 phi_i(v_3) + alpha_4 phi_i(v_4)
  $
  Como $phi_i (v_j) eq delta_(i j)$,
  $
    phi_i (v) eq alpha_i
  $
  Es decir, cada funcional de la base dual extrae la coordenada correspondiente al vector. Por ejemplo, para $i eq 3$:
  $
    v_base eq (1,1,-1,1) then phi_3 (v) eq alpha_3 eq -1
  $
  Ahora buscamos
  $
    (x,y,z,t) eq alpha(1, 1, 0, -1) + beta(0, 1, 1, 0) + gamma(0, 0, 1, 1) + delta(0, 0, 0, 1) \
    alpha eq x, quad gamma eq z-y+x, \
    beta eq y-x, quad delta eq y-z+t
  $
  Por tanto
  $
    (x,y,z,t)_base eq (x,y-x,x-y+z,y-z+t)
  $
  Como $phi_i (v)$ devuelve la coordenada i de $v_base$ obtenemos las expresiones de la base dual en la base canónica:
  $
    phi_1(x,y,z,t) eq x\
    phi_2(x,y,z,t) eq y-x\
    phi_3(x,y,z,t) eq x-y+z\
    phi_4(x,y,z,t) eq y-z+t
  $
]

#followexample[

  Sea
  $
    phi(x, y, z, t) eq x-y+z+t
  $
  Para hallar sus coordenadas en la base dual usamos
  $
    (phi)_(hat(base)) eq (phi(v_1),phi(v_2),phi(v_3),phi(v_4))
  $
  Calculamos
  $
    phi(v_1) eq 1-1+0-1 eq -1\
    phi(v_2) eq 0-1+1+0 eq 0\
    phi(v_3) eq 0-0+1+1 eq 2\
    phi(v_4) eq 0-0+0+1 eq -1\
  $
  Luego
  $
    (phi)_(hat(base)) eq (-1,0,2,1)
  $
]

#definition(title: "Espacio bidual")[

  Llamamos espacio bidual de $V$ y lo denotamos $bidual(V)$ a
  $
    bidual(V) eq lik(vd, K)
  $
]

#proposition()[

  Sea $sigma:V to bidual(V)$ una aplicación lineal. Para $v in V$, $phi in vd$:
  $
    sigma(v)(phi) eq phi(v)
  $
  $
    & V & to bidual(V) & \
    & v &   ~~>dual(v) & to K \
    &   &          phi & ~~> phi(V)
  $
  Luego
  - $sigma(v) in vd$
  - $sigma$ es lineal e inyectiva
  - Si la dimension de $V$ es finita, $sigma$ es un isomorfismo.
]

#dem[

  Veamos si $sigma$ es lineal.

  ¿$sigma(u+v) eq sigma(u)+sigma(v), quad forall u,v in V$?

  Tenemos que
  $
    sigma(v+u)(phi) eq phi(u+v) eq phi(u)+phi(v) eq sigma(u)(phi) + sigma(v)(phi)
  $
  Y
  $
    lambda sigma(v)(phi) eq lambda phi(v) eq phi(lambda v) eq sigma(lambda v)(phi)
  $
  Luego es lineal.

  Ahora veamos que es inyectiva

  $
    v in ker(sigma) <=> sigma(v)(phi) eq 0 <=> \
    <=> phi(v) eq 0 <=> sigma_i (v) eq 0 (forall i in I) then v eq {0}
  $
  Luego $sigma$ es inyectiva.

  finalmente, veamos que si la dimensión de $V$ es dinita, $sigma$ es un isomorfismo.
  $
    cases(reverse: #true, dim(V)<infinity then dim(vd) eq dim(V), dim(bidual(V)) dim(vd)) then dim(V) eq dim(bidual(V))
  $
  Además, como $sigma$ es una aplicación lineal inyectiva, se tiene que $sigma$ es un isomorfismo. Es decir
  $
    V iso bidual(V)
  $
]

#definition(title: "Ortogonal o aniquilador")[

  Sea $U$ un subespacio de $V$, tal que
  $
    U"*" eq {phi in vd:phi(u) eq 0, forall u in U}
  $
  Entonces $U"*"$ es un subespacio de $vd$ llamado ortogonal de $U$ o aniquilador de $U$.
]

#note[

  De ahora en adelante, para mayor comodidad, se considerarán espacios vectoriales de dimensión finita,
  $ dim(V)< infinity, quad (forall V "posterior a esta nota") $ excepto que se especifique lo contrario.
]

#proposition()[

  Para todo espacio vectorial $V$, se verifica
  + $dim(V) eq dim(U)+dim(U"*")$
  + Si $v in V$, $v in U <==> phi(v) eq 0, quad forall phi in U"*"$
]

#dem[

  Sea ${u_1,...,u_r}$ una base de $U$.

  1.

  Como ${u_1,...,u_r}$ es linealmente independiente, podemos complementar las base para $V$
  $
    {u_1,...,u_r,u_(r+1),...,u_n}
  $
  Luego $U"*"$ es un subespacio de $vd$ y
  $
    dual(base_V) eq {phi_1,...,phi_n,phi_(n+1),...,phi_n}
  $
  Veamos que ${phi_(n+1),...,phi_k}$ es base de $U"*"$

  $
    cases(reverse: #true, dual(base_V) "es base de" vd, {phi_(n+1),...,phi_k} subset dual(base_V)) then {phi_(n+1),...,phi_K} "L.I."
  $
  ¿$U"*" eq gen(phi_(n+1)",...,"phi_k)$

  "$supset$"

  Para cierto $phi in gen(phi_(n+1)",..,"phi_k)$, se tiene
  $
    phi in vd then phi eq sum_(i eq 1)^k phi(u_i) phi_i then phi(u_i) eq 0, quad (forall i in {1,...,n}) then \
    then phi(u) eq 0, quad (forall u in U) then phi in U"*"
  $

  "$subset$"

  Sea $phi in U"*"$, luego
  $
    phi(u_j) eq 0 quad (forall j in {1,...,n}) then (sum_(i eq 1)^k lambda_i phi_i)(u_j) eq \
    eq sum_(i eq 1)^k lambda_i phi_i(u_j) eq sum_(i eq 1)^k lambda_i delta_(i j) eq 0 then lambda_i eq 0 quad forall i in {1,...,n}
  $
  Por lo tanto $phi eq sum_(i eq 1)^k lambda_i phi_i$ y así $phi in gen(phi_(n+1)",...,"phi_k)$.

  2.

  Sea $v in V, quad$  ¿$phi(v) eq 0 quad forall phi in U"*" <==> v in U$?

  "$<==$"

  Se verifica por la definición de $U"*"$.

  "$==>$"

  Supongamos que $phi(v) eq 0 quad forall phi in U"*"$. En concreto se verifica $phi_j (u) eq 0, quad forall j in {n+1,...,k}$. Entonces
  $
    0 eq phi_j (sum_(i eq 1)^k x_i u_i) eq sum_(i eq 1)^k x_i phi_j (u_i) eq x_i, quad i in{n+1,...,k}
  $
  Así que$v eq sum_(i eq 1)^k x_i u_i in U$.
]

#remark()[

  Sean $V$ un K-espacio vecorial de dimensión $n$, $base eq {v_1,...,v_n}$ una base de $V$, $U$ un subespacio de $V$ y ${phi_1,...,phi_s}$ una base de $U"*"$.

  Luego para $v eq sum_(i eq 1)^n x_i u_i in V$
  $
    v in U <=> phi(u) eq 0, quad forall phi in U"*" <=> phi_j (u) eq 0, quad forall j <=> \
    <=> 0 eq phi_j (u) eq phi_j (sum_(i eq 1)^n x_i u_i) eq sum_(i eq 1)^n x_i phi_j (u_i) quad (1<=j<=s)
  $
]

#example[


]

#definition(title: "Matriz traspuesta")[

  Sea $A eq (a_(i j) in M_(m times n) (K))$.

  Llamamos matriz traspuesta de $A$, a:
  $
    A^t eq (b_(i j)) : b_(i j) eq a_(j i)
  $
  y
  $
    A^t in M_(n times m) (K)
  $
]

#definition()[

  Sean $V, V'$ K-espacios vectoriales tales que $f: V to V'$ es una aplicación lineal.
  $
    V to^f V' to^phi K
  $
  Llamamos dual de $f$ a
  $
    dual(f) eq vd' to vd
  $
  tal que
  $
    dual(f)(phi) eq phi compose f
  $
]

#proposition()[

  Sean
  $
    base eq {v_1,...,v_n} "base de" V \
    base' eq {v'_1,...,v'_n} "base de" V' \
    bd eq {phi_1,...,phi_n} "base de" vd \
    bd' eq {Phi_1,...,Phi_n} "base de" vd' \
  $
  Luego se verifica:
  $
    (dual(f))_(bd' bd) eq (f)_(base base')^t
  $
]

#dem[

  Sea
  $
    (f)_(base base') eq (a_(i j)) in M_(m times n) (K)
  $
  es decir,
  $
    f(v_j) eq sumim a_(i j) v'_i
  $
  Tomemos un $Phi_k in vd'$ que, por definición
  $
    fd(Phi_k) eq Phi_k compose f
  $
  Como $fd (Phi_k) in vd$, podemos escribirlo en la base dual:
  $
    fd(Phi_k) eq sum_(i eq 1)^n fd (Phi_k)(v_i) phi_i
  $
  Donde
  $
    fd(Phi_k)(v_i) eq (Phi_k compose f)(v_i) eq Phi_k(f(v_i))
  $
  Luego
  $
    Phi_k (f(v_i)) eq Phi_k (sum_(r eq 1)^m a_(r i) v'_r) eq sum_(r eq 1)^m a_(r i) Phi_k (v'_r)
  $
  Pero como ${Phi_r}$ es la base dual de ${v'_r}$:
  $
    Phi_k (v_r) eq delta_(k r)
  $
  Por tanto
  $
    fd (Phi_k)(v_i) eq sum_(r eq 1)^m a_(r i) delta_(k r) eq a_(k i)
  $
  obteniendo
  $
    fd(Phi_k) eq sum_(i eq 1)^n a_(k i) phi_i
  $
  Esto significa que las cordenadas de $fd(Phi_k)$ en la base $bd$ son:
  $
    (a_(k 1), a_(k 2), ..., a_(k n))
  $
  Así que la matriz asociada a $fd$ es $(a_(k i))$, que es precisamente la traspuesta de
  $
    (a_(i j)) eq (f)_(base base')
  $
  Y en conclusión
  $
    (fd)_(bd' bd) eq (f)_(base base')^t
  $
]

#proposition()[

  Sean $A in M_(m times n) (K)$ y $B in M_(n times m) (K)$, luego se verifica
  $
    (B A)^t eq A^t B^t
  $
]

#dem[

  Definamos $V to^f V' to^g V''$ con bases $base, base', base''$ respectivamente, tales que
  $
    (g compose f)_(base base'') eq B A
  $
  Luego
  $
    cases(reverse: #true, vd'' to^(dual(g)) vd' to^(fd) vd, V to^f V' to^g V'') then dual(g compose f) eq fd compose dual(g)
  $
  Luego,
  $
    (B A)^t eq (dual(g compose f))_(bd'' base) eq (fd compose dual(g))_(bd'' base) eq \
    eq (dual(g))_(bd'' bd')(fd)_(bd' base) eq (g)_(base' base'')^t (f)_(base base')^t eq B^t A^t
  $
]

#example[


]

#proposition()[

  Sea $A in M_n (K)$ una matriz no singular, entonces
  $
    (A^t)^(-1) eq (A^(-1))^t
  $
]

#dem[

  Sean
  $
    id_V : V to V quad (base, base' "bases respectiamente") \
    id_vd : vd to vd quad (bd, bd' "bases respectiamente")
  $
  Tales que definen:
  $
    (id_V)_(base base') \
    (id_dual(V))_(bd' bd) eq (id_V)_(base base')^t
  $
  Luego
  $
    (((id_V)_(base base'))^t)^(-1) eq ((id_vd)_(bd' bd))^(-1) eq (id_vd)_(bd bd') eq ((id_V)_(base' base))^t
  $
]

#example[


]

#definition(title: "Rango")[

  Sea $f: V to V'$ una aplicación lineal, entonces
  $
    ran(f) eq dim(im(f))
  $
]

#lemma[

  Sea $f: V to V'$ una aplicación lineal. Se verifica
  $
    ker(fd) eq (f(V))"*"
  $
]

#dem[

  Para $Phi in ker(fd)$ se tiene
  $
    fd(Phi) eq 0 \
    <=> Phi compose f eq 0 \
    <=> (Phi compose f)(v) eq 0 quad forall v in V \
    <=>Phi(f(v)) eq 0 quad forall v in V \
    <=> Phi(f(V)) eq 0 \
    <=> Phi in (f(v))"*"
  $
]

#proposition()[

  Siempre se verifica:
  $
    ran(fd) eq ran(f)
  $
]

#dem[

  Por definición:
  $
    ran(fd) eq dim(im(fd)) eq dim(vd') + dim(ker(fd)) eq \
    eq dim(vd') - dim(im(f))"*" eq dim(v') - dim(im(f))"*" eq \
    eq dim(im(f)) eq ran(f)
  $
]

#definition()[

  Para $A in M_(m times n) (K)$, se considera el rango de la matriz como el número máximo de columnas linealmente independientes. Es decir, para
  $
    A eq mat(a_(1 1), dots, a_(1,n); dots.v, dots.down, dots.v; a_(m 1), dots, a_(m n))
  $
  se tiene
  $
    ran(A) eq dim(chevron (a_(1 1),...,a_(m 1)), dots, (a_(1 n),...,a_(m n)) chevron.r)
  $
  tal que
  $
    {(a_(1 1),...,a_(m 1)), dots ,(a_(1 n),...,a_(m n))} subset K^m
  $
]

#proposition()[

  Sean $A in M_(m times n) (K)$ una matriz y $f:V to V'$ una aplicación lineal con $base eq {u_1,...,u_n}$ base de $V$ y $base' eq {v_1,...,v_n}$ base de $V'$.

  Sabemos
  $
    im(f) eq gen(f(u_1)",...,"f(u_r)) subset V'
  $
  Luego
  $
    ran(f) eq dim(gen(f(u_1)",...,"f(u_r)))
  $
  Por lo que considerando un isomorfismo
  $
    chi_base' : V' to K^m
  $
  Se tiene:
  $
    ran(A) eq ran(f) eq ran(fd) eq ran(A^t)
  $
  Por lo tanto es equivalente medir el rango por columnas que por filas de una matriz.
]

#proposition()[

  Sea $A in M_n (K)$, luego
  $
    ran(A) eq n <==> A "es no singular"
  $
]

#dem[

  Tenemos
  $
    ran(A) eq n <=> ran(f) eq n <=> dim(im(f)) eq n
  $
  Luego suponiendo
  $
    (f)_(base base) eq A then im(f) subset V
  $
  Entonces,
  $
    cases(reverse: #true, im(f) subset V, dim(v) eq n) then im(f) eq V <=> f "es sobreyectiva" <=> \
    <=> f "es isomorfismo" <=> A "es no singular"
  $
]

#lemma[

  Sea $f: V to V'$ una aplicación lineal tal que $ran(f) eq r$.

  Entonces existen $base$ base de $V$ y $base'$ base de $V'$ tal que
  $
    (f)_(base base') eq mat(I_r, dots.v, 0; dots, , dots; 0, dots.v, 0)
  $
]

#dem[

  Sea ${v_(r+1,...,v_n)}$ una base del $ker(f)$.

  La complementamos de tal manera que quede una base de $V$:
  $
    {v_1,...,v_r,v_(r+1),...,v_n} eq base
  $
  Entonces
  $
    cases(reverse: #true, gen(f(v_1)",...,"f(v_r)) eq im(f), dim(im(f)) eq r) then {f(v_1),...,f(v_r)} "es L.I."
  $
  Por lo tanto, cada $f(v_i)$ es una combinación lineal de la siguiente manera:
  $
    f(v_1) eq 1 f(v_1) + 0 f(v_2) + ... + 0 f(v_r) \
    dots.v \
    f(v_r) eq 0 f(v_1) + ... + 0 f(v_(r-1)) + 1 f(v_r)
  $
  Por lo que
  $
    f(base) eq base'
  $
  y la matriz asociada es de la forman
  $
    (f)_(base base') eq mat(1, 0, dots, 0, 0; 0, 1, dots, 0, 0; dots.v, dots.v, dots.down, dots.v, dots.v; 0, 0, dots, 0, 0; 0, 0, dots, 0, 0)
  $
  En la que el cuadrado superior derecho coincide con las combinaciones lineales de $v_1$ hasta $v_r$ y el resto, todo ceros, es el completamieno de la base.
]

#corolary()[

  Sea $A in M_(m times n) (K)$ una matriz de rango $r$, esto significa que las matrices
  $
    A quad "y" quad mat(I_r, dots.v, 0; dots, , dots; 0, dots.v, 0)
  $
  son equivalentes.
]

#dem[

  Sea $A in M_(m times n) (K)$, luego existe
  $
    (f)_( base_1 base_2) eq A then A ~ mat(I_r, dots.v, 0; dots, , dots; 0, dots.v, 0)
  $
]

#proposition()[

  Sean $A,b in M_(m times n)(K)$, entonces
  $
    A ~ B <=> ran(A) eq ran(B)
  $
]

#dem[

  "$<==$"

  Tenemos
  $
    cases(
      reverse: #true,
      ran(A) eq r then A ~ mat(I_r, dots.v, 0; dots, , dots; 0, dots.v, 0),
      ran(B) eq r then B ~ mat(I_r, dots.v, 0; dots, , dots; 0, dots.v, 0)
    ) then A ~ B
  $

  "$==>$"

  Sabemos que por estar relacionados, existe
  $
    A eq (f)_( base base') then ran(A) eq ran(f)\
    A eq (f)_(base_1 base'_1) then ran(B) eq ran(f)
  $
  Por lo que
  $
    ran(A) eq ran(B)
  $
]

#definition(title: "Matrices elementales")[

  Ya definimos anteriormente en la @def:matrix-elem una matriz elementar que utilizaremos para construir las siguientes:
  $
    T_(i j) (lambda) eq I + lambda E_(i j) eq mat(
      1, 0, 0, dots, 0, dots, 0, 0;
      0, 1, 0, dots, 0, dots, 0, 0;
      dots.v, dots.v, dots.v, dots.down, dots.v, dots.down, dots.v, dots.v;
      0, 0, 0, dots, lambda, dots, 1, 0;
      dots.v, dots.v, dots.v, dots.down, dots.v, dots.down, dots.v, dots.v;
      0, 0, 0, dots, 0, dots, 1, 0;
      0, 0, 0, dots, 0, dots, 0, 1
    ) quad (i eq.not j)
  $
  con el $lambda$ en la posición $i j$.

  $
    D_i (lambda) eq I + (lambda - 1) E_(i i) eq mat(
      1, 0, dots, 0, dots, 0, 0;
      0, 1, dots, 0, dots, 0, 0;
      dots.v, dots.v, dots.down, dots.v, dots.down, dots.v, dots.v;
      0, 0, dots, lambda, dots, 1, 0;
      dots.v, dots.v, dots.down, dots.v, dots.down, dots.v, dots.v;
      0, 0, dots, 0, dots, 1, 0;
      0, 0, dots, 0, dots, 0, 1
    ) quad (lambda eq.not 0)
  $
  de manera que $lambda$ queda a lo largo de la diagonal.

  $
    P_(i j) eq I - E_(i i) - E_(j j) + E_(i j) + E_(j i) eq \
    eq mat(
      1, dots, 0, dots, 0, dots, 0;
      dots.v, dots.down, dots.v, dots.down, dots.v, dots.down, dots.v;
      0, dots, #text(fill: academic-colors.error)[0], dots, #text(fill: academic-colors.error)[1], dots, 0;
      dots.v, dots.down, dots.v, dots.down, dots.v, dots.down, dots.v;
      0, dots, #text(fill: academic-colors.error)[1], dots, #text(fill: academic-colors.error)[0], dots, 0;
      dots.v, dots.down, dots.v, dots.down, dots.v, dots.down, dots.v;
      0, dots, 0, dots, 0, dots, 1;
    )
  $
  tal que se cambiaron por ceros los unos de la diagonal en las posiciones $i, j$ y se sustituyeron por los ceros en los encuentros de estos dos índices.
]

#definition(title: "Operaciones elementales por filas")[

  Consideraremos las siguientes operaciones elementales. Sea la matriz $A$, entonces podemos:
  - "Sumar el múltiplo de otra fila"
  $
    T_(i j)(lambda) A eq (I + lambda E_(i j))A eq A+lambda E_(i j) A
  $
  que se denota:
  $
    F_i(A) + lambda F_j (A)
  $
  donde a la fila $i$ de la matriz $A$ le estamos sumando $lambda$ veces la fila $j$ de $A$.

  - "Multiplicar una fila por un escalar"

  $
    D_i (lambda) A eq (I+(lambda-1)E_(i i))A eq A (lambda-1)E_(i i)A
  $
  que se denota:
  $
    lambda F_i (A)
  $
  y a la fila $i$ de A se le está multiplicando $lambda$ a cada elemento.

  - "Intercambio de filas"
  $
    P_i A
  $
  que se denota:
  $
    F_i (A) <-> F_i (A)
  $
  y se pasa la fila $i$ de A a la posición $j$ y viceversa.
]

#note[
  Otra notación para cada una de las operaciones puede ser:
  $
    T_(i j) (lambda) equiv E_(F_i `lambda F_j) \
    D_i (lambda) equiv E_(lambda F_i) \
    P_(i j) equiv E_(F_i <->F_j)
  $
  Además, si se multiplicase la matriz $A$ por la derecha en lugar de por la izquierda, las operaciones serían por columnas.
]

#definition(title: "Matriz escalonada")[

  Una matriz $A in M_(m times n) (K)$ está escalonada si sus vectores fila $F_1(A),...,F_(m)(A)$ estan escalonados. Es decir:
  + Las filas nulas estan debajo.
  + Los pivotes de cada una está a la izquierda de los de las filas siguientes.
  Y diremos que está escalonada reducida si los pivotes son $1$'s y en las columnas de los pivotes todos los coeficientes son $0$ salvo el pivote.
]

#example[


]

#definition()[

  Las matrices $A$ y $B$ son equivalentes por filas si existen matrices elementales $E_1,...,E_q$ tales que
  $
    E_q dot ... E_1 dot A eq B
  $
]

#proposition()[

  Si dos matrices son equivalentes por filas entonces las matrices son equivalentes.
]

#dem[

  Al ser todas las matrices elementales, no singulares, la definición de equivalencia por filas verifica la de equivalencia:
  $
    (T_(i j) (lambda))^(-1) eq T_(i j) (-lambda) \
    (D_i (lambda))^(-1) eq D_i (lambda^(-1)) \
    (P_(i j))^(-1) eq P_(j i) eq P_(i j)
  $
]

#proposition()[

  Toda matriz es equivalente por filas a una matriz escalonada y es equivalente por filas a una única matriz escalonada reducida.
]

#proposition()[

  Sea la matriz $A in M_n (K)$. Son equivalentes:
  + $A$ es no singular.
  + $A$ y $I_n$ son equivalentes por filas.
]

#dem[

  $2.=>1.$

  Por ser $A$ equivalente por filas  a $I_n$, existen matrices elementales $E_1,...,E_q$ tales que
  $
    E_q dot ... dot E_1 dot I_n eq A
  $
  Luego sabemos que existe la inversa del lado izquierdo:
  $
    A^(-1) eq E_1^(-1) dot ... dot E_q^(-1)
  $

  $1. => 2$

  Sea $B$ una matriz escalonada quivalente por filas a $A$ de  manera que $A$ es no singular. Luego $B$ es no singular, entonces
  $
    cases(
      reverse: #true,
      B "no tiene filas de ceros",
      B "tiene" n "pivotes"
    ) then \
    then B eq I_n
  $
]


