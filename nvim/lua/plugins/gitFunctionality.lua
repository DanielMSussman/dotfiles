return {
    {"lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require('gitsigns').setup({
                signs = {
                    add          = { text = '+' },
                    change       = { text = '~' },
                    delete       = { text = '_' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
                signs_staged = {
                    add          = { text = '+' },
                    change       = { text = '~' },
                    delete       = { text = '-' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '_' },
                    untracked    = { text = '┆' },
                },
            })
            --gitsigns
            vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {noremap=true,desc = "Gitsigns: preview [h]unk"})
            vim.keymap.set("n", "<leader>gi", ":Gitsigns preview_hunk_inline<CR>", {noremap=true,desc = "Gitsigns: preview hunk [i]nline"}) 
        end
    },
    -- {
    --     "tpope/vim-fugitive",
    --     event = "VeryLazy",
    --     config = function()
    --         --vim-fugitive
    --         vim.keymap.set('n','<leader>gs',':Git<CR>',{noremap=true,desc ='git status'}) --git status
    --         vim.keymap.set('n','<leader>ga',':Git add ',{noremap=true,desc ='git add '})
    --         vim.keymap.set('n','<leader>gA',':Git add .<CR>',{noremap=true,desc ='git add .'})
    --         vim.keymap.set('n','<leader>gp',':Git push --quiet <CR>',{noremap=true,desc ='git push'})
    --         vim.keymap.set('n','<leader>gc',':Git commit -qam "',{noremap=true,desc ='git commit -am'})
    --     end
    -- },
}
