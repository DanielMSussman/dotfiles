return {
    {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build=":TSUpdate",
    config = function()
       local config = require("nvim-treesitter.configs")
        config.setup({
        ensure_installed = {"lua","c", "markdown", "vim", "vimdoc","markdown_inline"},
        sync_install = true,
        highlight = {enable = true },
        indent = {enable = true},
        })
    end
    },
}
