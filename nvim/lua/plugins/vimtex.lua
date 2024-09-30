return {
    {
    "lervag/vimtex",
    lazy = false,
    -- tag = "v2.15", -- uncomment to pin to a specific release
    config = function()
            --global vimtex settings
            vim.g.vimtex_imaps_enabled = 0 --i.e., disable them
            -- 
            -- compiler settings
            vim.g.vimtex_compiler_silent = 1 -- i.e., don't emit compilation notifications
            -- vim.g.vimtex_compiler_latexmk = {out_dir = 'outputFiles'} -- the previous if/else setting depends on whether I'm using the latexmk bundled with miktex or not, and I didn't like that dependence

            --vimtex_view_settings
            -- set viewer based on operating system (windows = sumatraPDF via general, mac= skim, etc)
            if isWindows then 
                vim.g.vimtex_view_method = 'general'
            elseif isMac then 
                vim.g.vimtex_view_method = "sioyek"
            else
                vim.g.vimtex_view_method = 'general'
            end
            vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
            vim.g.vimtex_view_reverse_search_edit_cmd = 'vsplit'

            --quickfix settings
            vim.g.vimtex_quickfix_open_on_warning = 0 --  don't open quickfix if there are only warnings
            vim.g.vimtex_quickfix_ignore_filters = {"Underfull","Overfull", "LaTeX Warning: .\\+ float specifier changed to", "Package hyperref Warning: Token not allowed in a PDF string"}
        end,
    },
}

