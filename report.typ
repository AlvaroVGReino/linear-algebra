#import "@preview/hei-synd-report:0.1.1": *
#import "@preview/clean-cnam-template:1.6.2": *
#import "/metadata.typ": *
#import "/tail/bibliography.typ": *
#import "/tail/glossary.typ": *
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

//-------------------------------------
// Content
//
// Apuntes
//
#include "/main/espacios-vectoriales.typ"

// Boletines
//
#include "/main/boletin-01.typ"

//
//
#include "/temp/01-intro.typ"
#include "/temp/02-specification.typ"
#include "/temp/03-design.typ"
#include "/temp/04-implementation.typ"
#include "/temp/05-validation.typ"
#include "/temp/06-conclusion.typ"

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
