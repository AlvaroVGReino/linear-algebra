#import "@preview/hei-synd-report:0.1.1": *
#import "./metadata.typ": *

#let chapter = counter("chapter")
#let chapter-counter = counter("heading")
#show heading: it => {
  chapter-counter.step()
  it
}

#import "./tail/bibliography.typ": *
#import "/tail/glossary.typ": *
#import "/temp/math.typ": *
#import "/temp/constants.typ": *
#import "/temp/text.typ": *
#import "@preview/great-theorems:0.1.2": *



#set heading(numbering: "1.")
#set text(font: "New Computer Modern")
#set par(justify: true)
#set text(lang: "es", hyphenate: true)
#set math.equation(numbering: "(1)")
#show: make-glossary
#register-glossary(entry-list)
//-------------------------------------
// Template config
//
//
#show: report.with(
  option: option,
  doc: doc,
  date: date,
  tableof: tableof,
)
#set text(
  size: 13pt,
)

#set math.equation(supplement: [Ecuación])


//-------------------------------------
// Content
//
// Apuntes
//
#include "./main/espacios-vectoriales.typ"
#include "./main/aplicaciones-lineales.typ"
#include "./main/sistemas-de-ec-lineales.typ"
#include "./main/determinantes.typ"
#include "./main/clasificacion-de-endomorfismos.typ"

// Boletines
//
#include "./main/boletin-01.typ"
#include "./main/boletin-03.typ"
//
//

#heading(numbering: none, outlined: false)[] <sec:end>

//-------------------------------------
// Glossary
//
#make_glossary(gloss: gloss, title: i18n("gloss-title"))

//-------------------------------------
// Bibliography
//
#make_bibliography(bib: bib, title: i18n("bib-title"))

//-------------------------------------
// Appendix
//
#if appendix == true {
  [
    #pagebreak()
    #counter(heading).update(0)
    #set heading(numbering: "A")
    = #i18n("appendix-title") <sec:appendix>
    //#include "tail/a-appendix.typ"
  ]
}
