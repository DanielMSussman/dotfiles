--test whether the parent snippet has content from a visual selection. If yes, put into a text  node, if no then start an insert node
local visualSelectionOrInsert = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, t( parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end


return {

s({trig = "mdCodeBlock", dscr = "select text, surround it with a markdown code block, and add an insert node for the language"},
fmta(
[[```<>
<>
```
]],
    {
    i(1,"cpp"),
    d(2, visualSelectionOrInsert),
    }
    )
),

}
