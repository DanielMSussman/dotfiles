-- use vimtex to determine if we are in a math context
local function math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end 
return {
    s({trig="//",snippetType="autosnippet",desc = "fraction",wordTrig=false},
        fmta([[\frac{<>}{<>}]],
        {i(1,"numerator"),
         i(2,"denominator")}
        )
    ),

    s(
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

    s(
        {trig="fig", snippetType="snippet", dscr="A basic figure environment"},
        fmta(
            [[
            \begin{figure*}
            \centering
            \includegraphics[width=0.9\linewidth]{<>}
            \caption{
                \textbf{<>}
                <>
                }
            \label{fig:<>}
            \end{figure*}

            ]],
            { i(1,"filename"),
              i(2, "captionBold"),
              i(3, "captionText"),
              i(4,"figureLabel"),
             }
        )
    ),

    s(
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

    s(
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

    s(
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

    --postfixes for vectors, hats, etc.
    postfix({trig="hat",snippetType="autosnippet",dscr="postfix hat when in math mode"},
        {l("\\hat{" .. l.POSTFIX_MATCH .. "}")}, 
        { condition=math }
    ) ,
    postfix({trig="vec",snippetType="autosnippet",dscr="postfix vec when in math mode"},
        {l("\\vec{" .. l.POSTFIX_MATCH .. "}")}, 
        { condition=math }
    ) ,

    postfix({trig="df",snippetType="autosnippet",desc="postfix differential (physics package)"},
        {l("\\dd{" .. l.POSTFIX_MATCH .. "}")}, 
        {condition = math}
    ),
}
