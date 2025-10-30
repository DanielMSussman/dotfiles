return {
    {
    "lervag/vimtex",
    lazy = false,
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
            --global vimtex settings
            --
            -- disable imaps -- we're using luasnip instead
            vim.g.vimtex_imaps_enabled = 0
            
            -- compiler settings

            -- i.e., don't emit compilation notifications
            vim.g.vimtex_compiler_silent = 1 
            -- put aux files in another directory
            vim.g.vimtex_compiler_latexmk = {
                aux_dir = 'auxFiles',
            }

            --vimtex_view_settings
            vim.g.vimtex_view_method = 'general'
            vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

            --quickfix settings
            --  don't open quickfix if there are only warnings
            vim.g.vimtex_quickfix_open_on_warning = 0 
            -- ignore most common complaints
            vim.g.vimtex_quickfix_ignore_filters = {"Underfull","Overfull", "LaTeX Warning: .\\+ float specifier changed to", "Package hyperref Warning: Token not allowed in a PDF string"}
        end,
    },
}

