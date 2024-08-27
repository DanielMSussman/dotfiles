return {
    {
        "folke/trouble.nvim",
        event = "VimEnter",
        config = function()
            require("trouble").setup({
            })
            vim.keymap.set("n","<leader>xx","<cmd>Trouble diagnostics toggle<CR>",{desc="Trouble: toggle diagnostics"})
            vim.keymap.set("n","<leader>xl","<cmd>Trouble loclist toggle<CR>",{desc="Trouble: Location list"})
            vim.keymap.set("n","<leader>xq","<cmd>Trouble qflist toggle<CR>",{desc="Trouble: Quickfix list"})
        end
    },
}
