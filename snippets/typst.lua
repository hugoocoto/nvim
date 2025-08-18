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

        s({ trig = "paper" }, fmta([[
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
        }))
}
