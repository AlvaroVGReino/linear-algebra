#import "/metadata.typ": *
#import "@preview/clean-cnam-template:1.6.2": *
#import "/enviroments.typ": *

#set footnote(numbering: "*")


#pagebreak()

= Espacios Vectoriales
#definition(title: "Espacio Vectorial")[
  Se dice que un conjunto $V eq.not emptyset$ es un espacio vectorial sobre un cuerpo $(K,+,·)$ o que es un K-espacio vectorial si:

  1. En $V$ esta definida una operación interna aditiva denotada por $"+"$ de modo que $(V,+)$ es un grupo abeliano.
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

#ideabox()[
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
  Trivialmente, si $U$ es un espacio o un subestacio vectorial, siempre se va a tener:
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

#ideabox()[
  Si $V$ es espacio vectorial sobre $K$ y $A$ es un conjunto:
  $
    V^A eq {f:A -> V : f #text()[es aplicación]}
  $
]

#ideabox()[
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
    lambda · (0,b,c) + mu · (0,b',c') eq (0,lambda b, lambda c) + (0, mu b', mu c') eq (0,lambda b + mu b',lambda c + mu c')
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


Sean ${U_i}_(i in I)$ una familia de subespacios de $V$, entonces
$
  forall i in I, quad inter.big_(i in I)U_i quad #text()[es un subespacio]
$
pero
$
  union.big_(i in I)U_i quad #text()[no tiene porque ser un subespacio]
$

#definition(title: "Subespacio generado")[
  Sea $S subset V$, se llama subespacio generado por $S$ o $chevron.l S chevron.r$ al menor subespacio de $V$ que contiene a $S$
  $
    chevron.l S chevron.r eq inter.big {U_i : U_i #text()[es subespacio de] V and S subset V}
  $
  Si $chevron.l S chevron.r eq U$, luego $S$ es el conjunto de generadores de $U$.

  Cuando $S eq emptyset$, $chevron.l S chevron.r eq {0}$
]

Sean $V_1,V_2,...,V_n$ K-espacios vectoriales, entonces $V_1 times V_2 times ... times V_n$ es un K-espacio vectorial y puede operar de la siguiente manera:

Dados $(v_1,v_2,...,v_n),(v'_1,v'_2, ... ,v'_n) in V_1 times V_2 times ... times V_n$
$
  (v_1,v_2,...,v_n)+(v'_1,v'_2, ... ,v'_n) eq (v_1 + v'_1,v_2 + v'_2, ... ,v_n + v'_n) in V_1 times V_2 times ... times V_n \
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
      S subset #c[$S'$],
      quad and,
      S' subset #c[$S$]
    )
  $
  Particularmente , si $S subset V$ y $v,w in V$, $w in S$, se verifica
  $
    #c[$S$] eq #c[$S union {w}$] <==> v in S
  $
  idem
  $
    #c[$S$] eq #c[$S without {w}$] <==> w in #c[$S without {w}$]
  $
  generalmete, $0 in S$, así
  $
    #c[$S$] eq #c[$S without {0}$].
  $
  - Si $U, W <= V$, $quad W + U$ es el menor subespacio de $V$ que contiene a $U$ y $W$, por lo tanto
  $
    U + W = #c[$U union W$].
  $
  - Sin $U eq #c[$S$]$ y $W eq #c[$T$] <= V$, entonces
  $
    U + W eq #c[$S union T$].
  $
]

#definition(title: "Suma directa")[
  Sean $U$ y $W$ subespacios de $V$. Llamamos suma directa de $U$ y $W$ a su subespacio suma si su intersección es ${0}$. Es decir
  $
    U inter W = 0 => U plus.o W
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
  Sean $V$ y $V'$ K-espacios vectoriales. Se dice que la aplicación $f:V -> V'$ es un aaplicación lineal si se verifica:
  1. $
      f(u+v) eq f(u) + f(v)
    $
  2. $
      f(lambda · u) eq lambda · f(u)
    $
  Esta aplicación es también un homomorfismo de espacios vectoriales $(V arrow V')$
]

#example()[
  - Para cualquier espacio vectorial existe la identidad:$ id_V:V ->V', quad id_V (v)=v, quad forall v in V $
  que es lineal.
  - Para $f,g$ aplicaciones lineales talque que existe $g compose f$, entonces la composición es lineal.
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
  Sea $f: V -> V'$ es un aplicación lineal
  1. Si $U$ es un subespacio de $V$, entonces $f(U) eq {f(u) : u in U}$ es un subespacio de $V'$. Tambien, si $U eq #c[$S$]$, se cumple $f(U) eq #c[$f(S)$]$.
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
  Sea $f: V ->V'$ una apliación lineal.

  Se llama imagen de $f$, y se denota por $#Im[f]$, al subespacio $f(V)$ de $V'$, es decir,
  $
    #Im[f] eq.def {f(v):v in V}
  $

  Se llama núcleo o Kernel de $f$, y se denota por $#Ker[f]$, al subespacio $f^(-1)({0}) subset V$, es decir,
  $
    #Ker[f] eq.def {v in V : f(v) eq 0}
  $
]

