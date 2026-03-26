#import "constants.typ": *
#import "@preview/hei-synd-report:0.3.0": *


#let mathbox(
  width: auto,
  radius: auto,
  border: auto,
  inset: auto,
  outset: auto,
  linecolor: cbase,
  title: none,
  fill: auto,
  counter: all-counter,
  numbering: auto,
  prefix: auto,
  titlfmt: title => [*#title*],
  suffix: none,
  bodyfmt: body => body,
  kind: auto,
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
    radius: radius,
    fill: code-bg,
    stroke: (left: linecolor + border, rest: cbase + 0pt),
    inset: inset,
    outset: outset,
  )[

    #if title != none [
      #text(fill: linecolor, size: 15pt, font: "Latin Modern Sans", weight: "bold")[
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
        #sym.miny
      ]
      #text(fill: black-n, size: 15pt, font: "Latin Modern Sans")[#titlfmt(title)]
    ] else [
      #text(fill: linecolor, size: 15pt, font: "Latin Modern Sans", weight: "bold")[
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
    #figure(
      kind: kind,
      supplement: supplement,
      numbering: numbering,
      caption: none,
    )[] #label

  ]
}

#let theorem(
  width: 100%,
  radius: (left: 1pt, right: 4pt),
  border: 4pt,
  inset: 16pt,
  outset: (left: -2pt),
  label: none,
  title: none,
  body,
) = {
  mathbox(
    width: width,
    radius: radius,
    border: border,
    inset: inset,
    outset: outset,
    linecolor: cbase,
    title: title,
    numbering: "1.1",
    kind: "gen",
    supplement: [Teorema],
    label: label,
    blocktitle: [*Teorema*],
  )[#body]
}

#let proposition(
  width: 100%,
  radius: (left: 1pt, right: 4pt),
  border: 4pt,
  inset: 16pt,
  outset: (left: -2pt),
  title: none,
  label: none,
  body,
) = {
  mathbox(
    width: width,
    radius: radius,
    border: border,
    inset: inset,
    outset: outset,
    linecolor: proposition-color,
    title: title,
    numbering: "1.1",
    kind: "gen",
    label: label,
    supplement: [Proposición],
    blocktitle: [*Proposición*],
  )[#body]
}

#let corollary(
  width: 100%,
  radius: (left: 1pt, right: 4pt),
  border: 4pt,
  inset: 16pt,
  outset: (left: -2pt),
  label: none,
  title: none,
  body,
) = {
  mathbox(
    width: width,
    radius: radius,
    border: border,
    inset: inset,
    outset: outset,
    linecolor: cbase,
    title: title,
    numbering: "1.1",
    kind: "gen",
    label: label,
    supplement: [Corolario],
    blocktitle: [*Corolario*],
  )[#body]
}

#let definition(
  width: 100%,
  radius: (left: 1pt, right: 4pt),
  border: 4pt,
  inset: 16pt,
  outset: (left: -2pt),
  label: none,
  title: none,
  body,
) = {
  mathbox(
    width: width,
    radius: radius,
    border: border,
    inset: inset,
    outset: outset,
    linecolor: definition-color,
    title: title,
    numbering: "1.1",
    kind: "gen",
    label: label,
    supplement: [Definición],
    blocktitle: [*Definición*],
  )[#body]
}

#let note(
  width: 100%,
  radius: (left: 1pt, right: 4pt),
  border: 4pt,
  inset: 16pt,
  outset: (left: -2pt),
  label: none,
  title: none,
  body,
) = {
  mathbox(
    width: width,
    radius: radius,
    border: border,
    inset: inset,
    outset: outset,
    linecolor: note-color,
    title: title,
    numbering: "1.1",
    kind: "gen",
    label: label,
    supplement: [Nota],
    blocktitle: [*Nota*],
  )[#body]
}
