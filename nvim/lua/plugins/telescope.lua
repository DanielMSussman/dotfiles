--finding files by text string is nice...live grepping in large projects is awesome
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim',
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-bibtex.nvim",
	},
    config = function()
        require('telescope').setup({
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
		['bibtex'] = {
					depth = 1,
					global_files = {}, -- Path to global bibliographies (placed outside of the project)
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

		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[f]ind [h]elp' })
		vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[f]ind [k]eymaps' })
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[f]ind [f]iles' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[f]ind by [g]rep' })
		vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[f]ind [d]iagnostics' })
		vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[f]ind [r]esume' })
		vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[f]ind Recent Files ("." for repeat)' })
		vim.keymap.set('n', '<leader>fb' builtin.buffers, { desc = '[f]ind existing [b]uffers' })

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
