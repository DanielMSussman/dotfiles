
vim.keymap.set("n","<S-h>" ,"ge",{noremap=true,desc="go to the end of last word"})
--vim.keymap.set("n","<leader>p",'\"0p',{desc = 'paste last yank'})
--vim.keymap.set("n","<leader>P",'\"0P',{desc = 'Paste last yank'})

vim.keymap.set("n", "<C-d>", "<C-d>zz",{desc = 'move down and center'})
vim.keymap.set("n", "<C-u>", "<C-u>zz",{desc = 'move up and center'})
vim.keymap.set("n", "n", "nzzzv",{desc = 'find next, center, and open any fold'})
vim.keymap.set("n", "N", "Nzzzv",{desc = 'find prev, center, and open any  fold'})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv",{desc ='move current line(s) down'})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv",{desc = 'move current line(s) up'})

vim.keymap.set("n","<leader>r",':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>',{desc="find and [r]eplace word under cursor"})

vim.keymap.set("n","gn",":bnext<cr>",{desc='next buffer'})
vim.keymap.set("n","gp",":bprev<cr>",{desc='prev buffer'})
vim.keymap.set("n","gq",":bdelete<cr>",{desc='delete buffer'})

-- open a small terminal window at the bottom, and start it in insert mode
vim.keymap.set('n', '<C-z>', ':sp<bar>term<cr><c-w>J:resize8<cr>i',{noremap = true, desc = "open terminal"})
--when in terminal mode, ESC gets back to normal mode
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>',{noremap = true})

--
--plugin keymaps
--

--other git maps
vim.keymap.set("n","<leader>gr",function () vim.cmd("lua update_currentGitStatus()") end, {desc = "check [g]it [r]emote (fetch)"})-- calls a "fetch and notify" function

-- LSP and diagnostic section (as an autocomplete)
vim.keymap.set("n","<leader>ll", function() vim.cmd("LspStart") end, {desc="[l]aunch lsp (start)",noremap=true})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
        local map = function(keys,func,desc)
            vim.keymap.set('n',keys,func,{buffer = event.buf,desc='LSP: ' .. desc})
        end
        map('gd', require("telescope.builtin").lsp_definitions, '[g]oto [d]efinition')
        map('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
        map('gi', require("telescope.builtin").lsp_implementations, '[G]oto [i]mplementation')
        map('<leader>ls',vim.lsp.buf.signature_help,'[s]ignature help')
        map('<leader>lr',vim.lsp.buf.references,'[r]eferences')
        map('<leader>ln',vim.lsp.buf.rename,'re[n]ame all references to symbol')
        map('<leader>lc',vim.lsp.buf.code_action,'[c]ode action')
        map('<leader>ld',vim.diagnostic.open_float,'[d]iagnostic window for error or warning')
        map('[K]',vim.lsp.buf.hover,'[K] hover information')
        vim.keymap.set('n','<leader>q',vim.diagnostic.setloclist,{desc='[q]uickfix list'})
    end
})
vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                -- vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })

vim.keymap.set('n','[d',vim.diagnostic.goto_next, {desc = 'Next warning or error'})
vim.keymap.set('n',']d',vim.diagnostic.goto_prev, {desc = 'Next warning or error'})
