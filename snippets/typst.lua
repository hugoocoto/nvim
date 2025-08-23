---@diagnostic disable: undefined-global

return {
        -- math modes
        s({ trig = "mt", snippetType = "autosnippet" }, fmta("$<>$ ", { i(1) })),
        s({ trig = "mmt", snippetType = "autosnippet" }, fmta("$ <> $ ", { i(1) })),

        s({ trig = "(%d+)", regTrig = true },
                fmta([[
#for i in range(<>) {
	<>
}]], {
                        f(function(_, s) return s.captures[1] end),
                        i(1)
                })
        ),
        s({ trig = "([^%s]+)t", regTrig = true },
                fmta("(<>)^(<>) ", {
                        f(function(_, s) return s.captures[1] end),
                        i(1)
                })
        ),

        s({ trig = "ieee" }, fmta([[
#import "@preview/charged-ieee:0.1.4": ieee

#show: ieee.with(
  title: [<>],
  abstract: [<>],
  authors: (
    (
      name: "Hugo Coto Flórez",
      department: [Ingeniería informática],
      location: [Santiago de Compostela],
      email: "hugo.coto@rai.usc.es",
    ),
  ),
  index-terms: (),
  figure-supplement: [Fig.],
)

= Introduction
<>
    ]], {
                i(1, "Título"),
                i(2, "Resumen"),
                i(3, ""),
        })),

        s({ trig = "paper" }, fmta([[
#import "@preview/rubber-article:0.5.0": *

#let title = [<>]
#let authors = ("Hugo Coto Flórez",)

#show: article.with(
  cols: none,
  eq-chapterwise: true,
  eq-numbering: "(1.1)",
  header-display: true,
  header-title: title,
  lang: "es",
  page-margins: 1.75in,
  page-paper: "a4",
)
// Tip: use #colbreak() instead of #pagebreak() to seamlessly toggle columns

#maketitle(
  title: title,
  authors: authors,
  date: datetime.today().display("[day]. [month repr:long] [year]"),
)

= Introduction
<>
    ]], {
                i(1, "Título"),
                i(2, ""),
        })),

        s("note", fmt([[
#let author = "Hugo Coto Flórez"
#let mail = "hugo.coto@rai.usc.es"

#show heading.where(
  level: 1,
): it => block(width: 100%)[
  #set align(center)
  #set text(weight: "regular")
  #smallcaps(it.body)
  #linebreak()
  #linebreak()
]

#set page(header: align(right + horizon)[
  #author (#link("mailto:" + mail))
])

{}
]], {
                i(1),
        })),
        --         s({ trig = "" }, fmta([[
        -- ]])),
}
