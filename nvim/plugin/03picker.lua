vim.pack.add({ "https://github.com/nvim-mini//mini.pick" })
vim.pack.add({ "https://github.com/nvim-mini//mini.extra" })

require('mini.pick').setup({
    window = {
        config = {
            border = "rounded",
        }
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

-- Extra pickers replacing specific Telescope builtins
vim.keymap.set('n', '<leader>f.', extra.pickers.oldfiles, { desc = '[f]ind Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>fk', extra.pickers.keymaps, { desc = '[f]ind [k]eymaps' })
vim.keymap.set('n', '<leader>fd', extra.pickers.diagnostic, { desc = '[f]ind [d]iagnostics' })
vim.keymap.set('n', '<leader>z', extra.pickers.spellsuggest, { desc = 'Spelling suggestions' })
