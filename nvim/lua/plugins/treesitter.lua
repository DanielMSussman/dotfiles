return {
    {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    lazy=true,
    build=":TSUpdate",
    config = function()
       local config = require("nvim-treesitter.configs")
        config.setup({
        ensure_installed = {"lua","cpp", "c","cuda","markdown", "vim", "vimdoc","markdown_inline","html"},
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
    -- {
    -- "nvim-treesitter/nvim-treesitter-context",
    -- event="VimEnter",
    -- config = function()
    --     local tsc = require("treesitter-context").setup({
    --         enable=false,
    --         max_lines=2,
    --         })
    --     vim.keymap.set("n","<leader>y", ":TSContextToggle<CR>", {noremap=true,desc='[y] toggle treesitter context'})
    -- end
    -- }
}
