return {
    {
    "lervag/vimtex",
    lazy = false,
    -- tag = "v2.15", -- uncomment to pin to a specific release
    config = function()
            --global vimtex settings
            vim.g.vimtex_imaps_enabled = 0
            --vimtex_view_settings
            -- set viewer based on operating system (windows = sumatraPDF via general, mac= skim, etc)
            local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
            local is_mac = vim.fn.has("mac") == 1 
            if is_windows then 
                vim.g.vimtex_view_method = 'sioyek'
            elseif is_mac then 
                vim.g.vimtex_view_method = "sioyek"
            else
                --vim.g.vimtex_view_method = "zathura"
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

