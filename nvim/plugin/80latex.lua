-- We need to configure vimtex globals BEFORE loading the plugin
vim.g.vimtex_imaps_enabled = 0 -- disable imaps (luasnip instead)
vim.g.vimtex_compiler_silent = 1 -- i.e., don't emit compilation notifications
-- vim.g.vimtex_compiler_latexmk = {
--     aux_dir = 'auxFiles', -- put aux files in another directory
-- }
vim.g.vimtex_format_enabled = 0
vim.g.vimtex_syntax_conceal_disable = 1
vim.g.vimtex_matchparen_enabled = 0

vim.g.vimtex_view_method = 'general'
vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
vim.g.vimtex_quickfix_open_on_warning = 0 -- don't open quickfix if there are only warnings
vim.g.vimtex_quickfix_ignore_filters = {
    "Underfull",
    "Overfull", 
    "LaTeX Warning: .\\+ float specifier changed to", 
    "Package hyperref Warning: Token not allowed in a PDF string"
}

vim.pack.add({ "https://github.com/lervag/vimtex" })
vim.pack.add({ "https://github.com/DanielMSussman/motleyLatex.nvim" })

require("motleyLatex").setup({
    tcolorbox_opts = {
        colframe = "{rgb,255:red,118;green,107;blue,144}", --lotusViolet2
        boxrule = "1.0pt",
        width = "1.0\\textwidth",
        fontupper = "\\normalsize",
        breakable="false",
        top = "0.5pt",
        bottom = "0.5pt",
        colbacktitle="{rgb,255:red,54;green,54;blue,70}", --sumiInk5
        coltitle = "{rgb,255:red,220;green,215;blue,186}", --fujiWhite
        fonttitle="\\scshape\\ttfamily",
    },
})
