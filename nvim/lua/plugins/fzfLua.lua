return {
    {
    'ibhagwan/fzf-lua',
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("fzf-lua").setup({
            defaults = {
                git_icons = false,
                file_icons = false,
                color_icons = false,
                },
                file_ignore_patterns = {"%.nc","%.h5","%.dat"},
        })
        vim.keymap.set('n', '<leader>ff', require("fzf-lua").files, { desc = '[f]ind [f]iles' })
        vim.keymap.set('n', '<leader>fg', require("fzf-lua").live_grep, { desc = '[f]ind by [g]rep' })
        vim.keymap.set('n', '<leader>fh', require("fzf-lua").helptags, { desc = '[f]ind [h]elp' })
        vim.keymap.set('n', '<leader>fb', require("fzf-lua").buffers ,{ desc = '[f]ind existing [b]uffers' })
        vim.keymap.set('n', '<leader>fk', require("fzf-lua").keymaps, { desc = '[f]ind [k]eymaps' })
        vim.keymap.set('n', '<leader>fc', require("fzf-lua").git_bcommits , { desc = '[f]ind [c]ommits for file' })

        vim.keymap.set('n', '<leader>z', require("fzf-lua").spell_suggest, { desc = 'Spelling suggestions' })

        vim.keymap.set('n', '<leader>gs', require("fzf-lua").git_status, { desc = '[g]it [s]tatus' })
    end
    },
}
