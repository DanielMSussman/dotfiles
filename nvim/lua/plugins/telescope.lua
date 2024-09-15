--finding files by text string is nice...live grepping in large projects is awesome
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim',
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-bibtex.nvim",
    },
    keys = {"<leader>"}, -- leader f for usual functionality, s if we're in the start screen
--    event = {"VimEnter"},
    lazy=true,
    config = function()
        require('telescope').setup({
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
                ['bibtex'] = {
                    depth = 1,
                    global_files = {'~/repos/dotfiles/bibtex/zoteroBBT.bib'}, -- Path to global bibliographies (placed outside of the project)
                    search_keys = { 'author', 'year', 'title' },-- Define the search keys to use in the picker
                    citation_format = '{{author}} ({{year}}), {{title}}.',
                    -- Template for the formatted citation
                    citation_trim_firstname = true,
                    -- Only use initials for the authors first name
                    citation_max_auth = 2,
                    -- Max number of authors to write in the formatted citation
                    -- following authors will be replaced by "et al."
                    custom_formats = {
                        { id = 'cite', cite_maker = '\\cite{%s}' }
                    },
                    -- Custom format for citation label
                    format = 'cite',
                    -- Format to use for citation label.
                    -- Try to match the filetype by default, or use 'plain'
                    context = true,
                    -- Context awareness disabled by default
                    context_fallback = true,
                    -- Fallback to global/directory .bib files if context not found
                    -- This setting has no effect if context = false
                    wrap = false,
                    -- Wrapping in the preview window is disabled by default
                }
            },
        })
        pcall(require('telescope').load_extension, 'ui-select')
        pcall(require('telescope').load_extension, 'bibtex')
        builtin = require("telescope.builtin")
        local  dropdown = require('telescope.themes').get_dropdown()
        vim.keymap.set('n', '<leader>fh', function() builtin.help_tags(dropdown) end, { desc = '[f]ind [h]elp' })
        vim.keymap.set('n', '<leader>fk', function() builtin.keymaps(dropdown) end, { desc = '[f]ind [k]eymaps' })
        vim.keymap.set('n', '<leader>ff', function() builtin.find_files(dropdown) end, { desc = '[f]ind [f]iles' })
        vim.keymap.set('n', '<leader>fg', function() builtin.live_grep(dropdown) end, { desc = '[f]ind by [g]rep' })
        vim.keymap.set('n', '<leader>fd', function() builtin.diagnostics(dropdown) end, { desc = '[f]ind [d]iagnostics' })
        vim.keymap.set('n', '<leader>fr', function() builtin.resume(dropdown) end, { desc = '[f]ind [r]esume' })
        vim.keymap.set('n', '<leader>f.', function() builtin.oldfiles(dropdown) end, { desc = '[f]ind Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader>fb', function() builtin.buffers(dropdown) end, { desc = '[f]ind existing [b]uffers' })

        -- Slightly advanced example of overriding default behavior and theme
        vim.keymap.set('n', '<leader>fs', function()
            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[F]uzzily [s]earch in current buffer' })
    end,
}
