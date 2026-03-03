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

#let c(body) = block($chevron.l #body chevron.r$)

#let Im(body) = block(text()[Im(#body)])

#let Ker(body) = block(text()[Ker(#body)])

#let q(qed) = align(right + bottom)[#qed()]

#show link: text.with(fill: blue)

#let dem = mathblock(
  blocktitle: "Demostración",
  prefix: [_Demostración._],
  inset: 5pt,
  suffix: [#align(right + bottom)[#qed()]],
  radius: 5pt,
)

#let solution = mathblock(
  blocktitle: "Solución",
  prefix: [_Solución._],
  inset: 5pt,
  suffix: [#align(right + bottom)[#qed()]],
  radius: 5pt,
)


#let remark = mathblock(
  blocktitle: "Observación",
  prefix: align(left)[_*Observación.*_],
  titlix: title => align(left)[#title],
  bodyfmt: body => align(left)[#body],
  inset: 5pt,
  radius: 5pt,
)