#proposition()[
  Sea $f: V -> V'$ una aplicación lineal.
  1. $f$ es inyectiva $<==> #Ker[f] eq 0$
  2. $f$ es sobreyectiva $<==> #Im[f] eq V'$
]

#dem()[
  1. "$==>$" $quad$ Si $v in #Ker[f]$, $f(v) eq 0$. Como es lineal, $f(0) eq 0$ y $f$ es inyectiva, se debe tener que $v eq 0$ y $#Ker[f] eq {0}$

  "$<==$"$quad$ Sean $u,v in V$ tales que $f(u) eq f(v)$, es decir, $f(u-v) eq 0$ o, equivalentemente, $u-v in #Ker[f]$, por lo que $u eq v$, y en consecuencia $f$ es inyectiva.

  2. Es trivial.
]

#definition(title: "Isomorfismo")[
  Una aplicación lineal $f: V --> V'$ se dice que es un isomorfismo cuando es biyectiva. Si además $V eq V'$ se dice que es un automorfismo de $V$.
]

#ideabox()[
  $V$ y $V'$ son isomorfos ($V tilde.equiv V'$) si existe $f: V -> V'$ isomorfismo
]

#remark()[
  No tiene por qué ser:
  $
    cases(
      reverse: #true,
      V tilde.equiv v',
      f : V --> V' #text()[linear]
    ) arrow.double.not f #text[isomorfismo]
  $
]

#proposition()[
  $f$ isomorfismo $<==> f^(-1)$ isomorfismo
]

#definition()[
  Si $V$ es un k-espacio vectorial y $U$ un subespacio de $V$, $U$ define en $V$ la siguiente relación de equivalencia:

  Dados $v, v' in V$:
  $
    v ~ v' :<=> v - v' in U
  $
  Así:
  $
    [v] eq {v' in V : v ~ v'} eq {v' in V : v - v' in U} eq \
    eq {v' in V : [exists u in U : v' eq v + u]} eq {v + u : u in U}
  $
  Al conjunto de clases de se le denota $U slash V$
]

#proposition()[
  $V slash U$ es espacio vectorial.
  $
    forall v + U, quad v' + U in V slash U quad (v+U)+(v' + U) eq v + v' +U \
    forall lambda in K, lambda(v + U) eq lambda v + U.
  $


]
#dem()[
  Sea
  $
    V slash U times V slash U --> V slash U \
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
    =>(v+v')-(u+u') in U => (v+v')+(u+u') eq v-u + v' - u' in U
  $
  Por lo que la suma esta bien definida.

  El producto es análogo.
]

#definition()[
  La aplicación de paso al cociente
  $
    pi:V -->V slash U \
    v ~~> v+U
  $
  es lineal y sobreyectiva. Entonces,
  $
    #Ker[$pi$] eq {v in V : pi(v) eq [0]} eq {v in V : v + U eq 0} eq U
  $
]

#proposition()[
  Sea $f:V --> V'$ una aplicación lineal,
  $
    v ~_f u <=> f(v) eq f(u) <=> f(v) - f(u) eq 0 <=> f(v-u) eq 0 <=>\
    <=> v-u in #Ker[f] <=> v ~_(#Ker[f]) u
  $
  luego
  $
    V slash ~_f quad eq quad V slash #Ker[f]
  $
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
    V -->^(f_1) V slash #Ker[f] -->^(f_2) f(V) -->^(f_3) V' \
    v ~~> v + #Ker[f] ~~> f(v) ~~> f(v)
  $
]

#todobox()[
  Como ya se ha heho en repetidas ocasiones, quedaría demostrar que $f_1,f_2$ y $f_3$ son respectivamente sobreyectivas, biyectivas e inyectivas.
]

#proposition()[
  Sean $U, W$ subespacios vectoriales de un K-espacio vectorial V tales que $U subset W$. Entonces,
  $
    (V slash U)/(W slash U) tilde.equiv V slash W
  $


]

#dem()[
  Sea
  $
    V slash U & -->^(f) V slash W \
        v + U & ~~> f(v + U) eq v + W
  $
  Si $v+U eq v' + U$, $quad v+W eq.quest v' + W$, veamos
  $
    v+U eq v'+U <=> v-v' in U subset W => v-v' in W => v+W eq v' + W
  $
  luego $f$ esta bien definida.

  ¿Es $f$ lineal?
  $
    forall v in U, quad v' + U in V slash U cases(
      f((v+U)+(v'+U)) eq.quest f(v+U)+f(v'+U),
      f(lambda(v+U)) eq.quest lambda f(v+U)
    )
  $
  Veamoslo para la suma:
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
  $
    forall v+W in V slash W, quad exists v + U in V slash U : f(v+U) eq v+ W => #Im[f] eq V slash W
  $
  Luego sí lo es.

  ¿Es $f$ inyectiva?
  $
    #Ker[f] eq {v+U in V slash U : f(v + U) eq 0} eq {v+U in V slash U : v+W eq 0} \
    eq {v+U in V slash U :v in W} eq W slash U
  $
  Luego por el primer Teorema de Isomorfía
  $
    (V slash U)/(#Ker[f]) eq (V slash U)/(W slash U) tilde.equiv V slash W
  $
]
#ideabox()[
  Recordemos que el primer Teorema de Isomorfía decía que siendo $f:A --> B$ isomorfismo, se cumple
  $
    A slash #Ker[f] tilde.equiv B
  $
]

