vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set wrap linebreak")
vim.cmd("set ruler")

vim.cmd("set hidden")

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set autoindent")
vim.cmd("set smartindent")

vim.cmd("set incsearch")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.cmd("set inccommand")

vim.cmd("set termguicolors")

vim.cmd("set spell spelllang=en_us")

vim.cmd("set clipboard=unnamedplus")

vim.cmd("set noerrorbells")

vim.cmd("set mouse=a")

vim.cmd("set history=1000")
vim.cmd("set scrolloff=8")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- open a small terminal window at the bottom, and start it in insert mode
vim.keymap.set('n', '<C-z>', ':sp<bar>term<cr><c-w>J:resize8<cr>i',{noremap = true, desc = "open terminal"})
--when in terminal mode, ESC gets back to normal mode
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>',{noremap = true})

-- convenient, if janky, map for formatting some of my existing text
vim.keymap.set('n','<C-q>','V:!fmt -s -w80 <CR>',{noremap = true, desc = "call fmt on text"})
vim.keymap.set('v','<C-q>',':!fmt -s -w80 <CR>',{noremap = true, desc = "call fmt on text"})


-- LSP and diagnostic section
-- Displays hover information about the symbol under the cursor
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>',{noremap = true, desc = 'LSP: hover information'})

-- Jump to the definition
vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>',{noremap = true, desc = 'LSP: jump to definition'})

-- Jump to declaration
vim.keymap.set('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>',{noremap = true, desc = 'LSP: jump to declaration'})

-- Lists all the references 
vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>',{noremap = true, desc = 'LSP: list all references of symbol'})

-- Renames all references to the symbol under the cursor
vim.keymap.set('n', '<leader>ln', '<cmd>lua vim.lsp.buf.rename()<cr>',{noremap = true, desc = 'LSP: rename all references to symbol'})

-- jump to next diagnostic 
vim.keymap.set('n','<leader>n',vim.diagnostic.goto_next, {desc = 'Next warning or error'})
-- toggle a floating window with error message
vim.keymap.set('n', '<leader>e', function()
    -- If we find a floating window, close it.
    local found_float = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative ~= '' then
            vim.api.nvim_win_close(win, true)
            found_float = true
        end
    end

    if found_float then
        return
    end

    vim.diagnostic.open_float(nil, { focus = false, scope = 'cursor' })
end, { desc = 'Toggle Diagnostics' })
