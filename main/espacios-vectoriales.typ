#import "../metadata.typ": *

#import "../enviroments.typ": *

#import "../temp/math.typ": *
#import "../temp/text.typ": *
#import "../temp/constants.typ": *

#import "@preview/cetz:0.4.2"
#import "@preview/larrow:1.0.1": *
#import "@preview/wrap-it:0.1.1": wrap-content

#set text(font: "New Computer Modern")
#set footnote(numbering: "*")
#let lal = arrow-label.with(dx: 0mm, dy: 0mm)


#pagebreak()

= Espacios Vectoriales
#definition(title: "Espacio Vectorial")[

  Se dice que un conjunto $V eq.not emptyset$ es un espacio vectorial sobre un cuerpo $(K,+,·)$ o que es un K-espacio vectorial si:

  1. En $V$ está definida una operación interna aditiva denotada por $"+"$ de modo que $(V,+)$ es un grupo abeliano.
  2. Existe una operación externa llamada producto de escalares por vectores:
  $
    K times V arrow.r.long V \
    (alpha, v) ~~> alpha · v
  $
  Tales que, para todo $v,w in V$ y $alpha, beta in K$, tenemos:
  $
    (alpha + beta)·v eq alpha v + beta v \
    alpha(v + w) eq alpha v + alpha w\
    alpha(beta v) eq (alpha beta)v \
    1_K · v = v
  $
]

#idea()[
  $
    K #text()[cuerpo] <==> cases((K,+) #text()[abeliano], (K without {0}) #text()[abeliano])
  $
]

#definition(
  title: "Subespacio vectorial",
)[

  Sea $U eq.not emptyset$ y $U subset V$. $U$ es un subespacio vectorial de $V$ si es un espacio vectorial con las operaciones de $V$:
  $
    forall u, u' in U, quad u+u' in U \
    forall lambda in K, quad lambda u in U
  $
  o equivalentemente:
  $
    forall lambda , mu in K, forall u, u' in U, quad lambda u + mu u' in U
  $
]

#remark()[
  Trivialmente, si $U$ es un espacio o un subespacio vectorial, siempre se va a tener:
  $
    0 in U
  $
]

#remark()[
  $
    K #text()[es K-espacio vectorial] \
    K^n #text()[es K-espacio vectorial] \
    RR^n #text()[es $RR$-espacio vectorial] \
    K' <= K, K #text()[es $K'$-espacio vectorial]
  $
]

#idea()[
  Si $V$ es espacio vectorial sobre $K$ y $A$ es un conjunto:
  $
    V^A eq {f:A to V : f #text()[es aplicación]}
  $
]

#idea()[
  Por lo general, en lo que respecta a la notación:
  $
    lambda in K, lambda #text()[escalar] \
    v in V, v #text()[vector] \
    0 #text()[vector cero o nulo]
  $
]

#example()[
  Para todo $lambda, mu in K$:
  - ${0}$ es el subespacio trivial, pues se tiene:
  $
    lambda · 0 + mu · 0 in {0}
  $
  - $U eq {(x,y,z) in RR^3 : x = 0 }$ es subespacio porque:
  $
    (0,0,0) in U \
    lambda · (0,b,c) + mu · (0,b',c') eq \
    eq (0,lambda b, lambda c) + (0, mu b', mu c') eq (0,lambda b + mu b',lambda c + mu c')
  $
  - $U eq {(x,y) in RR^2 : x + y = 1}$ se tiene que $U eq.not emptyset$ pero como $0 + 0 eq.not 1 =>(0,0) in.not U$ no es un espacio vectorial.
]

#proposition()[

  Para todo $lambda in K$ y $v in V$ se verifica:
  1. $
      lambda · 0 eq 0 eq 0 · v
    $
  2. $
      (-lambda)v eq lambda(-v) eq -(lambda v)
    $
  3. $
      lambda v eq 0 <==> lambda eq 0 or v eq 0
    $
]
#dem()[
  1. $
      lambda · 0 eq lambda (v-v) eq lambda v - lambda v = 0
    $
  2. $
      (-lambda)v eq lambda(-v) <=> (-lambda)v + lambda v eq lambda(-v) + lambda v <=> \
      <=> (- lambda + lambda)v eq lambda(-v + v) <=> 0 eq 0.
    $
  3. "$==>$"$quad$ Supongamos que $lambda eq.not 0$,
    $
      lambda v eq 0 => lambda^(-1) lambda v eq lambda^(-1) 0 => v eq 0
    $
    Por lo contrario, suponiendo que $lambda eq 0$, ya es trivial.

    "$<==$"$quad$ La demostración es trivial para ambos casos.
]

#remark()[
  Sean ${U_i}_(i in I)$ una familia de subespacios de $V$, entonces
  $
    forall i in I, quad inter.big_(i in I)U_i quad #text()[es un subespacio]
  $
  pero
  $
    union.big_(i in I)U_i quad #text()[no tiene porque ser un subespacio]
  $
]


#definition(title: "Subespacio generado")[

  Sea $S subset V$, se llama subespacio generado por $S$ o $chevron.l S chevron.r$ al menor subespacio de $V$ que contiene a $S$
  $
    chevron.l S chevron.r eq inter.big {U_i : U_i #text()[es subespacio de] V and S subset U_i}
  $
  Si $chevron.l S chevron.r eq U$, luego $S$ es el conjunto de generadores de $U$.

  Cuando $S eq emptyset$, $chevron.l S chevron.r eq {0}$
]

Sean $V_1,V_2,...,V_n$ K-espacios vectoriales, entonces $V_1 times V_2 times ... times V_n$ es un K-espacio vectorial y puede operar de la siguiente manera:

Dados $(v_1,v_2,...,v_n),(v'_1,v'_2, ... ,v'_n) in V_1 times V_2 times ... times V_n$

$
  (v_1,v_2,...,v_n)+(v'_1,v'_2, ... ,v'_n) eq \
  eq (v_1 + v'_1,v_2 + v'_2, ... ,v_n + v'_n) in V_1 times V_2 times ... times V_n \
  lambda · (v_1,v_2,...,v_n) eq (lambda · v_1,lambda · v_2,...,lambda · v_n) in V_1 times V_2 times ... times V_n
$

#definition()[

  Sea $S subset V$, $S eq.not emptyset$. Una combinación lineal de elementos de $S$ es un vector  de $V$ de la forma:
  $
    chevron.l S chevron.r eq {sum_(i=1)^n lambda_i · v_i : quad lambda_i in K, quad v_i in S, quad forall i in {1,...,n}}
  $
  equivalentemente:
  $
    lambda_1 v_1 + lambda_2 v_2 + ... + lambda_n v_n : cases(lambda_i in K, v_i in S, 1 <= i <= n)
  $
]

#definition()[

  Diremos que $V$ es un espacio vectorial finitamente generado si tienen un conjunto de generadores finito, es decir, $S subset V$ es finito y $chevron.l S chevron.r eq V$.
]

#remark()[
  - Si $S,S' subset V$ y $S subset S' =>chevron.l S chevron.r subset chevron.l S' chevron.r$

  - Si $S, S' subset V$:
  $
    chevron.l S chevron.r eq chevron.l S' chevron.r <==> cases(
      chevron.l S chevron.r subset chevron.l S' chevron.r,
      quad quad and,
      chevron.l S' chevron.r subset chevron.l S chevron.r
    )
    => cases(
      S subset gen(S'),
      quad and,
      S' subset gen(S)
    )
  $
  Particularmente , si $S subset V$ y $v,w in V$, $w in S$, se verifica
  $
    gen(S) eq gen(S union {w}) <==> v in S
  $
  idem
  $
    gen(S) eq gen(S without {w}) <==> w in gen(S without {w})
  $
  generalmente, $0 in S$, así
  $
    gen(S) eq gen(S without {0}).
  $
  - Si $U, W <= V$, $quad W + U$ es el menor subespacio de $V$ que contiene a $U$ y $W$, por lo tanto
  $
    U + W = gen(U union W).
  $
  - Sin $U eq gen(S)$ y $W eq gen(T) <= V$, entonces
  $
    U + W eq gen(S union T).
  $
]

#definition(title: "Suma directa")[

  Sean $U$ y $W$ subespacios de $V$. Llamamos suma directa de $U$ y $W$ a su subespacio suma si su intersección es ${0}$. Es decir
  $
    U inter W = {0} => U plus.o W
  $
]

#definition(title: "Subespacios suplementarios")[

  Se dice que $U$ y $W$ son suplementarios si
  $
    U plus.o W eq V
  $
  o para una familia arbitraria de ${U_i}_(i in I)$
  $
    plus.o.big_(i in I) U_i eq V <==> U_i inter [sum_(j eq.not i)U_j] eq 0
  $
]

#theorem()[

  Si existe $U plus.o W$, todo vector de $U + W$ se puede escribir de forma única como $u+w$ con $u in U$ y $w in W$

]
#dem[
  Sean $u,u' in U$ y $w,w' in W$ tales que $exists U plus.o W$, luego
  $
    u + w eq u' + w' => u - u'(in U) eq w - w' (in W) => \
    cases(reverse: #true, => u -u' eq w - w' in U inter W, quad quad quad quad quad quad quad W inter U = 0) => \
    => cases(u-u'=0, w-w'=0) => u - u' + w - w' = 0 => u + w = 0 => \
    => u=0=w=u'=w'
  $
]
#definition()[

  Sean $V$ y $V'$ K-espacios vectoriales. Se dice que la aplicación $f:V to V'$ es un aplicación lineal si se verifica:
  1. $
      f(u+v) eq f(u) + f(v)
    $
  2. $
      f(lambda · u) eq lambda · f(u)
    $
  Esta aplicación es también un homomorfismo de espacios vectoriales $(V arrow V')$
]