#theorem()[
  Sean $U_1$ y $U_2$ subespacios del K-espacio vectorial $V$, se tiene
  $
    (U_1 + U_2)/(U_1) tilde.equiv (U_2)/(U_1 inter U_2)
  $


]

#dem()[
  Sea la siguiente descomposición
  $
    U_2 arrow.hook_(i) U_2 + U_1 -->_(pi) (U_1 +U_2)/U_1
  $
  tal que $pi compose i eq f$. Luego $f$ es lineal por ser composiciónde lineales.
  $
    #Ker[f] eq {u in U_2 : f(u) eq 0} eq {u in U_2 : u+U_1 eq 0} eq \
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
    #Im[f] eq (U_1 + U_2)/U_1
  $
  Y, finalmente, por el primer Teorema de la Isomorfía:
  $
    (U_1 + U_2)/(U_1) tilde.equiv (U_2)/(U_1 inter U_2)
  $
]

#definition()[
  Sea $V$ un K-espacio vectorial y $S subset V$. Se dice que $S$ es un conjunto de vectores linealmente independiente si:
  $
    sum lambda_i s_i eq 0 quad (lambda_i in K, s_i in S) => lambda_i eq 0 quad forall i in I
  $
]

#definition()[
  $S$ es linealmente independiente si existe $sum lambda_i s_i eq 0, lambda_i in K, s_i in S, lambda_i eq 0 quad forall forall #footnote()[La notación "$forall forall$" significa "para casi todo". Referido a que existe una cantidad finita de elementos que no cumplen la condición] i in I quad (#text[con algún $lambda_i eq.not 0$])$
]

#example()[
  + El vector 0 es linealmente dependiente, pues $1·0 eq 0$ pero $1 eq 0$ no se cumple.
  + $0 in S => S$ linealmente dependiente.
  + Para $S eq {v}$ es linealmente independiente $<==> v eq.not 0$
  + Sea $S eq {v_1, .. , v_n}, n>=2$, es linealmente dependiente $<==> exists v_i in S : v_i in #c[$S without {v_i}$]$ y en tal caso se da que $#c[$S$] eq #c[$S without {v_i}$]$. Por lo que $v_i$ es "redundante".
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
      <==> v_j eq -(lambda_j^(-1)lambda_1 v_1 + ... + lambda_j^(-1) lambda_n v_n) => v_j in #c[$S without {v_j}$]
    $

    "$<==$"

    Veamos que $v_j eq sum^n_(i eq 1)_(i eq.not j) lambda_i v_i => v_j - lambda_1 v_1 - lambda_(j-1) v_(j-1) - lambda_(j+1) v_(j+1) - lambda_n v_n eq 0$

    Luego $S$ es linealmente dependiente.
  ]
]

#proposition()[
  Sean $S_1 subset V$, $S_2 subset V$ tales que $S_1 subset S_2$ y $V$ es un K-espacio vectorial. Entonces
  + Si $S_1$ es linealmente dependiente $==> S_2$ es linealmente dependiente.
  + Si $S_2$ es linealmente independiente $==> S_1$ es linealmente independiente.
]

#example()[
  +
    Si $S eq {(1,2,0),(0,0,1),(3,5,4)} subset RR^3$. Para verificar la dependencia lineal:
    $
      lambda (1,2,0)+ mu (0,0,1) + xi (3,5,4) eq (0,0,0)
    $
    Por lo que si $exists lambda, mu, xi in RR without {0} ==> S$ es linealmente dependiente.
  +
    El conjunto $S eq {v_1, v_2,v_3}$ es linealmente independiente.

    ¿Es ${v_1+v_2+v_3,v_1-v_3,v_2-2v_3}$ linealmente independiente?
    $
      lambda(v_1+v_2+v_3) + mu(v_1-v_3) + xi(v_2-2v_3) eq 0
    $
    Luego es linealmente independiente $<==> lambda eq mu eq xi eq 0$

    luego
    $
      (lambda + mu)v_1 + (lambda + xi)v_3 + (lambda-mu-2xi)v_3 eq 0 ==> cases(
        lambda + mu eq 0,
        lambda + xi eq 0,
        lambda - mu- 2xi eq 0
      )
    $
  +
    En $RR[X]$, ${1}$ es linealmente independiente y ${1,2}$ no lo es.
]


