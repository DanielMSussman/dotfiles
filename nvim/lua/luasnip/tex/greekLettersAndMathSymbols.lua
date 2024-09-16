return {

    s({trig=";N", snippetType="autosnippet", desc="nabla",wordTrig=false},
        {
            t("\\nabla"),
        }
    ),
    s({trig=";i", snippetType="autosnippet", desc="nabla",wordTrig=false},
        {
            t("\\infty"),
        }
    ),
    --autotrigger greek letters, with choice nodes for pi/phi, epsilon/eta, tau/theta...
    s({trig=";a", snippetType="autosnippet", desc="alpha",wordTrig=false},
        {
            t("\\alpha"),
        }
    ),
    s({trig=";b", snippetType="autosnippet", desc="beta",wordTrig=false},
        {
            t("\\beta"),
        }
    ),
    s({trig=";B", snippetType="autosnippet", desc="Beta",wordTrig=false},
        {
            t("\\Beta"),
        }
    ),
    s({trig=";g", snippetType="autosnippet", desc="gamma",wordTrig=false},
        {
            t("\\gamma"),
        }
    ),
    s({trig=";G", snippetType="autosnippet", desc="Gamma",wordTrig=false},
        {
            t("\\Gamma"),
        }
    ),
    s({trig=";d", snippetType="autosnippet", desc="delta",wordTrig=false},
        {
            t("\\delta"),
        }
    ),
    s({trig=";D", snippetType="autosnippet", desc="Delta",wordTrig=false},
        {
            t("\\Delta"),
        }
    ),
    s({trig=";z", snippetType="autosnippet", desc="zeta",wordTrig=false},
        {
            t("\\zeta"),
        }
    ),
    s({trig=";k", snippetType="autosnippet", desc="kappa",wordTrig=false},
        {
            t("\\kappa"),
        }
    ),
    s({trig=";l", snippetType="autosnippet", desc="lambda",wordTrig=false},
        {
            t("\\lambda"),
        }
    ),
    s({trig=";m", snippetType="autosnippet", desc="mu",wordTrig=false},
        {
            t("\\mu"),
        }
    ),
    s({trig=";n", snippetType="autosnippet", desc="nu",wordTrig=false},
        {
            t("\\nu"),
        }
    ),
    s({trig=";x", snippetType="autosnippet", desc="xi",wordTrig=false},
        {
            t("\\xi"),
        }
    ),

    s({trig=";r", snippetType="autosnippet", desc="rho",wordTrig=false},
        {
            t("\\rho"),
        }
    ),
    s({trig=";s", snippetType="autosnippet", desc="sigma",wordTrig=false},
        {
            t("\\sigma"),
        }
    ),
    s({trig=";c", snippetType="autosnippet", desc="chi",wordTrig=false},
        {
            t("\\chi"),
        }
    ),
    s({trig=";o", snippetType="autosnippet", desc="omega",wordTrig=false},
        {
            t("\\omega"),
        }
    ),
    s({trig=";O", snippetType="autosnippet", desc="Omega",wordTrig=false},
        {
            t("\\Omega"),
        }
    ),
    s({trig=";t",snippetType="autosnippet",desc="tau/theta",wordTrig=false},
        fmta([[
            <>
            ]],
            {
            c(1,{
                t("\\tau"),
                t("\\theta")
                })
            }
        )
    ),
    s({trig=";e",snippetType="autosnippet",desc="episilon/eta",wordTrig=false},
        fmta([[
            <>
            ]],
            {
            c(1,{
                t("\\epsilon"),
                t("\\eta")
                })
            }
        )
    ),

    s({trig=";p",snippetType="autosnippet",desc="pi/phi/psi",wordTrig=false},
        fmta([[
            <>
            ]],
            {
            c(1,{
                t("\\pi"),
                t("\\phi"),
                t("\\psi")
                })
            }
        )
    ),

}
