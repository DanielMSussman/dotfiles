--vim-fugitive
vim.keymap.set('n','<leader>gs',':Git<CR>',{noremap=true,desc ='git status'})
vim.keymap.set('n','<leader>ga',':Git add ',{noremap=true,desc ='git add '})
vim.keymap.set('n','<leader>gA',':Git add .<CR>',{noremap=true,desc ='git add .'})
vim.keymap.set('n','<leader>gc',':Git commit -am "',{noremap=true,desc ='git commit -am'})
vim.keymap.set('n','<leader>gp',':Git push <CR>',{noremap=true,desc ='git push'})
--gitsigns
            vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {noremap=true,desc = "Gitsigns: preview hunk"})
            vim.keymap.set("n", "<leader>gi", ":Gitsigns preview_hunk_inline<CR>", {noremap=true,desc = "Gitsigns: preview hunk inline"})


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

-- LSP and diagnostic section (as an autocomplete)
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
        local map = function(keys,func,desc)
            vim.keymap.set('n',keys,func,{buffer = event.buf,desc='LSP: ' .. desc})
        end
        map('gd', require('telescope.builtin').lsp_definitions, '[g]oto [d]efinition')
        map('gD', require('telescope.builtin').lsp_definitions, '[g]oto [D]eclaration')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>ln',vim.lsp.buf.rename,'[r]e[n]ame all references to symbol')
        map('gr', require('telescope.builtin').lsp_references, '[g]oto [r]eferences')
        map('<leader>c',vim.lsp.buf.code_action,'[c]ode action')
        map('[K]',vim.lsp.buf.hover,'[K] hover information')
    end
})
vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })

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

-- pomodoro
require("telescope").load_extension("pomodori")

vim.keymap.set("n", "<leader>tt", function()
  require("telescope").extensions.pomodori.timers()
end, { desc = "Manage Pomodori Timers"})
vim.keymap.set('n','<leader>tc',':TimerSession classicPomodoro<CR>',{noremap = true, desc = 'start 4 pomodoros'})
vim.keymap.set('n','<leader>tp',':TimerSession pomodoroPod<CR>',{noremap = true, desc = 'start 1 pomodoro'})
vim.keymap.set('n','<leader>th',':TimerSession pomodoroHour<CR>',{noremap = true, desc = 'start 2 pomodoros'})
