return {
    {
    "lervag/vimtex",
    lazy = false,
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
            --global vimtex settings
            vim.g.vimtex_imaps_enabled = 0 -- disable imaps (luasnip instead)
            
            -- compiler settings

            vim.g.vimtex_compiler_silent = 1 -- i.e., don't emit compilation notifications
            vim.g.vimtex_compiler_latexmk = {
                aux_dir = 'auxFiles', -- put aux files in another directory
            }

            --vimtex_view_settings
            vim.g.vimtex_view_method = 'general'
            vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

            --quickfix settings
            vim.g.vimtex_quickfix_open_on_warning = 0 --  don't open quickfix if there are only warnings
            vim.g.vimtex_quickfix_ignore_filters = {"Underfull","Overfull", "LaTeX Warning: .\\+ float specifier changed to", "Package hyperref Warning: Token not allowed in a PDF string"}
        end,
    },
}

