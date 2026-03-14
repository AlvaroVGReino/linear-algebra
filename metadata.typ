//-------------------------------------
// Document options
//
#let option = (
  //type : "final",
  type: "draft",
  lang: "es",
  //lang : "de",
  //lang : "fr",
)
//-------------------------------------
// Optional generate titlepage image
//
#import "@preview/fractusist:0.1.1": *  // only for the generated images

#let titlepage_logo = dragon-curve(
  12,
  step-size: 10,
  stroke-style: stroke(
    //paint: gradient.linear(..color.map.rocket, angle: 135deg),
    paint: gradient.radial(..color.map.crest),
    thickness: 3pt,
    join: "round",
  ),
  height: 10cm,
)

//-------------------------------------
// Metadata of the document
//
#let doc = (
  title: [*Álgebra Lineal*],
  abbr: "Math",
  subtitle: [_Apuntes y Boletines_],
  url: "-----------------------",
  logos: (
    tp_topleft: image("resources/img/synd.svg", height: 1.2cm),
    tp_topright: image("resources/img/logo_usc.svg", height: 1.5cm),
    tp_main: titlepage_logo,
    header: image("resources/img/project-logo.svg", width: 2.5cm),
  ),
  authors: (
    (
      name: "Vázquez Gómez-Reino, Álvaro",
      abbr: "AVGR",
      email: "alvaro.vazquez.gr@proton.me",
      url: "https://github.com/AlvaroVGReino",
    ),
  ),
  keywords: ("Typst", "Matemáticas", "USC", "Universidade de Santiago de Compostela", "Linear Algebra", "Mathematics"),
  version: "v0.1.0",
)

#let date = datetime.today()

//-------------------------------------
// Settings
//
#let tableof = (
  toc: true,
  tof: false,
  tot: false,
  tol: false,
  toe: false,
  maxdepth: 3,
)

#let gloss = true
#let appendix = false
#let bib = (
  display: true,
  path: "/tail/bibliography.bib",
  style: "apa", //"ieee", "chicago-author-date", "chicago-notes", "mla"
)
