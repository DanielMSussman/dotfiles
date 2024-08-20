vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--vim-fugitive
vim.keymap.set('n','<leader>gs',':Git<CR>',{noremap=true,desc ='git status'})
vim.keymap.set('n','<leader>gc',':Git commit -am "',{noremap=true,desc ='git commit -am'})
vim.keymap.set('n','<leader>gp',':Git push <CR>',{noremap=true,desc ='git push'})


vim.keymap.set("n","<leader>p",'\"0p',{desc = 'paste last yank'})
vim.keymap.set("n","<leader>P",'\"0P',{desc = 'Paste last yank'})

vim.keymap.set("n","<leader>s","a<C-x>s",{noremap = true, desc = 'drop-down spelling suggestion of word under cursor'})

vim.keymap.set("n", "<C-d>", "<C-d>zz",{desc = 'move down and center'})
vim.keymap.set("n", "<C-u>", "<C-u>zz",{desc = 'move up and center'})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc ='switch the current line with the one below'})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv",{desc = 'switch current  line with the one above'})

-- open a small terminal window at the bottom, and start it in insert mode
vim.keymap.set('n', '<C-z>', ':sp<bar>term<cr><c-w>J:resize8<cr>i',{noremap = true, desc = "open terminal"})
--when in terminal mode, ESC gets back to normal mode
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>',{noremap = true})

--clean up carriage returns from windows
vim.keymap.set('n','<leader>z',':%s/\r//<CR>',{noremap=true,desc = 'delete dos encoding carriage returns'})

-- LSP and diagnostic section
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>',{noremap = true, desc = 'LSP: hover information'})
vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>',{noremap = true, desc = 'LSP: jump to definition'})
vim.keymap.set('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>',{noremap = true, desc = 'LSP: jump to declaration'})
vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>',{noremap = true, desc = 'LSP: list all references of symbol'})
vim.keymap.set('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<cr>',{noremap = true, desc = 'LSP: select code action available at cursor'})
vim.keymap.set('n', '<leader>ln', '<cmd>lua vim.lsp.buf.rename()<cr>',{noremap = true, desc = 'LSP: rename all references to symbol'})

vim.keymap.set('n','[d',vim.diagnostic.goto_next, {desc = 'Next warning or error'})
vim.keymap.set('n',']d',vim.diagnostic.goto_prev, {desc = 'Next warning or error'})

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

-- obsidian
vim.keymap.set('n','<localleader>ov',':ObsidianOpen<CR>',
    {noremap=true, desc="Obsidian: view in app"})
vim.keymap.set('n','<localleader>on',':ObsidianNew<CR>',
    {noremap=true, desc="Obsidian: new note"})
vim.keymap.set('n','<localleader>of',':ObsidianFollowLink vsplit<CR>',
    {noremap=true, desc="Obsidian: follow link in split"})
vim.keymap.set('n','<localleader>ob',':ObsidianBacklinks<CR>',
    {noremap=true, desc="Obsidian: list backlinks"})
vim.keymap.set('n','<localleader>ot',':ObsidianTemplate<CR>',
    {noremap=true, desc="Obsidian: template picker"})

vim.keymap.set('v','L',':ObsidianLinkNew<CR>',
    {noremap=true, desc="Obsidian: create new note from selected text"})
