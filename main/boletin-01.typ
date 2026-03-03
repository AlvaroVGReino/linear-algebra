#import "/metadata.typ": *
#import "/enviroments.typ": *
#import "@preview/clean-cnam-template:1.6.2": *


#pagebreak()

= Boletín 1

#theorem(
  title: "Styled Theorem",
  title-style: (fill: orange.darken(20%)),
  body-style: (fill: luma(60)),
)[
  \
  For any right triangle with sides $a$, $b$, and hypotenuse $c$:
  $ a^2 + b^2 = c^2 $
  #dem()[sss]
]


#exercise()[
  Sean $V=RR$ y $*$ la operación definida en $RR$ por $a*b = a^2b$. Con la suma usual y la multiplicación por escalares dada por $*$, ¿es $V$ un espacio vectorial sobre $RR$?
  #solution()[
    #text(1cm)[Por completar]


  ]
]





#exercise()[
  Sea $V eq.not {0}$ un espacio vectorial sobre $RR$. Para cada $v$ de $V$ y cada número complejo $a+b i$, definimos $(a+b i)·v = b v$. Con esta nueva multiplicación por escalares, ¿es $V$ un espacio vectorial sobre $CC$?


  #solution()[
    #text(1cm)[Por completar]
  ]
]




#exercise()[
  Dá un ejemplo de espacio vectorial con 4 elementos.

  #solution()[
    #text(1cm)[Por completar]
  ]

]




