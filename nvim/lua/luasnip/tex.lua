-- "getVisual" Adapted from https://ejmastnak.com/tutorials/vim-latex/luasnip
-- ----------------------------------------------------------------------------
-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
local getVisual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end
    -- this file first describes snippets for equations, figures, environments... 
    -- after that are a bunch of greek letter autosnippets 
    -- at the bottom is a template for a blank new PRL-style document
return {
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

    require("luasnip").snippet(
        {trig="href", snippetType="snippet", dscr="href with placeholders to remind you of the order"},
        fmta(
            [[\href{<>}{<>}]],
            {
            i(1, "url"),
            i(2, "display name"),
            }
        )
    ),

    --autotrigger latex quotation marks
    s({trig="\"", snippetType="autosnippet", desc="quotation marks"},
        fmta(
            [[``<>'' ]],
            {
            i(1, "text"),
            }
        )
    ),

    s({trig = "textbf", dscr = "the textbf command, easily wrapping a visual selection"},
        fmta("\\textbf{<>}",
            {
                d(1, getVisual),
            }
        )
    ),

    s({trig = "emph", dscr = "the emph command, easily wrapping a visual selection"},
        fmta("\\emph{<>}",
            {
                d(1, getVisual),
            }
        )
    ),
    --autotrigger fractions
    s({trig="//",snippetType="autosnippet",desc = "fraction",wordTrig=false},
        fmta([[\frac{<>}{<>}]],
        {i(1,"numerator"),
         i(2,"denominator")}
        )
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
    s({trig=";o", snippetType="autosnippet", desc="omega",wordTrig=false},
        {
            t("\\omega"),
        }
    ),
    s({trig=";w", snippetType="autosnippet", desc="omega",wordTrig=false},
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
                sn(nil,{i(1,"\\tau")}),
                sn(nil,{i(1,"\\theta")})
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
                sn(nil,{i(1,"\\epsilon")}),
                sn(nil,{i(1,"\\eta")})
                })
            }
        )
    ),

    s({trig=";p",snippetType="autosnippet",desc="pi/phi",wordTrig=false},
        fmta([[
            <>
            ]],
            {
            c(1,{
                sn(nil,{i(1,"\\pi")}),
                sn(nil,{i(1,"\\phi")})
                })
            }
        )
    ),

    --create, for convenience, a compilable template
    s({trig="blankTemplate", snippetType="snippet", dscr="Set up a bare-bones article"},
        fmta(
            [[
            \documentclass[]{article}
            \usepackage{amsmath}

            %opening
            \title{<>}
            \author{<>}

            \begin{document}

            \maketitle


            <>

            \end{document}
            ]],
            { 
              i(1,"Title goes here"),
              i(2,"Author name"),
              i(3,"Start typing!"),
            }
        )
    ),
    --a template with prl-like stylings
    s({trig="prlTemplate", snippetType="snippet", dscr="set up a new default Phys-Rev-style LaTeX template"},
        fmta(
            [[
            \documentclass[aps,preprint,superscriptaddress,nofootinbib, notitlepage,prl]{revtex4-2}

            \usepackage[utf8]{inputenc}
            \usepackage{graphicx}
            \usepackage[dvipsnames,x11names]{xcolor}
            \usepackage{float}
            \usepackage{mathrsfs}
            \usepackage{amsmath,amssymb}
            \usepackage{hyperref}


            \newcommand{\dms}[1]{{\color{blue} #1}}

            %\bibliographystyle{unsrt}


            \begin{document}

            \title{<>}

            \author{Daniel M. Sussman}\email{daniel.m.sussman@emory.edu}
            \affiliation{Department of Physics, Emory University, Atlanta, GA, USA}

            \date{\today}

            \begin{abstract}
            <>
            \end{abstract}

            \maketitle

            \section{Introduction}

            intro text

            \section{Methods}

            methods text

            \section{Results}

            results text

            \section{Discussion}

            discussion text

            %\bibliography{<>}


            \end{document}
            ]],
            { i(1,"Title goes here"),
              i(2,"An extremely good abstract"),
              i(3,"bibliographyFileName"),
            }
        )
    ),

}
