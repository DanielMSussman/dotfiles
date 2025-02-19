--For colorschemes that I am not using right now
return {
    {
        "folke/tokyonight.nvim",
        -- lazy = false,
        lazy=true,
        -- priority = 1000,
        opts = {},
    },
    {
        'sainnhe/everforest',
        -- lazy = false,
        -- priority = 1000,
        lazy=true,
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            vim.g.everforest_background ='hard'
            vim.g.everforest_enable_italic = true
--            vim.cmd.colorscheme('everforest')
        end
    },
    {
        "AlexvZyl/nordic.nvim",
        lazy = true,
      -- lazy = false,
      -- priority = 1000,
        config = function()
            require("nordic").setup({})
      --      vim.cmd.colorscheme("nord")
        end,
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = true,
      -- lazy = false,
      -- priority = 1000,
        config = function()
            -- require("nordic").setup({})
      --      vim.cmd.colorscheme("nord")
        end,
    },
    {
        "sainnhe/gruvbox-material",
        lazy = true,
      -- lazy = false,
      -- priority = 1000,
        config = function()
            -- require("nordic").setup({})
      --      vim.cmd.colorscheme("nord")
        end,
    },
}
