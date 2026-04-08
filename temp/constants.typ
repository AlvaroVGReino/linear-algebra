
#let all-counter = counter("counter")
#let box-id-counter = counter("box-id")
#let chapter = counter("chapter")
#let chapter-counter = counter("heading")
#show heading: it => {
  chapter-counter.step()
  it
}

#let code-bg = rgb("#efefef")
#let black-n = rgb("#333333")
#let cbase = rgb("#006E82")
#let proposition-color = rgb("#B4323C")
#let definition-color = rgb("#6E46A0")
#let note-color = rgb("#3C8C64")


