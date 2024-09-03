return {

    s({trig="//",snippetType="autosnippet",desc = "fraction",wordTrig=false},
        fmta([[\frac{<>}{<>}]],
        {i(1,"numerator"),
         i(2,"denominator")}
        )
    ),

    require("luasnip").snippet(
        {trig="eq", snippetType="snippet", dscr="A LaTeX equation environment"},
        fmta(
            [[
            \begin{equation}
                <>
            \end{equation}
            
            ]],
            { i(1) }
        )
    ),

    require("luasnip").snippet(
        {trig="fig", snippetType="snippet", dscr="A basic figure environment"},
        fmta(
            [[
            \begin{figure}
            \centerline
            \includegraphics[width=1.0\linewidth]{<>}
            \caption{\label{fig:<>}
                <>
                }
            \end{figure}

            ]],
            { i(1,"filename"),
              i(2,"figureLabel"),
              i(3, "captionText"),
             }
        )
    ),

    require("luasnip").snippet(
        {trig="env", snippetType="snippet", dscr="Begin and end an arbitrary environment"},
        fmta(
            [[
            \begin{<>}
                <>
            \end{<>}

            ]],
            {i(1),
             i(2),
             rep(1),
            }
        )
    ),

    require("luasnip").snippet(
        {trig="cases", snippetType="snippet", dscr="Set up a case statement (requires amsmath)"},
        fmta(
            [[
            \begin{cases}
                <> & \text{<> $<>$} \\
                <> & \text{<> $<>$}
            \end{cases}
            ]],
            {i(1,"0"),
             i(2,"if"),
             i(3,"x<0"),
             i(4,"1"),
             i(5,"if"),
             i(6,"x>0"),
            }
        )
    ),

    require("luasnip").snippet(
        {trig="mat", snippetType="snippet", dscr="Set up a 2x2 matrix (requires amsmath)"},
        fmta(
            [[
            \begin{pmatrix}
                <> & <> \\
                <> & <> 
            \end{pmatrix}

            ]],
            {i(1),
             i(2),
             i(3),
             i(4),
            }
        )
    ),

    s({trig=";v", snippetType="autosnippet", desc="vector",wordTrig=false},
        fmta(
        [[\vec{<>}]],
            {i(1),
            }
        )
    ),
}
