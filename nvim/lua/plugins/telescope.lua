--finding files by text string is nice...live grepping in large projects is awesome
return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim',
        "nvim-telescope/telescope-ui-select.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
    },
    keys = {"<leader>"}, -- leader f for usual functionality
   -- event = {"VimEnter"},
    -- lazy=true,
    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = {
                    ".nb",
                },
            },
            extensions = {
                ['fzf'] = {},
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        })
        require('telescope').load_extension('fzf')
        pcall(require('telescope').load_extension, 'ui-select')
        builtin = require("telescope.builtin")
        local  dropdown = require('telescope.themes').get_dropdown()
        vim.keymap.set('n', '<leader>ff', function() builtin.find_files(dropdown) end, { desc = '[f]ind [f]iles' })
        vim.keymap.set('n', '<leader>fg', function() builtin.live_grep(dropdown) end, { desc = '[f]ind by [g]rep' })
        vim.keymap.set('n', '<leader>fh', function() builtin.help_tags(dropdown) end, { desc = '[f]ind [h]elp' })
        vim.keymap.set('n', '<leader>fb', function() builtin.buffers(dropdown) end, { desc = '[f]ind existing [b]uffers' })
        vim.keymap.set('n', '<leader>fr', function() builtin.resume(dropdown) end, { desc = '[f]ind [r]esume' })
        vim.keymap.set('n', '<leader>fk', function() builtin.keymaps(dropdown) end, { desc = '[f]ind [k]eymaps' })
        vim.keymap.set('n', '<leader>fd', function() builtin.diagnostics(dropdown) end, { desc = '[f]ind [d]iagnostics' })
        vim.keymap.set('n', '<leader>f.', function() builtin.oldfiles(dropdown) end, { desc = '[f]ind Recent Files ("." for repeat)' })

        vim.keymap.set('n', '<leader>z', builtin.spell_suggest, { desc = 'Spelling suggestions' })

        vim.keymap.set('n', '<leader>gc', builtin.git_bcommits , { desc = '[g]it [c]ommits for file' })
        vim.keymap.set('n', '<leader>gs', builtin.git_status , { desc = '[g]it [s]tatus' })

        -- example of overriding default behavior and theme
        vim.keymap.set('n', '<leader>fs', function()
            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[F]uzzily [s]earch in current buffer' })
    end,
}
