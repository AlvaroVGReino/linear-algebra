#import "constants.typ": *

#let textbox(
  width: auto,
  inset: auto,
  outset: auto,
  title: none,
  fill: auto,
  flag: auto,
  counter: all-counter,
  numbering: auto,
  prefix: auto,
  titlfmt: title => [*#title*],
  suffix: none,
  bodyfmt: body => body,
  kind: auto,
  qed: bool,
  label: none,
  supplement: [Nota],
  blocktitle: auto,
  body,
) = {
  if counter != auto and numbering != auto {
    counter.step()
  }


  block(
    width: width,
    inset: inset,
    outset: outset,
  )[

    #figure(
      kind: kind,
      supplement: supplement,
      numbering: numbering,
      caption: none,
    )[] #label

    #if title != none [
      #text(font: "Latin Modern Sans", weight: "bold")[
        #if blocktitle != auto {
          [#blocktitle ]
        }
        #if counter != auto and numbering != auto {
          if prefix != auto {
            prefix(context counter.display(numbering))
          } else {
            "1."
            context counter.display(numbering)
          }
        }
        #sym.miny
      ]
      #text(fill: black-n.lighten(40%), font: "Latin Modern Sans", weight: "bold")[(#titlfmt(title))]
    ] else [
      #text(font: "Latin Modern Sans", weight: "bold")[
        #if blocktitle != auto {
          [#blocktitle ]
        }
        #if counter != auto and numbering != auto {
          if prefix != auto {
            prefix(context counter.display(numbering))
          } else {
            context counter.display(numbering)
          }
        }
      ]
    ]

    #bodyfmt(body)
    #if qed == true {
      text(fill: black-n.lighten(40%))[#align(right)[
        $sym.qed$
      ]]
    } else {
      text(fill: black-n.lighten(40%), size: 20pt)[#align(right)[#move(dy: -20pt)[#figure(
          kind: kind,
          supplement: blocktitle,
          $corner.r.b$,
        )
      ]]]
    }

  ]
}

#let remark(
  width: 100%,
  border: 7pt,
  inset: 0pt,
  flag: 1,
  outset: -4pt,
  qed: false,
  label: none,
  title: none,
  body,
) = {
  textbox(
    width: width,
    inset: inset,
    outset: outset,
    flag: flag,
    qed: qed,
    title: title,
    numbering: "1.1",
    label: label,
    supplement: [Observación],
    kind: "gen",
    blocktitle: [*Observación*],
  )[#body]
}

#let example(
  width: 100%,
  border: 7pt,
  inset: 0pt,
  outset: -4pt,
  qed: false,
  label: none,
  title: none,
  body,
) = {
  textbox(
    width: width,
    inset: inset,
    outset: outset,
    qed: qed,
    title: title,
    numbering: "1.1",
    supplement: [Ejemplo],
    label: label,
    kind: "gen",
    blocktitle: [*Ejemplo*],
  )[#body]
}

#let exercise(
  width: 100%,
  border: 7pt,
  inset: 0pt,
  outset: -4pt,
  qed: false,
  label: none,
  title: none,
  body,
) = {
  textbox(
    width: width,
    inset: inset,
    outset: outset,
    qed: qed,
    title: title,
    numbering: "1.1",
    supplement: [Ejercicio],
    label: label,
    kind: "gen",
    blocktitle: [*Ejercicio*],
  )[#body]
}

#let solution(
  width: 100%,
  border: 7pt,
  inset: 0pt,
  outset: -4pt,
  qed: true,
  label: none,
  title: none,
  body,
) = {
  textbox(
    width: width,
    inset: inset,
    outset: outset,
    qed: qed,
    title: title,
    supplement: [Solución],
    numbering: "1.1",
    label: label,
    kind: "gen",
    blocktitle: [*Solución*],
  )[#body]
}

#let dem(
  width: 100%,
  border: 7pt,
  inset: 0pt,
  flag: 5,
  outset: -4pt,
  qed: true,
  title: none,
  label: none,
  body,
) = {
  textbox(
    width: width,
    inset: inset,
    outset: outset,
    flag: flag,
    qed: qed,
    title: title,
    label: label,
    supplement: [Demostración],
    numbering: "1.1",
    kind: "gen",
    blocktitle: [*Demostración*],
  )[#body]
}

#let idea(
  width: 100%,
  border: 7pt,
  inset: 0pt,
  flag: 5,
  outset: -4pt,
  qed: false,
  title: none,
  label: none,
  body,
) = {
  textbox(
    width: width,
    inset: inset,
    outset: outset,
    flag: flag,
    qed: qed,
    title: title,
    label: label,
    supplement: [Idea],
    numbering: "1.1",
    kind: "gen",
    blocktitle: [*Idea*],
  )[#body]
}