#example()[
  - Para cualquier espacio vectorial existe la identidad:$ id_V:V to V, quad id_V (v)=v, quad forall v in V $
  que es lineal.
  - Para $f,g$ aplicaciones lineales tal que que existe $g compose f$, entonces la composición es lineal.
]

#remark()[
  Para cualquier $f$ lineal, se cumple:
  - $
      f(0) = 0
    $
  - $
      f(-v) = -f(v)
    $
]

#proposition()[

  Sea $f: V to V'$ es un aplicación lineal
  1. Si $U$ es un subespacio de $V$, entonces $f(U) eq {f(u) : u in U}$ es un subespacio de $V'$. También, si $U eq gen(S)$, se cumple $f(U) eq gen(f(S))$.
  2. Si $W$ es un subespacio de $V'$, entonces $f^(-1)(W)$ es subespacio de $V$.


]

#dem()[
  1. Sabemos que $f(U) subset V'$, ya que, por lo menos, $f(0)=0$
  $
    forall f(u), f(u') in f(U), quad f(u) + f(u') eq f(u+u') in f(U), \
    forall lambda in K, forall f(u) in f(U), quad lambda f(u) eq f(lambda u) in f(U)
  $
  2. Es análogo.
]

#definition()[

  Sea $f: V to V'$ una apliación lineal.

  Se llama imagen de $f$, y se denota por $im (f)$, al subespacio $f(V)$ de $V'$, es decir,
  $
    im (f) eq.def {f(v):v in V}
  $

  Se llama núcleo o Kernel de $f$, y se denota por $ker(f)$, al subespacio $f^(-1)({0}) subset V$, es decir,
  $
    ker(f) eq.def {v in V : f(v) eq 0}
  $
]

#proposition()[

  Sea $f: V to V'$ una aplicación lineal.
  1. $f$ es inyectiva $<==> ker(f) eq 0$
  2. $f$ es sobreyectiva $<==> im (f) eq V'$
]

#dem()[
  1. "$==>$" $quad$ Si $v in ker(f)$, $f(v) eq 0$. Como es lineal, $f(0) eq 0$ y $f$ es inyectiva, se debe tener que $v eq 0$ y $ker(f) eq {0}$

  "$<==$"$quad$ Sean $u,v in V$ tales que $f(u) eq f(v)$, es decir, $f(u-v) eq 0$ o, equivalentemente, $u-v in ker(f)$, por lo que $u eq v$, y en consecuencia $f$ es inyectiva.

  2. Es trivial.
]

#definition(title: "Isomorfismo")[

  Una aplicación lineal $f: V to V'$ se dice que es un isomorfismo cuando es biyectiva. Si además $V eq V'$ se dice que es un automorfismo de $V$.
]

#idea()[
  $V$ y $V'$ son isomorfos ($V iso V'$) si existe $f: V to V'$ isomorfismo
]

#remark()[
  No tiene por qué ser:
  $
    cases(
      reverse: #true,
      V iso v',
      f : V to V' #text()[linear]
    ) arrow.double.not f #text[isomorfismo]
  $
]

#proposition()[

  $f$ isomorfismo $<==> f^(-1)$ isomorfismo
]

#definition()[

  Si $V$ es un K-espacio vectorial y $U$ un subespacio de $V$, $U$ define en $V$ la siguiente relación de equivalencia:

  Dados $v, v' in V$:
  $
    v ~ v' :<=> v - v' in U
  $
  Así:
  $
    [v] eq {v' in V : v ~ v'} eq {v' in V : v - v' in U} eq \
    eq {v' in V : [exists u in U : v' eq v + u]} eq {v + u : u in U}
  $
  Al conjunto de clases de se le denota $V slash U$
]

#example(label: <exa:cocient.set>)[
  Este concepto se puede interpretar como una laminación infinita del espacio $V$ mediante translaciones del subespacio $U$. Si consideramos el $RR$-espacio vectorial $V eq RR^2$ y el subespacio $U eq {(x,0):x in RR}$, el subespacio $U$ correspondería con el eje de abscisas en $RR^2$, luego cada una de las clases de equivalencia como se define mediante:
  $
    x ~ y : <=> x-y in U
  $
  Es decir, cada clase contiene todos los vectores que difieren de $x$ en algo que está dentro de $U$.

  - Por lo tanto, una clase de equivalencia es $U$ mismo (la del 0).

  - Las demás son translaciones de $U$ por vectores de $V$

  Luego $V$ sería laminado en todas las rectas horizontales del plano, pues para cualquier $x eq (a,b)$ e $y eq (c,d)$, para que $(a,b)-(c,d) in U$, necesariamente $b-d eq 0 => b eq d$.

  Por lo que cada $b in RR$ tal que ${(x,b) : x in RR}$ tendrá su propia clase de equivalencia que translada la recta horizontal con altura $b$.

  - $b eq 0 quad to$ el propio subespacio $U$,
  - $b eq 1 quad to$ otra recta,
  - $b eq 2 quad to$ otra,
  - $b eq pi quad to$ otra,
  - etc.


  #align(horizon)[
    #figure(
      kind: "Figura",
      supplement: [*Figura*],
      cetz.canvas({
        import cetz.draw: *
        scale(y: 75%, x: 75%)
        grid(
          (-4, -2),
          (4, 4),
          help-lines: true,
          name: "V",
        )
        set-style(mark: (symbol: ")>"))
        content((-3.5, 4.5))[
          $V eq RR^2$
        ]

        // Ejes
        line((-4, 0), (4, 0))
        line((0, -2), (0, 4))

        // Subespacio W
        stroke(academic-colors.secondary)
        line((-4, 0), (4, 0), name: "U")
        content((5.5, 0))[
          #text(fill: academic-colors.secondary)[$U => b eq 0$]
        ]
        // Cosets
        stroke(academic-colors.neutral-dark.lighten(50%))
        line((-4, 1), (4, 1))
        content((4.8, 1))[$b eq 1$]
        line((-4, 3.14), (4, 3.14))
        content((4.8, 3.14))[$b eq pi$]
        line((-4, 2), (4, 2))
        content((4.8, 2))[$b eq 2$]
        line((-4, -1.41), (4, -1.41))
        content((5.3, -1.41))[$b eq -sqrt(2)$]
      }),
      caption: [Representación gráfica de las \ clases de equivalencia de $V slash U$],
    )]


]


#proposition()[

  $V slash U$ es espacio vectorial, para todo $v + U in V slash U$, se tiene
  $
    forall v' in V, quad v' + U in V slash U quad (v+U)+(v' + U) eq v + v' +U \
    forall lambda in K, quad lambda(v + U) eq lambda v + U.
  $
]
#dem()[
  Sea
  $
    V slash U times V slash U to V slash U \
    (v+U,v' +U) ~~> v + v' + U
  $
  luego
  $
    cases(
      reverse: #true,
      v+U eq u + U,
      v' + U eq u' + U
    ) => & (v+U)+(v' + U)       & eq.quest & (u+U)+(u' + U) <=> \
     <=> & quad quad (v+v') + U & eq.quest & quad quad (u+u')+U =>
  $
  $
    =>(v+v')-(u+u') in U => (v+v')+(u+u') eq \
    eq v-u + v' - u' in U
  $
  Por lo que la suma está bien definida.

  El producto es análogo.
]

#definition()[

  La aplicación de paso al cociente
  $
    pi:V to V slash U \
    v ~~> v+U
  $
  es lineal y sobreyectiva. Entonces,
  $
    ker(pi) eq {v in V : pi(v) eq [0]} eq {v in V : v + U eq 0} eq U
  $
]

#idea[
  Retomando el @exa:cocient.set, se puede apreciar fácilmente de qué manera la ausencia de translación del subespacio $U$ es el propio subespacio, por eso este coincide con el $ker(pi)$.

  Dicho de otra manera, los únicos vectores de $V$ que difieren 0 de $U$ son los que pertenecen a $U$.
]

#proposition()[

  Sea $f:V to V'$ una aplicación lineal,
  $
    v ~_f u <=> f(v) eq f(u) <=> f(v) - f(u) eq 0 <=> f(v-u) eq 0 <=>\
    <=> v-u in ker(f) <=> v ~_(ker(f)) u
  $
  luego
  $
    V slash ~_f quad eq quad V slash ker(f)
  $
]

#idea()[
  Como dos elementos están relacionados si y solo si sus imágenes son iguales, entonces cada clase de equivalencia de $V slash ~_f$ se corresponde con los elementos de $V$ que tienen la misma imagen, es decir, con los elementos de $V$ que difieren en algo que está dentro del $ker(f)$.

  Por lo tanto, cada clase de equivalencia de $V slash ~_f$ es una translación del subespacio $ker(f)$ y, finalmente, $V slash ~_f eq V slash ker(f)$.
]

