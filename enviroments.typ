#import "@preview/great-theorems:0.1.2": *
#import "@preview/rich-counters:0.2.1": *
#import "@preview/hei-synd-report:0.1.1": *
#import "@preview/cetz:0.4.2"
#import "@preview/larrow:1.0.1": *
#import "@preview/wrap-it:0.1.1": wrap-content
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/pavemat:0.2.0": pavemat


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

#let hom = "Hom"

#let ran = "Rango"

#let sig = "sig"

#let Ctl(sym: sym.corner.t.l) = block(align(top + left)[#scale(x: 150%, y: 150%)[#sym]])

#let Cbr(sym: sym.corner.b.r) = block(align()[#scale(x: 150%, y: 150%)[#sym]])

#let q(qed) = align(right + bottom)[#qed()]

#let quot(a, b) = $#a slash #b$

#let iso = $tilde.equiv$

#let end = "End"

#let to = $-->$

#let then = $=>$

#let dim = "dim"

#let base = $cal(B)$

#let basec = $cal(C)$

#let lik = $cal(L)_K$

#let dual(a) = $hat(#a)$

#let bidual(a) = $hat(hat(#a))$

#let forallmost = $forall"*"$

#let sumi = $sum_(i in I)$

#let sumim = $sum_(i eq 1)^m$

#let sumin = $sum_(i eq 1)^n$

#let sumjn = $sum_(j eq 1)^n$

#let fd = $dual(f)$

#let vd = $dual(V)$

#let bd = $dual(base)$




//Por arreglar

#let intsup(a, b, f) = {
  $integral_(#a)^(#b) #f #place(right, dx: -31pt, dy: -4pt)[
    #figure(kind: "Figura", supplement: [*Figura*], cetz.canvas({
      import cetz.draw: *
      set-style(mark: (end: ">"))
      set-style(stroke: (thickness: 1pt))
      line((0, 0), (0.025, 0.1))
    }))
  ]$
}

#show link: text.with(fill: blue)


