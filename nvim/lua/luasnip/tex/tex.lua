--see other lua files in directory for snippets sorted by type. This file will have all of the visual selection related snippets, and then a few odds and ends that don't merit their own categorization

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

return {

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
}