#proposition()[

  Sean los factores canónicos de la aplicación $f$:
  $
    cases(
      reverse: #true,
      f_1 #text[aplicación sobreyectiva],
      f_2 #text[aplicación biyectiva],
      f_3 #text[aplicación inyectiva]
    ) => f_3 compose f_2 compose f_1 eq f
  $
  equivalentemente,
  $
    V to^(f_1) V slash ker(f) to^(f_2) f(V) to^(f_3) V' \
    v ~~> v + ker(f) ~~> f(v) ~~> f(v)
  $
]

#remark()[
  Como ya se ha hecho en repetidas ocasiones, quedaría demostrar que $f_1,f_2$ y $f_3$ son respectivamente sobreyectivas, biyectivas e inyectivas.
]

#proposition()[

  Sean $U, W$ subespacios vectoriales de un K-espacio vectorial V tales que $U subset W$. Entonces,
  $
    (V slash U)/(W slash U) iso V slash W
  $
]

#dem()[
  Sea
  $
    V slash U & to^(f) V slash W \
        v + U & ~~> f(v + U) eq v + W
  $
  Si $v+U eq v' + U$, $quad v+W eq.quest v' + W$, veamos
  $
    v+U eq v'+U <=> v-v' in U subset W => v-v' in W => v+W eq v' + W
  $
  luego $f$ está bien definida.

  ¿Es $f$ lineal?

  Tenemos que para todo $v in U$:
  $
    v' + U in V slash U cases(
      f((v+U)+(v'+U)) eq.quest f(v+U)+f(v'+U),
      f(lambda(v+U)) eq.quest lambda f(v+U)
    )
  $
  Veámoslo para la suma:
  $
    f((v+U)+(v'+U)) eq f(v + v' + U) eq.def v+v'+W eq\
    eq (v+W)+(v'+W) eq f(v+U) + f(v'+U)
  $
  Para el producto:
  $
    f(lambda(v+U)) eq f(lambda v+U) eq lambda v + W eq lambda(u + W) eq lambda f(v+U)
  $
  Luego $f$ es lineal.

  ¿Es $f$ biyectiva?

  Para demostrarlo, veremos si es sobreyectiva y inyectiva.

  ¿Es $f$ sobreyectiva?

  Ahora para todo $v+W in V slash W$
  $
    exists v + U in V slash U : f(v+U) eq v+ W => im (f) eq V slash W
  $
  Luego sí lo es.

  ¿Es $f$ inyectiva?
  $
    ker(f) eq {v+U in V slash U : f(v + U) eq 0} eq\
    eq {v+U in V slash U : v+W eq 0} \
    eq {v+U in V slash U :v in W} eq W slash U
  $
  Luego por el primer Teorema de Isomorfía
  $
    (V slash U)/(ker(f)) eq (V slash U)/(W slash U) iso V slash W
  $
]

#idea()[
  Recordemos que el primer Teorema de Isomorfía decía que siendo $f:A to B$ isomorfismo, se cumple
  $
    A slash ker(f) iso B
  $
]

#example()[
  Sea $V = RR^3$ y consideremos los subespacios
  $
    W = {(x,y,0) : x,y in RR}, \
    U = {(x,0,0) : x in RR}.
  $

  Entonces se tiene claramente que $U subset W subset V$.

  Al cocientar $V$ por $U$, dos vectores son equivalentes si difieren en un
  vector de la forma $(x,0,0)$. Por tanto cada clase de $V slash U$ tiene un
  representante de la forma $(0,y,z)$, y las clases quedan determinadas por
  el par $(y,z)$. Así,

  $
    V slash U iso RR^2.
  $

  Consideremos ahora $W slash U$. Sus elementos son clases de vectores de $W$:
  $
    (x,y,0) + U = (0,y,0) + U.
  $

  Por lo tanto, bajo la identificación anterior,

  $
    W slash U = {(y,0) : y in RR} subset RR^2,
  $

  que corresponde al subespacio generado por el eje $y$.

  Al formar el cociente $(V slash U)/(W slash U)$, se identifican los pares $(y,z)$ que difieren en un vector de la forma $(y,0)$, por lo que las clases quedan determinadas únicamente por la coordenada $z$. En consecuencia,

  $
    (V slash U)/(W slash U) iso RR.
  $

  Por otra parte, al cocientar $V = RR^3$ por el plano $W$ (el plano $x y$),
  sólo queda la dirección del eje $z$, por lo que

  $
    V slash W iso RR.
  $

  Así se verifica en este caso que
  $
    (V slash U)/(W slash U) iso V slash W.
  $
]


#theorem(label: <theo:rel-subesp>)[

  Sean $U_1$ y $U_2$ subespacios del K-espacio vectorial $V$, se tiene
  $
    (U_1 + U_2)/(U_1) iso (U_2)/(U_1 inter U_2)
  $
]

#dem()[
  Sea la siguiente descomposición
  $
    U_2 arrow.hook_(i) U_2 + U_1 to_(pi) (U_1 +U_2)/U_1
  $
  tal que $pi compose i eq f$. Luego $f$ es lineal por ser composición de lineales.
  $
    ker(f) eq {u in U_2 : f(u) eq 0} eq {u in U_2 : u+U_1 eq 0} eq \
    eq {u in U_2 : u+U_1 eq U_1} eq {u in U_2 : u in U_1} eq U_1 inter U_2
  $
  $f$ es sobreyectiva pues
  $
    forall u_1 + u_2 + U_1 in (U_1 + U_2)/U_1, quad exists u_2 in U_2 : f(u_2) eq u_1 +u_2 +U_1
  $
  luego
  $
    f(U_2) eq u_2 + U_1, quad u_1+u_2+U_1 eq u_2 +U_1 #text[, porque] \
    u_1-u_2+u_2 eq u_1 in U_1
  $
  Por lo tanto,
  $
    im (f) eq (U_1 + U_2)/U_1
  $
  Y, finalmente, por el primer Teorema de la Isomorfía:
  $
    quot(U_2, ker(f)) iso im(f)
  $
  Sustituyendo:
  $
    (U_2)/(U_1 inter U_2) iso (U_1 + U_2)/(U_1)
  $
]

#definition()[
  Sea $V$ un K-espacio vectorial y $S subset V$. Se dice que $S$ es un conjunto de vectores linealmente independiente (L.I. de ahora en adelante) si:
  $
    sum lambda_i s_i eq 0 quad (lambda_i in K, s_i in S) => lambda_i eq 0 quad forall i in I
  $
]

#definition()[
  $S$ es linealmente independiente si existe $sum lambda_i s_i eq 0, lambda_i in K, s_i in S, lambda_i eq 0 quad forallmost #footnote()[La notación "$forallmost$" significa "para casi todo". Referido a que existe una cantidad finita de elementos que no cumplen la condición] i in I quad (#text[con algún $lambda_i eq.not 0$])$
]

#idea()[
  $S$ será linealmente dependiente si existen por lo menos dos vectores $v_1, v_2 in S$ tales que:
  $
    v_1 eq lambda v_2 quad (lambda in K)
  $
]

#example()[
  + El vector 0 es linealmente dependiente, pues $1·0 eq 0$ pero $1 eq 0$ no se cumple.
  + $0 in S => S$ linealmente dependiente.
  + Para $S eq {v}$ es L.I. $<==> v eq.not 0$
  + Sea $S eq {v_1, .. , v_n}, n>=2$, es linealmente dependiente $<==> exists v_i in S : v_i in gen(S without {v_i})$ y en tal caso se da que $gen(S) eq gen(S without {v_i})$. Por lo que $v_i$ es "redundante".
  #dem[
    4. "$==>$"
    Supongamos que $S eq {v_1,..,v_n}$ linealmente dependiente, esto significa que

    $
      => exists lambda_1 v_1 + ... + lambda_n v_n eq 0 #text[con algún] lambda_i eq.not 0
    $

    Supongamos que $lambda_j eq.not 0$ luego

    $
      exists lambda_j^(-1) in K => lambda_j^(-1)(lambda_1 v_1 + ... + lambda_n v_n) eq lambda_j^(-1)·0 eq 0 <==> \
      <==>lambda_j^(-1)lambda_1 v_1 + ... + lambda_j^(-1) lambda_n v_n eq 0 <==> \
      <==> v_j eq -(lambda_j^(-1)lambda_1 v_1 + ... + lambda_j^(-1) lambda_n v_n) => v_j in gen(S without {v_j})
    $

    "$<==$"

    Veamos que $v_j eq sum^n_(i eq 1)_(i eq.not j) lambda_i v_i => v_j - lambda_1 v_1 - lambda_(j-1) v_(j-1) - lambda_(j+1) v_(j+1) - lambda_n v_n eq 0$

    Luego $S$ es linealmente dependiente.
  ]
]

#proposition()[
  Sean $S_1 subset V$, $S_2 subset V$ tales que $S_1 subset S_2$ y $V$ es un K-espacio vectorial. Entonces
  + Si $S_1$ es linealmente dependiente $==> S_2$ es linealmente dependiente.
  + Si $S_2$ es L.I. $==> S_1$ es L.I..
]

