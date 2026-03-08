#import "@preview/great-theorems:0.1.2": *
#import "@preview/rich-counters:0.2.1": *
#import "@preview/hei-synd-report:0.1.1": *
#import "@preview/clean-cnam-template:1.6.2": *

#set heading(numbering: "1.1")
#set enum(numbering: "I.")
#show: great-theorems-init

#import "@preview/great-theorems:0.1.0": *

#set text(lang: "es")

#let academic-colors = (
  primary: rgb("#1a3c6e"), // Azul académico profundo
  secondary: rgb("#4f6fa8"), // Azul medio suave
  secondary-light: rgb("#d2def2"), // Azul  suave
  accent: rgb("#c98200"), // Dorado/ámbar para resaltar
  neutral-light: rgb("#f4f4f4"), // Fondo claro neutro
  neutral: rgb("#cccccc"), // Gris medio
  neutral-dark: rgb("#333333"), // Texto oscuro
  success: rgb("#2b7a0b"), // Verde académico
  warning: rgb("#b8860b"), // Dorado más intenso
  error: rgb("#8b0000"), // Rojo oscuro sobrio
)
#let qed(sym: sym.square) = block(align(bottom + right)[#scale(x: 150%, y: 150%)[#sym]])

#let gen(a) = $chevron.l #a chevron.r$

#let im = "Im"

#let ker = "Ker"

#let Ctl(sym: sym.corner.t.l) = block(align(top + left)[#scale(x: 150%, y: 150%)[#sym]])

#let Cbr(sym: sym.corner.b.r) = block(align()[#scale(x: 150%, y: 150%)[#sym]])

#let q(qed) = align(right + bottom)[#qed()]

#let quot(a, b) = $#a slash #b$

#let iso = $tilde.equiv$

#let to = $-->$

#let then = $=>$

#let dim = "dim"

#let base = $cal(B)$

#show link: text.with(fill: blue)

#let dem = mathblock(
  blocktitle: "Demostración",
  prefix: align(top + left)[#text(fill: academic-colors.neutral-dark.lighten(50%))[#Ctl()] *Demostración.*],
  bodyfmt: body => align(left)[#body],
  inset: 5pt,
  suffix: [#align(right + bottom)[#qed()#text(fill: academic-colors.neutral-dark.lighten(50%))[#Cbr()]]],
  radius: 5pt,
)

#let solution = mathblock(
  blocktitle: "Solución",
  prefix: align(top + left)[#text(fill: academic-colors.accent.lighten(50%))[#Ctl()] *Solución.*],
  inset: 10pt,
  bodyfmt: body => align(left)[#text(fill: academic-colors.neutral-dark.lighten(10%))[#body]],
  suffix: align(right + bottom)[#qed()#text(fill: academic-colors.accent.lighten(50%))[#Cbr()]],
  radius: 5pt,
)


#let remark = mathblock(
  blocktitle: "Observación",
  prefix: align(top + left)[#text(fill: academic-colors.neutral-dark.lighten(50%))[#Ctl()] *Observación.*],
  titlix: title => align(left)[#title],
  bodyfmt: body => align(left)[#body],
  inset: 5pt,
  suffix: align(right + bottom)[#text(fill: academic-colors.neutral-dark.lighten(50%))[#Cbr()]],
  radius: 5pt,
)

#let exercise = mathblock(
  blocktitle: "Ejercicio",
  prefix: align(left)[*Ejercicio.*],
  inset: 5pt,
  stroke: academic-colors.accent.darken(20%),
  bodyfmt: body => align(left)[#body],
  radius: 5pt,
)

#let example = mathblock(
  blocktitle: "Ejemplo",
  prefix: align(left)[*Ejemplo.*],
  inset: 10pt,
  stroke: academic-colors.accent.darken(20%),
  bodyfmt: body => align(left)[#body],
  radius: 5pt,
)
