ENV["EDITOR"] = "nvim"
using Revise
using BenchmarkTools

# atreplinit() do repl
#     @eval using Revise
#     @eval using BenchmarkTools
#     @eval using JET
# end

# if isinteractive()
#     using OhMyREPL
#     using Crayons
#     import OhMyREPL: Passes.SyntaxHighlighter
#     #https://github.com/rebelot/kanagawa.nvim, but with macros linking to a special
#     kanagawaScheme = SyntaxHighlighter.ColorScheme()
#     SyntaxHighlighter.keyword!(kanagawaScheme, Crayon(foreground = 0x957FB8, background = 0x1F1F28))
#     SyntaxHighlighter.macro!(kanagawaScheme, Crayon(foreground = 0xE46876, background = 0x1F1F28))
#     SyntaxHighlighter.comment!(kanagawaScheme, Crayon(foreground = 0x727169, background = 0x1F1F28))
#     SyntaxHighlighter.call!(kanagawaScheme, Crayon(foreground = 0x7E9CD8, background = 0x1F1F28))
#     SyntaxHighlighter.string!(kanagawaScheme, Crayon(foreground = 0x98BB6C, background = 0x1F1F28))
#     SyntaxHighlighter.error!(kanagawaScheme, Crayon(foreground = 0xE82424, background = 0x1F1F28))
#     SyntaxHighlighter.number!(kanagawaScheme, Crayon(foreground = 0xD27E99, background = 0x1F1F28))
#     SyntaxHighlighter.op!(kanagawaScheme, Crayon(foreground = 0xC0A36E, background = 0x1F1F28))
#     SyntaxHighlighter.function_def!(kanagawaScheme, Crayon(foreground = 0x7E9CD8, background = 0x1F1F28))
#     SyntaxHighlighter.text!(kanagawaScheme, Crayon(foreground = 0xDCD7BA, background = 0x1F1F28))
#     SyntaxHighlighter.symbol!(kanagawaScheme,Crayon(foreground = 0xE6C384, background = 0x1F1F28))
#     SyntaxHighlighter.argdef!(kanagawaScheme, Crayon(foreground = 0x7AA89F, background = 0x1F1F28))
#     SyntaxHighlighter.add!("kanagawa",kanagawaScheme)
#     colorscheme!("kanagawa")
#     @info "Using OhMyREPL"
# end