#example()[
  +
    Si $S eq {(1,2,0),(0,0,1),(3,5,4)} subset RR^3$. Para verificar la dependencia lineal:
    $
      lambda (1,2,0)+ mu (0,0,1) + xi (3,5,4) eq (0,0,0)
    $
    Por lo que si $exists lambda, mu, xi in RR without {0} ==> S$ es linealmente dependiente.
  +
    El conjunto $S eq {v_1, v_2,v_3}$ es L.I..

    ¿Es ${v_1+v_2+v_3,v_1-v_3,v_2-2v_3}$ L.I.?
    $
      lambda(v_1+v_2+v_3) + mu(v_1-v_3) + xi(v_2-2v_3) eq 0 then \
      then lambda v_1 + lambda v_2 + lambda v_3 + mu v_1 - mu v_3 + xi v_2 - 2 xi v_3 eq 0 then \
      then lambda v_1 + mu v_1 + lambda v_2 + xi v_2 + lambda v_3 - mu v_3 -2 xi v_3 eq 0
    $
    luego
    $
      (lambda + mu)v_1 + (lambda + xi)v_2 + (lambda-mu-2xi)v_3 eq 0 ==> cases(
        lambda + mu eq 0,
        lambda + xi eq 0,
        lambda - mu- 2xi eq 0.
      )
    $
    Resolviendo
    $
      mu eq - lambda, quad xi eq - lambda
    $
    Sustituyendo en la tercera:
    $
      lambda - (- lambda) -2(- lambda) eq 0 then \
      lambda + lambda + 2 lambda eq 4 lambda eq 0 then lambda eq 0 then mu eq xi eq 0
    $
    Por lo que la única solución posible es
    $
      lambda eq mu eq xi eq 0
    $
    y es L.I..

  +
    En $RR[X]$, ${1}$ es L.I. y ${1,2}$ no lo es.
]

#definition()[
  Sea $V$ un K-espacio vectorial y $S subset V$. Diremos que $S$ es una base de $V$ si y solo si:
  - $S$ es L.I.,
  - $gen(S) eq V$.
  Generalmente, se denotará por $base$.
]

#proposition()[
  $
    base eq {v_1, ..., v_n} #text[es base de ] V <=> \
    forall v in V, quad exists ! lambda_1,...,lambda_n in K : quad v eq lambda_1 v_1 + ... + lambda_n v_n
  $
]

#idea()[
  Esto quiere decir que para cada elemento de $V$, solo existe una única forma de ser representado por combinaciones lineales de la base.
]

#dem[
  "$==>$"

  _Existencia_

  Supongamos que $base$ base de $V$, luego $gen(base) eq V$ y
  $
    cases(
      reverse: #true, v in V,
      gen(base) eq V
    ) then exists quad cases(reverse: #true, lambda_1"," ..."," lambda_n in K, v_1","...","v_n in base) : v eq sum_(i eq 1)^n lambda_i v_i
  $
  _Unicidad_

  Si existe $v eq sum_(i eq 1)^n lambda_i v_i eq sum_(i eq 1)^n mu_i v_i$ se tiene
  $
    sum_(i eq 1)^n lambda_i v_i - sum_(i eq 1)^n mu_i v_i eq 0 then (lambda_1 - mu_1)v_1 +...+ (lambda_n - mu_n)v_n eq 0
  $
  Pero como $base$ es linealmente independiente
  $
    lambda_1 - mu_1 eq ... eq lambda_n - mu_n eq 0 then lambda_i eq mu_i quad forall i in I
  $
  "$<==$"

  Supongamos que $forall v in V$
  $
    exists ! lambda_1,...,lambda_n in K : sum_(i eq 1)^n lambda_i v_i, quad v_i in base
  $
  Por definición $V subset gen(base)$. También es claro que $gen(base) subset V$, pues $base subset V$ y $V$ es un K-espacio vectorial. Por lo tanto $gen(base) eq V$.

  Como la combinación lineal de elementos de $base$ igual a 0 es única, $base$ es L.I., y por lo tanto es base de $V$.
]

#example[
  La proposición sobre la unicidad en la base se aprecia fácilmente en $RR^3$ sobre la base canónica, es decir $base eq {e_1,e_2,e_3} eq {(1,0,0),(0,1,0),(0,0,1)}$.

  Esta es base pues para todo elemento $v eq (x,y,z)$ de $RR^3$ se puede expresar de forma única mediante la combinación lineal de los elemento de $base$:
  $
    (x,y,z) eq sum_(i=1)^3 lambda_i e_i eq lambda_1 (1,0,0) + lambda_2 (0,1,0) + lambda_3(0,0,1)
  $
  En concreto con $lambda_1 eq x$, $lambda_2 eq y$ e $lambda_3 eq z$.

  Además, $base$ es L.I. pues $(1,0,0) eq.not k_1(0,1,0)$, $(1,0,0) eq.not k_2(0,0,1)$ y $(0,1,0) eq.not k_3(0,0,1)$.

  Si $base$ no fuese L.I., por ejemplo
  $
    base_1 eq {(1,0,0),(0,1,0),(0,0,1),(2,0,3)}
  $
  que es linealmente dependiente porque $(2,0,3) eq 2(1,0,0) + 3(0,0,1)$. Aquí se cumple que $gen(base_1) eq RR^3$ pero existen elemento que se pueden expresar de más de una manera, por ejemplo $(4,3,8) in RR^3$:
  $
    4(1,0,0) + 3(0,1,0) + 8(0,0,1) + 0(3,0,3) eq (4,3,8) \
    0(1,0,0)+3(0,1,0)+2(0,0,1)+2(2,0,3) eq (4,3,8)
  $
  Por lo que no se cumple la unicidad.

  De ser L.I. pero no generar el espacio vectorial, habría elementos de $V$ que no se podrían expresar como combinación lineal de elementos del conjunto, por lo que no sería base.
]

#proposition()[
  Son equivalentes
  + $S$ es una base de $V$,
  + $S$ es un conjunto minimal de generadores,
  + $S$ es un conjunto maximal de vectores L.I.s.
]

#dem[
  $"1." ==> "2."$

  Sabemos que $gen(S) eq V$, si existe $gen(T) eq V$ tal que $T subset S$ ¿$T eq S$?

  Suponiendo que $T eq.not S then exists v in S : v in.not T$, por lo que
  $
    cases(reverse: #true, T subset S without {v}, gen(T) eq V) then gen(S without {v}) eq V
  $
  Pero $S$ es L.I., por lo que se da una contradicción.

  $"2." ==> "1."$

  Sabiendo que $S$ es conjunto minimal de generadores de $V$, ¿es $S$ L.I.?

  Suponiendo que no lo es, $exists v in S : v in {S without {v}}$, luego
  $
    V eq gen(S) eq gen(S without {v})
  $
  Lo que se contradice con que $S$ es minimal.

  $"1." ==> "3."$

  Sea $T$ L.I. tal que $S subset T$ ¿$T eq S$?

  Si $S subset.neq T then exists v in T : v in.not S$:
  $
    cases(reverse: #true, S union {v} subset T, T "L.I.") then S union {u} "L.I."
  $
  Pero esto contradice que $gen(S) eq V$, luego $T$ es linealmente dependiente.

  $"3." ==> "1."$

  Si $exists v in V : v in.not gen(S) then gen(S without {v}) eq gen(S)$, pero $S union {v}$ sería L.I., lo que contradice que $S$ sea maximal de L.I.s.

  El resto de implicaciones se deducen de las anteriores.
]

#corollary()[
  Si $base, base'$ son bases y $base subset base'$ luego se tiene $base eq base'$
]

#v(7pt)

#theorem(label: <theo:bases>)[
  #footnote[Este teorema requiere asumir el Axioma de elección] Sea $V$ un K-espacio vectorial tal que $T,L subset V$ con $T$ L.I. y $gen(L) eq V$, luego
  $
    exists L_0 subset L : T union L_0 "es base de " V
  $
]

#idea()[
  Recordemos que el Axioma de elección dice que si ${A_i}_(i in I)$ es una familia de conjuntos no vacíos disjuntos dos a dos, entonces existe un conjunto $B subset union.big_(i in I) A_i$ tal que $B inter A_i$ tiene exactamente un elemento para cada $i in I$ (es decir, se puede elegir un elemento de cada $A_i$). Alternativamente, si ${A_i}_(i in I)$ es una familia de conjuntos no vacíos, entonces $product_(i in I) A_i eq.not emptyset$.
] <axioma-eleccion>

Es equivalente el enunciado del Lema de Zorn.

#idea()[
  Recordemos que el Lema de Zorn dice que si $A$ es un conjunto ordenado no vacío en el que cada cadena tiene una cota superior, entonces $A$ tiene algún elemento maximal.
] <lema-zorn>

