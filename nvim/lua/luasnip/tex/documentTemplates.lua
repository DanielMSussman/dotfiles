return {
--choice node that cycles through templates

s({trig="latexTemplate",snippetType="snippet",dscr="cycle through blank, problem set, and PRL templates"},
    {
        c(1,{
                -- sn(nil,fmta(
                -- )),
                sn(nil,fmta(
                    [[
                    \documentclass[]{article}
                    %blank latex template
                    \usepackage{amsmath}
                    \usepackage{physics}

                    \begin{document}

                    <>

                    %\bibliographystyle{unsrt}
                    %\bibliography{bibfile}
                    \end{document}
                    ]],
                    {i(1,"Start typing!"),}
                ),{key = "bare-bones LaTeX document"}),
                sn(nil,fmta(
                    [[
                    \documentclass[reprint]{revtex4-2}
                    \usepackage{amsmath}
                    \usepackage{amssymb}
                    \usepackage{natbib}
                    \usepackage{float}
                    \usepackage{graphicx}
                    \graphicspath{{./figures/}{./}}
                    \usepackage{xcolor}
                    \usepackage{todonotes}
                    \usepackage{physics}
                    \usepackage{hyperref}
                    \usepackage[capitalize]{cleveref}

                    \newcommand{\dms}[1]{{\color{blue} #1}}

                    \begin{document}

                    \title{<>}

                    \author{Daniel M. Sussman}\email{daniel.m.sussman@emory.edu}
                    \affiliation{Department of Physics, Emory University, Atlanta, GA, USA}

                    \date{\today}

                    \begin{abstract}
                    An abstract
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

                    \bibliography{<>}

                    \end{document}
                    ]],
                    { i(1,"Title goes here"),
                      i(2,"bibfile"),
                    }
                ),{key = "RevTex template"}),
        })
    }
    ),
}
