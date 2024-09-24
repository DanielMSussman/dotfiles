-- use vimtex to determine if we are in a math context
local function math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end 
-- a helper function to generate arbitrarily sized matrices.
--https://github.com/evesdropper/luasnip-latex-snippets.nvim/blob/main/lua/luasnip-latex-snippets/luasnippets/tex/math.lua
local generate_matrix = function(args, snip)
	local rows = tonumber(snip.captures[2])
	local cols = tonumber(snip.captures[3])
	local nodes = {}
	local ins_indx = 1
	for j = 1, rows do
		table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
		ins_indx = ins_indx + 1
		for k = 2, cols do
			table.insert(nodes, t(" & "))
			table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1)))
			ins_indx = ins_indx + 1
		end
		table.insert(nodes, t({ "\\\\", "" }))
	end
	-- fix last node.
	nodes[#nodes] = t("\\\\")
	return sn(nil, nodes)
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
    -- arbitrarily sized matrices
    s({trig = "([%sbBpvV])Mat(%d+)x(%d+)", snippetType="autosnippet", regTrig = true, wordTrig=false, dscr = "[bBpvV]matrix of A x B size"},
        fmta([[
        \begin{<>}
        <>
        \end{<>}]],
        {
        f(function(_, snip)
            if  snip.captures[1] ==" " then
                return "matrix"
            else
                return snip.captures[1] .. "matrix"
            end
        end),
        d(1, generate_matrix),
        f(function(_, snip)
            if  snip.captures[1] ==" " then
                return "matrix"
            else
                return snip.captures[1] .. "matrix"
            end
        end)
        }),
        { condition=math }
    ),

}