#dem()[
  Queremos buscar un conjunto L.I. que contenga a $T$ y este formado por vectores de $L$, para ello usaremos el lema de Zorn.

  Consideremos
  $
    sum eq {L' subset L: T union L' "es L.I."}
  $
  ordenado por inclusión $(sum, subset)$. Se cumple que $emptyset in sum$ porque $T$ es L.I., luego $sum eq.not emptyset$.

  Sea
  $
    {L'_(alpha)}_(alpha in Lambda)
  $
  una cadena en $sum$.

  Definimos
  $
    L"*" eq union.big_(alpha in Lambda) L'_(alpha in Lambda)
  $
  Claramente $L"*" subset L$, ahora queremos probar que $T union L"*"$ es linealmente independiente.

  Por reducción al absurdo, supongamos que no es L.I., entonces existe un subconjunto finito
  $
    T"*" subset T, quad L"*"_(f i n) subset L"*"
  $
  tal que
  $
    T"*" union L"*"_(f i n)
  $
  es linealmente dependiente. Pero $L"*"_(f i n)$ es finito y
  $
    L"*" eq union.big_(alpha) L'_(alpha)
  $
  por lo que existe un $beta$ tal que
  $
    L"*"_(f i n) subset L'_(beta)
  $
  (porque la familia es una cadena). Entonces
  $
    T"*" union L"*"_(f i n) subset T union L'_(beta)
  $
  luego
  $
    T union L'_(beta)
  $
  es linealmente dependiente.

  Pero $L'_(beta) in sum$, así que debe ser linealmente independiente. Contradicción.

  Así que $L"*"$ es cota superior de la cadena.

  Como toda cadena tiene cota superior, por el lema de Zorn implica que existe
  $
    L_0 in sum
  $
  maximal, es decir que $T union L_0$ es L.I. y no se puede añadir ningún vector de $L$.

  ¿$gen(T union L_0) eq V$?

  Supongamos por reducción al absurdo que $T union L_0$ no genera a $V$, como $gen(L) eq V$, existe $v in L$ tal que $v in.not gen(T union L_0)$. Entonces
  $
    T union L_0 union {v}
  $
  sigue siendo linealmente independiente. Pero esto significa que
  $
    L_0 union {v} in sum
  $
  y
  $
    L_0 subset.neq L_0 union {v}
  $
  lo que contradice la maximalidad de $L_0$. Por lo tanto
  $
    gen(T union L_0) eq V
  $
  luego es base de $V$.
]

#example[
  Sea $V eq RR^3$, tomemos
  $
    T eq {(2,0,0)}
  $
  que es un conjunto linealmente independiente.

  Ahora tomemos un $L$ que sea base de $V$ (la canónica):
  $
    L eq {(1,0,0),(0,1,0),(0,0,1)}
  $
  Claramente,
  $
    gen(L) eq RR^3 eq V
  $

  El @theo:bases afirma que existe $L_0 subset L$ tal que $T union L_0$ es base de $V$.

  Ya tenemos $T eq {(2,0,0)}$ y para formar una base de $RR^3$ necesitamos 3 vectores linealmente independientes, luego podemos añadir, por dos vectores de $L$:
  $
    L_0 eq {(0,1,0),(0,0,1)}
  $
  Entonces
  $
    T union L_0 eq {(2,0,0), (0,1,0), ((0,0,1))}
  $
  que genera $V$ y es L.I. luego es base de $V$.
]

#idea()[
  En otras palabras, el @theo:bases dice que si tienes algunos vectores independientes, siempre puedes completarlos hasta una base usando vectores de cualquier conjunto generador.
]

#corollary()[
  Todo espacio vectorial tiene una base.
]

#dem[
  Tomando $T eq emptyset$ que es linealmente independiente y $L eq V$ tal que $gen(L) eq V$. Por el @theo:bases existe $L_0 subset V$ tal que
  $
    T union L_0 eq L_0
  $
  es una base de $V$.
]

#corollary()[
  Si $V$ tiene un conjunto de generadores finito, $V$ tiene una base finita
]

#corollary()[
  Si $U$ es un subespacio de $V$, toda base de $U$ puede completarse a una base de $V$.
]
#dem[
  Sea $base$ base de $U$, entonces $base$ es linealmente independiente.

  Sea $gen(L) eq V$, luego
  $
    exists L_0 subset L : base union L_0 "es base de " V
  $
]

#definition()[
  Una operación elemental en el K-espacio vectorial $V$ es cualquiera de las siguientes transformaciones:
  + $v_i arrow.l.r v_j quad (i eq.not j)$
  + $v_i |-> lambda v_i, quad (lambda in K without {0})$
  + $v_i arrow.l.r v_i + beta v_j quad (beta in K$, $i eq.not j)$
]

#theorem()[
  Si $S'$ es un conjunto obtenido haciendo un número finito de operaciones elementales sobre $S subset V$, se verifica
  $
    gen(S) eq gen(S')
  $
]

