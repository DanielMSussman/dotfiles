return {

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
            \usepackage{physics}
            \usepackage[capitalize]{cleveref}

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
