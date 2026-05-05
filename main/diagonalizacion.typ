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



