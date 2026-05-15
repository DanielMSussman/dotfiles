vim.pack.add({ "https://github.com/nvim-mini//mini.pick" })
vim.pack.add({ "https://github.com/nvim-mini//mini.extra" })

require('mini.pick').setup({
    window = {
        config = function()
            local height = math.floor(vim.o.lines * 0.45)
            local width = math.floor(vim.o.columns * 0.8)
            return {
                relative = 'editor',
                anchor = 'NW',
                height = height,
                width = width,
                row = math.floor((vim.o.lines - height) / 2),
                col = math.floor((vim.o.columns - width) / 2),
                border = 'rounded',
            }
        end,
    }
})
require('mini.extra').setup()

-- set up keymaps
local pick = require('mini.pick')
local extra = require('mini.extra')

-- core files and text
vim.keymap.set('n', '<leader>ff', pick.builtin.files, { desc = '[f]ind [f]iles' })
vim.keymap.set('n', '<leader>fg', pick.builtin.grep_live, { desc = '[f]ind by [g]rep' })
vim.keymap.set('n', '<leader>fb', pick.builtin.buffers, { desc = '[f]ind existing [b]uffers' })
vim.keymap.set('n', '<leader>fh', pick.builtin.help, { desc = '[f]ind [h]elp' })
vim.keymap.set('n', '<leader>fr', pick.builtin.resume, { desc = '[f]ind [r]esume (last picker)' })

vim.keymap.set('n', '<leader>f.', extra.pickers.oldfiles, { desc = '[f]ind Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>fk', extra.pickers.keymaps, { desc = '[f]ind [k]eymaps' })
vim.keymap.set('n', '<leader>fd', extra.pickers.diagnostic, { desc = '[f]ind [d]iagnostics' })
vim.keymap.set('n', '<leader>z', extra.pickers.spellsuggest, { desc = 'Spelling suggestions' })