#dem[
  Tenemos que demostrar que aplicando una operación elemental a un conjunto no cambia el subespacio generado, luego no lo hará si se aplica repetidamente.

  1.

  Para la operación intercambio de vectores
  $
    v_i arrow.r.l v_j quad (i eq.not j)
  $
  solo se reordenan los vectores del conjunto, por tanto el conjunto de combinaciones lineales posibles no cambia:
  $
    gen(S) eq gen(S')
  $

  2.

  Para la multiplicación por un escalar no nulo
  $
    v_i |-> lambda v_i quad (lambda eq.not 0)
  $
  Sea
  $
    S' eq (S without {v_i}) union {lambda v_i}
  $
  Veamos que son iguales.

  $gen(S') subset gen(S)$

  Como $lambda v_i$ es una combinación lineal de $v_i in gen(S)$, entonces $lambda v_i in gen(S)$.

  Luego todo vector generado por $S'$ está en $gen(S)$.

  $gen(S) subset gen(S')$

  Como $lambda eq.not 0$,
  $
    v_i eq 1/lambda (lambda v_i)
  $
  Por lo tanto $v_i in gen(S')$ y cualquier combinación lineal de $S$ pertenece a $gen(S')$.

  Finalmente $gen(S) eq gen(S')$.

  3.

  Para la suma de un múltiplo de otro vector:
  $
    v_i |-> v_i + beta v_j quad (i eq.not j)
  $
  Sea
  $
    S' eq (S without {v_i}) union {v_i + beta v_j}
  $
  Veamos que son iguales.

  $gen(S') subset gen(S)$

  Se cumple porque $v_i + beta v_j$ es una combinación lineal de vectores de $S$.

  $gen(S) subset gen(S')$

  Podemos observar  que $v_i eq (v_i + beta v_j) - beta v_j$, como los vectores del lado derecho pertenecen a $gen(S')$, se tiene
  $
    v_i in gen(S')
  $
  Por lo que cualquier combinación lineal de $S$ pertenece a $gen(S')$.

  Finalmente, $gen(S) eq gen(S')$.

  En conclusión, como cada operación elemental conserva el subespacio generado, si $S'$ se obtiene aplicando un número finito de estas operaciones, entonces en cada paso el subespacio generado se mantendrá igual, por lo que en general, se tendrá:
  $
    gen(S) eq gen(S')
  $
]

#definition(title: "Pivote")[
  Sea $K^n in.rev v eq (alpha_1, ..., alpha_n) eq.not 0$. Un pivote de $V$ es un $alpha_i : alpha_i eq.not 0$ y $alpha_j eq 0 quad forall j <i$
]

#definition(title: "Escalonado")[
  El conjunto de vectores ${v_1,...,v_m} subset K^n$ está escalonado si se cumple lo siguiente:
  + Los vectores nulos están al final.
  + El pivote de cada vector está a la derecha del pivote de los vectores precedentes.

  Todo conjunto de vectores escalonados no nulos es linealmente independiente
]

#example[
  Implementemos el método de escalonado.

  Tenemos $S eq {(2,3,4,1),(1,1,1,1),(2,3,5,0),(1,0,1,0),(1,0,3,5)}$ y queremos obtener una base del conjunto $S$. Luego:
  $
    mat(
      delim: #none,
      #text(fill: academic-colors.error)[(F_1)], 2, 3, 4, 1 #al(<start-1>), quad;
      #text(fill: academic-colors.error)[(F_2)], 1, 1, 1, 1;
      #text(fill: academic-colors.error)[(F_3)], 2, 3, 5, 0;
      #text(fill: academic-colors.error)[(F_4)], 1, 0, 1, 0 #al(<start-2>), quad;
      #text(fill: academic-colors.error)[(F_5)], 1, 0, 3, 5
    )
    #h(2cm)
    mat(
      delim: #none,
      #al(<end-2>)1, 0, 1, 0;
      1, 1, 1, 1;
      2, 3, 5, 0;
      #al(<end-1>) 2, 3, 4, 1;
      1, 0, 3, 5
    )
    #h(.5cm)
    mat(
      delim: #none,
      #text(fill: academic-colors.error)[$->$], #text(fill: academic-colors.error)[$F_1$], #text(fill: academic-colors.error)[$->$] ;
      #text(fill: academic-colors.error)[$->$], #text(fill: academic-colors.error)[$F_2 -1 F_1$], #text(fill: academic-colors.error)[$->$] ;
      #text(fill: academic-colors.error)[$->$], #text(fill: academic-colors.error)[$F_3 - 2 F_1$], #text(fill: academic-colors.error)[$->$] ;
      #text(fill: academic-colors.error)[$->$], #text(fill: academic-colors.error)[$F_4 - 2 F_1$], #text(fill: academic-colors.error)[$->$] ;
      #text(fill: academic-colors.error)[$->$], #text(fill: academic-colors.error)[$F_5 - 1 F_1$], #text(fill: academic-colors.error)[$->$]
    )
    #h(.5cm)
    mat(
      delim: #none,
      1, 0, 1, 0, #text(fill: academic-colors.error)[$->$] ;
      0, 1, 0, 1, #text(fill: academic-colors.error)[$->$] ;
      0, 3, 3, 0, #text(fill: academic-colors.error)[$->$] ;
      0, 3, 2, 1, #text(fill: academic-colors.error)[$->$] ;
      0, 0, 2, 5, #text(fill: academic-colors.error)[$->$]
    ) \
    mat(
      delim: #none,
      #text(fill: academic-colors.error)[$F_1$], #text(fill: academic-colors.error)[$->$] ;
      #text(fill: academic-colors.error)[$F_2$], #text(fill: academic-colors.error)[$->$] ;
      #text(fill: academic-colors.error)[$F_3 - 3 F_2$], #text(fill: academic-colors.error)[$->$] ;
      #text(fill: academic-colors.error)[$F_4 - 3 F_2$], #text(fill: academic-colors.error)[$->$] ;
      #text(fill: academic-colors.error)[$F_5$], #text(fill: academic-colors.error)[$->$]
    )
    #h(.5cm)
    mat(
      delim: #none,
      1, 0, 1, 0;
      0, 1, 0, 1;
      0, 0, 3, -3;
      0, 0, 2, -2;
      0, 0, 2, 5
    )
    #h(.5cm)
    mat(
      delim: #none,
      #text(fill: academic-colors.error)[$->$], #text(fill: academic-colors.error)[$F_1$], #text(fill: academic-colors.error)[$->$] ;
      #text(fill: academic-colors.error)[$->$], #text(fill: academic-colors.error)[$F_2$], #text(fill: academic-colors.error)[$->$] ;
      #text(fill: academic-colors.error)[$->$], #text(fill: academic-colors.error)[$F_3 div 3$], #text(fill: academic-colors.error)[$->$] ;
      #text(fill: academic-colors.error)[$->$], #text(fill: academic-colors.error)[$F_4$], #text(fill: academic-colors.error)[$->$] ;
      #text(fill: academic-colors.error)[$->$], #text(fill: academic-colors.error)[$F_5$], #text(fill: academic-colors.error)[$->$]
    )
    #h(.5cm)
    mat(
      delim: #none,
      1, 0, 1, 0, #text(fill: academic-colors.error)[$->$] ;
      0, 1, 0, 1, #text(fill: academic-colors.error)[$->$] ;
      0, 0, 1, -1, #text(fill: academic-colors.error)[$->$] ;
      0, 0, 2, -2, #text(fill: academic-colors.error)[$->$] ;
      0, 0, 2, 5, #text(fill: academic-colors.error)[$->$]
    ) \
    mat(
      delim: #none,
      #text(fill: academic-colors.error)[$F_1$], #text(fill: academic-colors.error)[$->$] ;
      #text(fill: academic-colors.error)[$F_2$], #text(fill: academic-colors.error)[$->$] ;
      #text(fill: academic-colors.error)[$F_3$], #text(fill: academic-colors.error)[$->$] ;
      #text(fill: academic-colors.error)[$F_4 - 2 F_3$], #text(fill: academic-colors.error)[$->$] ;
      #text(fill: academic-colors.error)[$F_5 - 2 F_3$], #text(fill: academic-colors.error)[$->$]
    )
    #h(.5cm)
    mat(
      delim: #none,
      1, 0, 1, 0;
      0, 1, 0, 1;
      0, 0, 1, -1;
      0, 0, 0, 0 #al(<start-3>), quad;
      0, 0, 0, 3 #al(<start-4>)
    )
    #h(2cm)
    mat(
      delim: #none,
      1, 0, 1, 0;
      0, 1, 0, 1;
      0, 0, 1, -1;
      #al(<end-4>) 0, 0, 0, 3, quad;
      #al(<end-3>) #text(fill: academic-colors.neutral-dark.lighten(50%))[0], #text(fill: academic-colors.neutral-dark.lighten(50%))[0], #text(fill: academic-colors.neutral-dark.lighten(50%))[0], #text(fill: academic-colors.neutral-dark.lighten(50%))[0]
    )
  $

  Por lo que la base obtenida es $gen(S') eq {(1,0,1,0), (0,1,0,1), (0,0,1,-1), (0,0,0,3)}$

  #label-arrow(
    <start-1>,
    <end-1>,
    stroke: academic-colors.error,
    from-offset: (3pt, 3pt),
    tip: "straight",
    to-offset: (0pt, 3pt),
  )

  #label-arrow(
    <start-2>,
    <end-2>,
    stroke: academic-colors.error,
    from-offset: (3pt, 3pt),
    tip: "straight",
    to-offset: (0pt, 3pt),
  )
  #label-arrow(
    <start-3>,
    <end-3>,
    stroke: academic-colors.error,
    from-offset: (3pt, 3pt),
    tip: "straight",
    to-offset: (0pt, 3pt),
  )

  #label-arrow(
    <start-4>,
    <end-4>,
    stroke: academic-colors.error,
    from-offset: (3pt, 3pt),
    tip: "straight",
    to-offset: (0pt, 3pt),
  )

  #place(right, dx: -95pt, dy: -80.5pt)[
    #figure(
      cetz.canvas({
        import cetz.draw: *
        set-style(stroke: (paint: academic-colors.error, thickness: 1pt))
        line((0, 0), (2, 0), stroke: (dash: "dashed"))
      }),
    )
  ]
]

#idea()[
  Para la facilitación en la aplicación de este método, es recomendable colocar los números más sencillos de operar arriba (como los 1). También resulta mejor evitar las fracciones.
]

#example[
  Queremos una base a partir de $T eq {(1,2,3,4),(0,1,0,0)}$ para generar $RR^4$, luego buscamos $4$ vectores linealmente independientes.
  $
    mat(
      delim: #none,
      1, 2, 3, 4;
      0, 1, 0, 0;
      quad, quad, quad, quad;
      quad, quad, quad, quad;
      quad, quad, quad, quad
    )
    #h(2cm)
    mat(
      delim: #none,
      1, 2, 3, 4;
      0, 1, 0, 0;
      0, 0, 1, 0;
      0, 0, 0, 1;
      quad, quad, quad, quad
    )
  $
  Por lo que hemos completado con la canónica, que al estar escalonada, es L.I. y $gen(T^(+)) eq RR^4$
]

#theorem(title: "Teorema de Steinitz")[
  Sea $V$ un K-espacio vectorial, ${u_1, ..., u_n}$ un conjunto linealmente independiente y sea $base eq {v_i}_(i in I)$ una base de $V$.

  Entonces existen índices $i_1,...,i_n in I$ tales que
  $
    (base without {v_(i_1), ..., v_(i_n)} union {u_i,...,u_n})
  $
  es una base de $V$.
]


#dem[
  Para la demostración de este teorema, procederemos por inducción sobre $n$ (indices de los vectores de $V$). Por lo tanto:
  - Para el caso $n eq 1$:

  Sea $base eq {v_i}_(i in I)$ una base de $V$. Como $base$ genera $V$, se tiene
  $
    u_1 eq sumi lambda_i v_i
  $<eq:def-elm-b1>

  tal que $u_1 eq.not 0$ (porque el conjunto es independiente). Por esto, existe $i_1 in I$ tal que $lambda_(i_1) eq.not 0$. Entonces
  $
    v_(i_1) eq lambda_(i_1)^(-1) u_1 - sum_(i in I without {i_1}) lambda_(i_1)^(-1) lambda_i v_i
  $
  Por lo que definimos
  $
    I_1 eq I without {i_1}
  $
  y
  $
    base_1 eq {u_1} union {v_i}_(i in I_1)
  $
  ¿$gen(base_1) eq V$?

  De la igualdad anterior se deduce que $v_(i_1) in gen(base_1)$ y como los demás $v_i$ pertenecen a $base_1$
  $
    base subset gen(base_1)
  $
  Dado que $base$ genera $V$,
  $
    gen(base_1) eq V
  $

  ¿Es $base_1$ linealmente independiente?

  Supongamos que
  $
    mu u_1 + sum_(i in I_1) mu_i v_i eq 0
  $
  Sustituyendo por @eq:def-elm-b1 obtenemos

  $
    mu sumi lambda_i v_i + sum_(i in I_1) mu_i v_i eq 0
  $
  Extrayendo y separando el término $i_1$:
  $
    mu lambda_(i_1) v_(i_1) + sum_(i in I_1) (mu lambda_i + mu_i)v_i eq 0
  $
  Lo que es una combinación lineal de vectores de la base $base$. Como $base$ es linealmente independiente,
  $
    mu lambda_(i_1) eq 0
  $
  y
  $
    mu lambda_i + mu_i eq 0 quad (i in I_1)
  $
  Como $lambda_i eq.not 0$, se deduce
  $
    mu eq 0
  $
  y entonces
  $
    mu_i eq 0
  $
  Por lo que $base_1$ es linealmente idependiente.

  Concluyendo así que $base_1$ es base de $V$.

  - Paso inductivo

  Supongamos que el resultado es cierto para $n-1$ ($n>=2$).

  Sea ${u_1, ..., u_n}$ un conjunto linealmente independiente.

  Por el caso anterior, existe $i_(1) in I$ tal que
  $
    base_(1) eq (base without {v_(i_(1))}) union {u_(1)}
  $
  es una base de $V$.

  Aplicando la hipotesis de inducción sobre el conjunto independiente ${u_2, ...,u_n}$ y a la base $base_1$, existen índices $i_2,...,i_n$ tales que
  $
    (base_1 without {v_(i_2),...,v_(i_n)}) union {u_1,...,u_n}
  $
  es una base de $V$.

  Sustituyendo $base_1$ obtenemos
  $
    (base without {v_(i_1),...,v_(i_n)}) union {u_1,...,u_n}
  $
  que es base de $V$.
]

