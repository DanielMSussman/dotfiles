return {
    {
    "nvim-treesitter/nvim-treesitter",
    -- event = { "BufReadPre", "BufNewFile" },
    event = "VeryLazy",
    lazy=true,
    build=":TSUpdate",
    config = function()
       local config = require("nvim-treesitter.configs")
        config.setup({
        ensure_installed = {"lua","cpp", "c","cuda","markdown", "vim", "vimdoc","markdown_inline","html","julia"},
        sync_install = true,
        highlight = {enable = true,
                    disable = {"tex"},
                },
        indent = {enable = true,
                disable = {"cpp","c","cuda"},
            }
        })
    end
    },
}
