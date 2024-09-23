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

                    \end{document}
                    ]],
                    {i(1,"Start typing!"),}
                ),{key = "bare-bones LaTeX document"}),
                sn(nil,fmta(
                    [[
                    \documentclass[12pt]{article}
                    %Template for problem sets
                    \usepackage{graphicx}
                    \usepackage{bm}
                    \usepackage{hyperref}
                    \usepackage{amsmath, amssymb}
                    \usepackage{physics}
                    \usepackage[marginparwidth=1.2in,marginparsep=.05in,margin=1.in]{geometry}
                    \usepackage{fancyhdr}
                    \pagestyle{fancy}
                    \lhead{\textbf{PHYS <>}}
                    \rhead{\textbf{Problem set <>}}

                    \begin{document}
                    %\maketitle

                    \begin{center}
                    \section*{Problem set <>}
                    \subsection*{Due on: <>}
                    \end{center}

                    \begin{quote}
                    Note: An important part of science is communicating your understanding to other people. That is to say, a solution that may be technically correct but which I  cannot understand is not much better than an incorrect solution. So, please answer the following questions neatly, clearly, and logically -- Thanks!
                    \end{quote}

                    \subsection*{Problem 1: <>}



                    \subsection*{Question: Self-assessment and measurement of difficulty}
                    How do you think you did on this assignment? I.e., are you confident in the work you've submitted, or are you unsure of how you approached and/or completed some of the problems? 

                    How much time did you spend on this homework? Feel free to answer either in absolute terms (i.e., number of hours worked) or in qualitative terms relative to the average homework from last semester. 
                    Thanks!
                    \end{document}
                    ]],
                    {
                        i(1,"504"),
                        i(2,"1"),
                        rep(2),
                        i(3,"dueDate"),
                        i(4,"problemTitle"),
                    }
                ),{key = "Problem set template"}),
                sn(nil,fmta(
                    [[
                    \documentclass[reprint,amsmath,amssymb,aps]{revtex4-2}
                    %PRL-like template
                    \usepackage[utf8]{inputenc}
                    \usepackage[dvipsnames,x11names]{xcolor}
                    \usepackage{graphicx,physics,hyperref}
                    \usepackage[capitalize]{cleveref}

                    \newcommand{\dms}[1]{{\color{blue} #1}}

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
                ),{key = "RevTex template"}),
        })
    }
    ),
}
