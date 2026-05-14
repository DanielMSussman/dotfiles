vim.pack.add({ 'https://github.com/nvim-mini/mini.notify' })
vim.pack.add({ 'https://github.com/nvim-mini/mini.clue' })
vim.pack.add({ 'https://github.com/nvim-mini/mini.statusline' })

-- mini.notify setup
local mininotify = require('mini.notify')
mininotify.setup({
    content = {
        format = nil,
        sort = nil,
    },
    lsp_progress = {
        enable = true,
        duration_last = 1000,
    },
    window = {
        config = win_config,
        max_width_share = 0.382,
        winblend = 25,
    },
})
vim.notify = mininotify.make_notify({})

-- mini.clue setup
local miniclue = require('mini.clue')
miniclue.setup({
    triggers = {
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
        { mode = 'n', keys = '<LocalLeader>' },
        { mode = 'n', keys = 't' },
        { mode = 'n', keys = 'c' },
        { mode = 'n', keys = 'd' },
        { mode = 'i', keys = '<C-x>' },
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },
        { mode = 'n', keys = '<C-w>' },
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
    },
    window = {
        delay = 100,
        config = { width = 50 },
    },
    clues = {
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        { mode = 'n', keys = '<Leader>f', desc = '(Find commands)' },
        { mode = 'n', keys = '<Leader>g', desc = '(Git commands)' },
        { mode = 'n', keys = '<Leader>c', desc = '(Conform / formatting)' },
        { mode = 'n', keys = '<Leader>l', desc = '(LSP commands)' },
        { mode = 'n', keys = '<localLeader>l', desc = '(LaTeX/VimTex)' },

        -- Completion clues
        { mode = 'i', keys = '<C-x><Tab>', desc = 'completion and snippet jump' },
        { mode = 'i', keys = '<C-x><S-Tab>', desc = 'completion and snippet jump back' },
        { mode = 'i', keys = '<C-x><C-e>', desc = 'exit completion menu'},
        { mode = 'i', keys = '<C-x><C-k>', desc = 'expand luasnip'},
        { mode = 'i', keys = '<C-x><C-J>', desc = 'next luansip segment <C-j>'},
        { mode = 'i', keys = '<C-x><C-l>', desc = 'prev luasnip segment'},
    }
})

-- mini.statusline setup
local statusline = require('mini.statusline')

local fileinfo = function()
    local filetype = vim.bo.filetype
    local devicons = require('nvim-web-devicons')
    local icon = devicons.get_icon(vim.fn.expand('%:t'), nil, { default = true }) .. ' '
    return string.format('%s%s', icon, filetype)
end

local contents = function()
    local mode, mode_hl = statusline.section_mode({ trunc_width = 50 })
    local diagnostics   = statusline.section_diagnostics({ trunc_width = 75 })
    local lsp           = statusline.section_lsp({ trunc_width = 75 })
    local filename      = statusline.section_filename({ trunc_width = 100 })
    local location      = '%l,%2v'
    local search        = statusline.section_searchcount({ trunc_width = 75 })

    return statusline.combine_groups({
        { hl = mode_hl,                  strings = { mode } },
        { hl = 'MiniStatuslineDevinfo',  strings = { diagnostics, lsp } },
        '%<', -- Mark general truncate point
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        '%=', -- End left alignment
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo() } },
        { hl = mode_hl,                  strings = { search, location } },
    })
end

statusline.setup({
    content = { active = contents },
})
