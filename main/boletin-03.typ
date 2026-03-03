#import "/metadata.typ": *
#import "/enviroments.typ": *
#import "@preview/clean-cnam-template:1.6.2": *


#pagebreak()

= Boletín 3

#exercise()[
  Estudia cuales de las siguientes aplicaciones $f:RR^3 -> RR^3$ son lineales:
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
  Estudia si la aplicación $f:RR^3 -> RR^3$ definifa por $f(x,y,z) eq (0,x-y,y)$ es lineal y en caso afirmativo estudia $#Ker[f]$ y $#Im[f]$.

  #solution()[

  ]
]