#example[
  Tomemos la base canónica en $RR^3$
  $
    v_1 eq (1,0,0), quad v_2 eq (0,1,0), quad v_3 eq (0,0,1)
  $
  Supongamos ahora que queremos obtener una nueva base de $RR^3$ tal que contenga $u_1 eq (1,1,0)$.

  Por el teorema de Steinitz podemos sustituir por algún $v_n$, en este caso por $v_1$ o $v_2$ (porque en concreto $u_1 eq v_1 + v_2$). Luego al sustituir por $v_1$
  $
    {(1,1,0),(0,1,0),(0,0,1)}
  $
  Sigue siendo base.

  Ahora podemos introducir otro vector independiente
  $
    u_2 eq (0,1,1)
  $
  De la misma manera, podemos sustituir por otro vector de la base, como $v_2$, luego
  $
    {(1,1,0),(0,1,1),(0,0,1)}
  $
  que sigue siendo base.
]

#idea()[
  Necesariamente, cada uno de los nuevos vectores $u_n$ pertenece al espacio generado por la base original, por lo tanto depende de los vectores de la base. Por lo que se podrán eliminar esos nuevos vectores dependientes de la base.
]

#corollary()[
  Sea $V$ un K-espacio vectorial con $base$ y $base'$ bases de $V$, entonces $base$ y $base'$ son equipotentes, es decir,
  $
    |base| eq |base'|
  $
]

#dem[
  Sean $base eq {u_1,...,u_n}$ y $base ' eq {v_i}_(i in I)$ bases de $V$.
  Por ser $base$ base:
  $
    cases(
      reverse: #true, base "es L.I.",
      base eq {u_1,...,u_n},
      base' "base de "V
    ) "por el teorema de Steinitz" then \
    then base eq {u_1,...,u_n} union {v_i}_(i in I_n), quad (I_n eq I - {i_1,...,i_n})
  $
  es base de $V$. Luego
  $
    {v_i}_(i in I_n) subset base then I_n "finito" then I "finito" then base "es base finita."
  $
  ¿$n eq |base| eq |base'| ?$

  Supongamos que $n eq |base|$ y $m eq |base'|$, por Steinitz:
  $
    cases(
      reverse: #true, base "L.I.",
      base' "es base"
    ) then n <= m
  $
  y
  $
    cases(
      reverse: #true, base' "L.I.",
      base "es base"
    ) then m <= n
  $

  Por lo que $m eq n$
]

#remark[
  Siendo $base$ una base de $V$,
  $
    |base| eq dim(V)
  $
]

#theorem(label: <theo:base-app-lin>)[

  Sean $V$ y $V'$ K-espacios vectoriales tales que $base eq {u_i}_(i in I)$ es base de $V$ y $S eq {v_i}_(i in I) subset V'$. Entonces existe una única aplicación lineal
  $
    f:V to V' "tal que " f(u_i) eq v_i
  $
  Además:
  + $f$ es inyectiva $<=> S$ es linealmente independiente,
  + $f$ es sobreyectiva $<=> gen(S) eq V'$,
  + $f$ es isomorfismo $<=> S$ es base de $V'$.
]

#idea()[

  Una base determina completamente una aplicación lineal. Como $forall v in V$
  $
    v eq sumi lambda_i u_i
  $
  Necesariamente
  $
    f(v) eq sumi lambda_i f(u_i)
  $
]

#dem[
  Demostremos primero la existencia de $f$.
  Sea $v in V$

  Como $base eq {u_i}_(i in I)$ es base,
  $
    v eq sumi lambda_i u_i
  $
  con $lambda_i eq 0, quad forallmost i in I$. Así definimos
  $
    f(v) eq.def sumi lambda_i v_i
  $

  ¿Es $f$ lineal?
  Sean $v,w in V$, tales que
  $
    v eq sumi lambda_i u_i, quad w eq sumi mu_i u_i.
  $
  Luego
  $
    v + w eq sumi (lambda_i + mu_i) u_i then f(v+w) eq sumi(lambda_i + mu_i) v_i,
  $
  además
  $
    f(u)+f(w) eq sumi lambda_i v_i + sumi mu_i v_i eq sumi (lambda_i + mu_i) v_i,
  $
  por lo que
  $
    f(v+w) eq f(v)+f(w).
  $
  Análogamente
  $
    f(lambda v) eq lambda f(v) quad (forall lambda in K).
  $
  Luego $f$ es lineal.

  ¿Es $f$ única? Supongamos que existe $g: V to V'$ lineal con $g(u_i) eq v_i$.

  Sea
  $
    v eq sumi lambda_i u_i.
  $
  Entonces
  $
    g(v) eq g(sumi lambda_i u_i) eq sumi lambda_i g(u_i) eq sumi lambda_i v_i eq f(v).
  $
  Luego $f eq g$.
]
#dem[

  Veamos ahora la equivalencia 1.
  "$==>$"
  Supongamos que $f$ es inyectiva, luego si
  $
    sumi lambda_i v_i eq 0
  $
  entonces
  $
    sumi lambda_i f(u_i) eq 0 then f(sumi lambda_i u_i) eq 0 then sumi lambda_i u_i in ker(f).
  $
  Por ser $f$ inyectiva
  $
    ker(f) eq {0}
  $
  luego
  $
    sumi lambda_i u_i eq 0
  $
  pero como $base$ es base,
  $
    lambda_i eq 0
  $
  Por lo que $S$ es linealmente independiente.

  "$<==$"

  Supongamos que $S$ es linealmente independiente, si $f(v) eq 0$ y $v eq sumi lambda_i u_i$, entonces
  $
    0 eq f(v) eq sumi lambda_i v_i
  $
  Como $S$ es L.I., se tiene $lambda_i eq 0$ y por tanto $v eq 0$.

  Luego
  $
    ker(f) eq {0}
  $
  y $f$ es inyectiva.
]

#dem[

  Sigamos con la equivalencia 2.

  "$==>$"

  Si $f$ es sobreyectiva, para todo $y in V'$ existe $v in V$ tal que
  $
    f(v) eq y
  $
  Pero
  $
    v eq sumi lambda_i u_i
  $
  entonces
  $
    y eq f(v) eq sumi lambda_i v_i
  $
  Luego $y$ está en el subespacio generado por $S$, por lo que
  $
    gen(S) eq V'
  $

  "$<==$"

  Supongamos que
  $
    gen(S) eq V'
  $
  Sea $y in V'$. Entonces
  $
    y eq sumi lambda_i v_i
  $
  Tomemos
  $
    v eq sumi lambda_i u_i
  $
  Luego
  $
    f(v) eq sumi lambda_i v_i eq y
  $
  Por lo que $f$ es sobreyectiva
]

#dem[

  Sabemos que
  $
    f "isomorfismo" <==> f "inyectiva y sobreyectiva"
  $
  Por las equivalencias 1. y 2. esto ocurre cuando $S$ es linealmente idependiente y $gen(S) eq V'$
]

#example[

  Tomemos $V eq V' eq RR^2$ y consideremos la base canónica para $V$.

  Definimos $f:V to V'$ lineal tal que $f(x,y) eq (x,x+y)$, así
  $
    (1,0) ~~> f(1,0) eq (1,1) \
    (0,1) ~~> f(0,1) eq (0,1)
  $
  Cualquier vector $(x,y) in RR^2$ se escribe como
  $
    (x,y) eq x(1,0) + y(0,1)
  $
  luego
  $
    f(x,y) eq f(x(1,0) + y(0,1)) then \
    then f(x,y) eq x f(1,0) + y f(0,1) then \
    then f(x,y) eq x(1,1) + y(0,1)
  $
  Por lo que se determina completamente la aplicación.

  Al ser $f$ inyectiva, $S eq {(1,1),(0,1)}$ es linealmente independiente.

  Si hubiesemos considerado $f'(x,y) eq (1, x+y)$ que no es inyectiva, se tendría $S' eq {(1,1),(1,1)}$ que es linealmente dependiente.

  Por otro lado, como $f$ es sobreyectiva, $gen((1,1)","(0,1)) eq V' eq RR^2$, pero si volvemos a considerar $f'$, esto tampoco se cumpliría por no ser esta sobreyectiva.
]

#corollary()[

  Sea $f:V to V'$, se tiene que
  $
    V iso V' <==> dim(V) eq dim(V')
  $
]
#dem[

  "$==>$"

  Supongamos que existe $f: V to V'$ isomorfismo.

  Sea
  $
    base eq {u_i}_(i in I)
  $
  base de $V$, luego
  $
    base' eq {f(u_i)}_(i in I)
  $
  también base de $V'$, por lo que se tiene
  $
    |base|eq|base'| then dim(V) eq dim(V')
  $

  "$<==$"

  Sea $base eq {u_i}_(i in I)$ base de $V$ y $base' eq {v_i}_(i in I)$ base de $V'$.

  Sea $f:V to V'$, por el @theo:base-app-lin es isomorfismo.
]

#example[

  Consideremos $f: RR_2 [X] to RR^3$ tal que $RR_2 [X] iso RR^3$ con
  $
    a_0 + a_1 X + a_2 X^2 ~~> (a_0,a_1,a_2)
  $
  podemos pasar de base en base por ser isomorfismo
  $
    1 to e_1 \
    X to e_2 \
    X^2 to e_3
  $
  luego
  $
    dim(RR_2 [X]) eq dim(RR^3)
  $
]

#theorem()[

  Sea $f: V to V'$ una aplicación lineal, luego
  $
    dim(ker(f)) + dim(im(f)) eq dim(V)
  $
]

