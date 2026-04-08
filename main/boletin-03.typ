#import "../metadata.typ": *
#import "../enviroments.typ": *

#import "../temp/math.typ": *
#import "../temp/text.typ": *
#import "../temp/constants.typ": *

#set text(font: "New Computer Modern")



#pagebreak()

= Boletín 3

#exercise()[
  Estudia cuales de las siguientes aplicaciones $f:RR^3 to RR^3$ son lineales:
  $
    & #text[(a) ] f(x,y,z) eq (x,1,z),             &   #text[(b) ] f(x,y,z) eq (y,z,0), \
    & #text[(c) ] f(x,y,z) eq (2x,y,3y), quad quad & #text[(d) ] f(x,y,z) eq (x-1,x,y).
  $
  #solution()[
    (a) Recordemos que para ser lineal, la función debe cumplir que $f(0) eq 0$, pero en este caso $f(0,0,0) eq (0,1,0) eq.not (0,0,0)$ por lo que no es lineal.

    (b) Esta función cumple que $f(0) eq 0$, veamos si $f(u + v) eq f(u) + f(v)$.
    $
      f(u+v) eq f((x,y,z)+(x',y',z')) eq f(x+x',y+y',z+z') eq \
      eq (y+y',z+z',0) eq (y,z,0)+(y',z',0) eq f(x,y,z)+f(x',y',z') eq \
      eq f(u) + f(v)
    $
    Para el producto por escalares, $f(lambda u) eq lambda f(u)$:
    $
      f(lambda u) eq f(lambda (x,y,z)) eq lambda (y,z,0) eq lambda f(x,y,z)
    $
    Luego es lineal.

    (c) Como cumple que $f(0) eq 0$, veamos las condiciones de linearidad:
    $
      f(u+v) eq f(x+x',y+y',z+z')) eq (2(x+x'),y+y',3(y+y')) eq \
      eq (2x,y,3y)+(2x',y',3y') eq f(u)+f(v)\
      f(lambda u) eq f(lambda (x,y,z)) eq lambda (2x,y,3y) eq lambda f(x,y,z)
    $
    Por lo que es lineal.

    (d) Esta función no cumple que $f(0) eq 0$ pues
    $
      f(0,0,0) eq (0-1,0,0) eq (-1,0,0) eq.not (0,0,0)
    $
    Por lo que no es lineal.
  ]
]

#exercise()[
  Estudia si la aplicación $f:RR^3 to RR^3$ definifa por $f(x,y,z) eq (0,x-y,y)$ es lineal y en caso afirmativo estudia $ker (f)$ y $im (f)$.

  #solution()[

  ]
]

#exercise()[
  Sea $f: RR_3[X] to RR_3[X]$ tal que $f(p(X)) eq p'(X)$ (polinomio derivado). a) Prueba que $f$ es lineal. b) Calcula $f^(-1)(6X^2-5X+4)$. c) Calcula $ker (f)$ e $im (f)$.
  #solution()[

  ]
]

#exercise()[
  Sea $V$ un espacio vectorial sobre un cuerpo $K$ y $f$ un endomorfismo de $V$. Prueba que $W eq {v in V : f(v) eq v}$ es un subespacio vectorial de $V$.
  #solution()[

  ]
]

#exercise()[
  Sea $f: RR^3 to RR^3$ la aplicación lineal definida por $f(1,0,0) eq (2,1,0)$, $f(0,1,0) eq (1,0,0)$ y $f(0,0,1) eq (3,1,0)$. Calcula ker (f) y im (f). Estudia si $f$ es inyectiva o sobreyectiva.
  #solution()[

  ]
]

#exercise()[
  En $RR_2[X]$ se considera el subespacio $U eq {a+b X^2 : a,b in RR}$.
  + Encuentra $S,S' subset U$ tales que $S eq.not S'$ y $gen(S) eq gen(S') eq U$.
  + Prueba que $gen(2x + U) eq RR_2[X] slash U$.
  #solution[

  ]
]

#exercise()[
  Sea $U eq {(x,y,z) in RR^3 : x+y-z eq 0}$. Razona si, en $RR^3 slash U$, las siguientes afirmaciones son verdaderas o falsas:
  + $(1,2,3) + U eq (0,2,2) + U eq U$.
  + Existe un único $alpha in RR$ tal que $(1,0,2) + U eq alpha((1,1,1) + U)$.

  #solution()[


  ]
]

#exercise()[
  Considera el $RR$-espacio vectorial $V eq RR_5[X]$ y el subespacio $U eq RR_2[X]$. ¿Qué significa, para los polinomios $p(X) eq sum_(i eq 0)^5 alpha_i X^i$ y $q(X) eq sum_(i eq 0)^5 b_i X^i$, que $p(X) + U eq q(X) + U$?

  #solution[

  ]
]
