--For colorschemes that I am not using right now
return {
    {
        "sho-87/kanagawa-paper.nvim",
        -- lazy = false,
        -- priority = 1000,
        config  =  function()
            require('kanagawa-paper').setup({
                undercurl = false,
                transparent = false,
                gutter = false,
                dimInactive = true, -- disabled when transparent
                terminalColors = true,
                commentStyle = { italic = true },
                functionStyle = { italic = false },
                keywordStyle = { italic = false, bold = false },
                statementStyle = { italic = false, bold = false },
                typeStyle = { italic = false },
            })
        end
    },
    {
        "folke/tokyonight.nvim",
        -- lazy = false,
        -- priority = 1000,
        opts = {},
    },
    {
        'sainnhe/everforest',
        -- lazy = false,
        -- priority = 1000,
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            vim.g.everforest_background ='hard'
            vim.g.everforest_enable_italic = true
--            vim.cmd.colorscheme('everforest')
        end
    },
    {
      'sainnhe/gruvbox-material',
      -- lazy = false,
      -- priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.gruvbox_material_background = 'hard'
        vim.g.gruvbox_material_enable_italic = true
        -- vim.cmd.colorscheme('gruvbox-material')
      end
    },
}