#dem[
  Sea
  $
    base eq {u_i}_(i in I)
  $
  base de
  $ker(f)$ y
  $
    base' eq {u_alpha}_(alpha in Lambda)
  $
  base de $im(f)$.

  Como $u_alpha in im(f)$, sabemos que existe $w_alpha in V$ tal que $f(w_alpha) eq w_alpha$.

  Así, consideramos el conjunto
  $
    {u_i}_(i in I) union {w_alpha}_(alpha in Lambda)
  $
  el cual queremos probar que es base de $V$.

  ¿Es linealmente independiente?

  Supongamos que
  $
    sumi lambda_i u_i + sum_(alpha in Lambda) mu_alpha w_alpha eq 0
  $
  Si aplicamos $f$:
  $
    0 eq f( sumi lambda_i u_i + sum_(alpha in Lambda) mu_alpha w_alpha) eq
  $
  por linearidad
  $
    eq sumi lambda_i f(u_i) + sum_(alpha in Lambda) mu_alpha f(w_alpha)
  $
  pero $f(u_i) eq 0$ por pertenecer al kernel, entonces
  $
    0 eq sum_(alpha in Lambda) mu_alpha u_alpha
  $
  Como ${u_alpha}$ es base de la imagen de $f$, es linealmente independiente. Luego se tiene que $mu_alpha eq 0, quad forall alpha in Lambda$, así
  $
    sumi lambda_i u_i eq 0
  $
  pero como ${u_i}$ es base del kernel de $f$, entonces $lambda_i eq 0, quad forall i in I$.

  Por lo tanto es un conjunto linealmente independiente.

  ¿Genera $V$?

  Sea $v in V$, luego $f(v) in im(f)$. Como ${u_alpha}$ es base de la imagen de $f$:
  $
    f(v) eq sum_(alpha in Lambda) lambda_alpha u_alpha
  $
  pero $u_alpha eq f(w_alpha)$, por lo que
  $
    f(v) eq sum_(alpha in Lambda) lambda_alpha f(w_alpha) eq f(sum_(alpha in Lambda) lambda_alpha w_alpha)
  $
  Luego
  $
    f(v - sum_(alpha in Lambda) lambda_alpha w_alpha) eq 0 then \
    then v - sum_(alpha in Lambda) lambda_alpha w_alpha in ker(f)
  $
  Como ${u_i}$ es base del kernel,
  $
    v - sum_(alpha in Lambda) lambda_alpha w_alpha eq sumi mu_i u_i then \
    then v eq sum_(alpha in Lambda) lambda_alpha w_alpha + sumi mu_i u_i
  $
  Entonces
  $
    gen({u_i}_(i in I) union {w_alpha}_(alpha in Lambda)) eq V
  $
  Así, concluimos que
  $
    dim(V) eq |I| + |Lambda|
  $
  tales que
  $
    |I| eq dim(ker(f)), quad |Lambda| eq dim(im(f))
  $
  Por lo que
  $
    dim(ker(f))+dim(im(f)) eq dim(V)
  $
]

#idea()[
  Podemos interpretar el $ker(f)$ como los vectores que se anulan tras la aplicación, luego son las dimensiones perdidas.

  Asimismo, podemos interpretar la $im(f)$ como las dimensiones que se mantienen tras la aplicación.

  El teorema nos dice que
  $
    dim(ker(f)) + dim(im(f)) eq dim(V)
  $
  que bajo esta interpretación:
  $
    "dim. perdida" + "dim. mantenida" eq "dim. total"
  $

]

#example[
  Definamos la aplicación lineal
  $
    f: RR^3 to RR^2 \
    f(x,y,z) = (x,y)
  $
  Que proyecta todos los puntos sobre el plano $x y$.

  Tenemos que
  $
    dim(V) eq 3
  $

  El kernel de la aplicación  son los vectores que se envían al 0, es decir $f(x,y,z) eq (0,0)$, luego $x eq 0$, $y eq 0$. Por lo tanto son de la forma
  $
    (0,0,z)
  $
  Así
  $
    ker(f) eq {(0,0,z):z in RR}
  $
  Una base es ${(0,0,1)}$, luego
  $
    dim(ker(f)) eq 1
  $

  La imagen de la aplicación son todos los valores resultantes de
  $
    f(x,y,z) eq (x,y),
  $
  que puede obtener cualquier vector de $RR^2$.

  Luego
  $
    im(f) eq RR^2 then dim(im(f)) eq 2
  $
  El teorema dice
  $
    dim(ker(f))+dim(im(f)) eq dim(V)
  $
  En este caso
  $
    1+2 eq 3
  $
  Luego se verifica perfectamente.
]

#corollary()[

  Si $U$ es un subespacio de $V$, se verifica:
  $
    dim(U) + dim(quot(V, U)) eq dim(V)
  $
]

#dem[
  Sea $pi:V to quot(V, U)$ una aplicación lineal.

  Sabemos que
  $
    ker(pi) eq U quad "y" quad im(pi) eq quot(V, U)
  $
  Luego
  $
    dim(U) + dim(quot(V, U)) eq dim(V)
  $
]

#corollary(label: <eq:rel-dim-subesp-esp>)[

  Sea $U$ un subespacio de $V$, se verifican:
  + $dim(U) <= dim(V)$
  + $dim(U) eq dim(V) <==> U eq V$
]

#dem[
  1.
  Sabemos que
  $
    dim(U) + dim(quot(V, U)) eq dim(V)
  $
  y
  $
    dim(quot(V, U)) >= 0
  $
  Luego
  $
    dim(U)<= dim(V)
  $
  2.
  Directamente
  $
    dim(U) eq dim(V) then dim(quot(V, U)) eq 0 then \
    then quot(V, U) eq {0} then V eq U
  $
]

#theorem(title: "Formula de Grassman", label: <theo:formula-grassman>)[

  Sean $U_1$, $U_2$ subespacios vectoriales de $V$. Se tiene que:
  $
    dim(U_1) + dim(U_2) eq dim(U_1 + U_2) + dim(U_1 inter U_2)
  $<eq:formula-grassman>
]

#dem[

  Por el @theo:rel-subesp, sabemos que
  $
    (U_1 + U_2)/(U_1) iso (U_2)/(U_1 inter U_2)
  $
  luego
  $
    dim((U_1 + U_2)/(U_1)) eq dim((U_2)/(U_1 inter U_2))
  $
  por 2. del @eq:rel-dim-subesp-esp
  $
    dim(U_1) + dim((U_1 + U_2)/(U_1)) eq dim(U_1 + U_2) then \
    dim((U_1 + U_2)/(U_1)) eq dim(U_1 + U_2) - dim(U_1)
  $
  y
  $
    dim(U_1 inter U_2) + dim((U_2)/(U_1 inter U_2)) eq dim(U_2) then \
    dim((U_2)/(U_1 inter U_2)) eq dim(U_2) - dim(U_1 inter U_2)
  $
  así
  $
    dim((U_1 + U_2)/(U_1)) eq dim((U_2)/(U_1 inter U_2)) then \
    then dim(U_1 + U_2) - dim(U_1) eq dim(U_2) - dim(U_1 inter U_2) then \
    then dim(U_2) + dim(U_1) eq dim(U_1 + U_2) + dim(U_1 inter U_2)
  $
]

#proposition()[

  Sea $V$ un K-espacio vectorial tal que $dim(V) eq n$ y $base eq {u_1,...,u_n}$ es base de $V$.

  Entonces todo vector $v in V$ se escribe de forma única como
  $
    v eq sum_(i eq 1)^(n) lambda_i u_i
  $
  con $lambda_i in K$.
  Definimos la aplicación
  $
    chi_base:V to K^n \
    chi_base (v) eq (lambda_1,...,lambda_n)
  $
  Entonces $chi_base$ es un isomorfismo
]

#idea()[
  La aplicación $chi_base$ está convirtiendo los vectores de $V$ en sus coordenadas.
]

#dem[
  Veamos que $chi_base$ es un isomorfismo.

  ¿Es lineal?

  Sean $v,w in V$ tales que
  $
    v eq sumi lambda_i u_i, quad w eq sumi mu_i u_i
  $
  entonces
  $
    chi_base (v+w) eq (lambda_1 + mu_1,...,lambda_n + mu_n) eq chi_base (v) + chi_base (w)
  $

  Luego es lineal.

  ¿Es inyectiva?

  Sí, porque

  $
    chi_base (v) eq 0
  $
  significa
  $
    (lambda_1,...,lambda_n) eq (0,...,0)
  $
  luego $v eq 0$.

  ¿Es sobreyectiva?

  También, porque todo vector
  $
    (lambda_1,...,lambda_n) in K^n
  $
  corresponde con el vector definido como
  $
    sumi lambda_i u_i
  $
]

#example[
  Sea $V eq RR^2$ con base $base eq {(1,1),(1,-1)}$. Tomemos
  $
    v eq (3,1)
  $
  Expresado en función de la base
  $
    v eq lambda_1 (1,1) + lambda_2 (1,-1)
  $
  Luego
  $
    (3,1) eq (lambda_1 + lambda_2, lambda_1 - lambda_2) then \
    then cases(lambda_1 + lambda_2 eq 3, lambda_1 - lambda_2 eq 1)
  $
  Resolviendo
  $
    lambda_1 eq 2, quad lambda_2 eq 1
  $
  Entonces
  $
    chi_base (v) eq (2,1)
  $
]
