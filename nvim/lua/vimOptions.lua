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
vim.keymap.set('n', '<C-t>', ':sp<bar>term<cr><c-w>J:resize8<cr>i',{noremap = true, desc = "open terminal"})
--when in terminal mode, ESC gets back to normal mode
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>',{noremap = true})

-- convenient, if janky, map for formatting some of my existing text
vim.keymap.set('n','<C-q>','V:!fmt -s -w80 <CR>',{noremap = true, desc = "call fmt on text"})
vim.keymap.set('v','<C-q>',':!fmt -s -w80 <CR>',{noremap = true, desc = "call fmt on text"})


-- LSP and diagnostic section
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
