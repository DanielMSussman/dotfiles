return { 
    --notify
    { 'echasnovski/mini.notify', version = '*',
        event = "VimEnter",
        config = function()
            local mininotify=require('mini.notify')
            mininotify.setup({
                -- Content management
                content = {
                    -- Function which formats the notification message
                    -- By default prepends message with notification time
                    format = nil,

                    -- Function which orders notification array from most to least important
                    -- By default orders first by level and then by update timestamp
                    sort = nil,
                },

                -- Notifications about LSP progress
                lsp_progress = {
                    -- Whether to enable showing
                    enable = true,

                    -- Duration (in ms) of how long last message should be shown
                    duration_last = 1000,
                },

                -- Window options
                window = {
                    -- Floating window config
                    config = win_config,

                    -- Maximum window width as share (between 0 and 1) of available columns
                    max_width_share = 0.382,

                    -- Value of 'winblend' option
                    winblend = 25,
                },
                --                window = { config = win_config } ,
            }
            )
            vim.notify = mininotify.make_notify({
                })
        end

    },
    -- clue
    { 'echasnovski/mini.clue', version = '*', 
        event = "VimEnter",
        config = function() local
        miniclue = require('mini.clue')
        miniclue.setup({
            triggers = {
                -- Leader triggers
                { mode = 'n', keys = '<Leader>' },
                { mode = 'x', keys = '<Leader>' },
                -- local Leader triggers
                { mode = 'n', keys = '<LocalLeader>' },

                -- toggle triggers (vimtex)
                {mode = 'n',keys='t'},
                {mode = 'n',keys='c'},
                {mode = 'n',keys='d'},

                -- normal mode control functions
                { mode = 'n', keys = '<C-x>' },
                -- Built-in completion
                { mode = 'i', keys = '<C-x>' },

                -- `g` key
                { mode = 'n', keys = 'g' },
                { mode = 'x', keys = 'g' },

                -- Marks
                { mode = 'n', keys = "'" },
                { mode = 'n', keys = '`' },
                { mode = 'x', keys = "'" },
                { mode = 'x', keys = '`' },

                -- Registers
                { mode = 'n', keys = '"' },
                { mode = 'x', keys = '"' },
                { mode = 'i', keys = '<C-r>' },
                { mode = 'c', keys = '<C-r>' },

                -- Window commands
                { mode = 'n', keys = '<C-w>' },

                -- `z` key
                { mode = 'n', keys = 'z' },
                { mode = 'x', keys = 'z' },
            },
            window = {
                config = {width = 50,
                        },
                delay = 100,
                },
            clues = {
                -- Enhance this by adding descriptions for <Leader> mapping groups
                --miniclue.gen_clues.builtin_completion(),
                miniclue.gen_clues.g(),
                miniclue.gen_clues.marks(),
                miniclue.gen_clues.registers(),
                miniclue.gen_clues.windows(),
                miniclue.gen_clues.z(),
            { mode = 'n', keys = '<Leader>f', desc = '(telescope [f]ind commands)' },
            { mode = 'n', keys = '<Leader>g', desc = '([g]it commands)' },
            { mode = 'n', keys = '<Leader>l', desc = '([L]SP commands)' },
            { mode = 'n', keys = '<localLeader>o', desc = '([o]bsidian and md commands)' },
            { mode = 'n', keys = '<Leader>s', desc = '([S]ession management)' },
            { mode = 'n', keys = '<Leader>t', desc = '([t]imer sessions)' },
            { mode = 'n', keys = '<localLeader>l', desc = '(additional [l]atex/VimTex commands)' },
            { mode = 'n', keys = '<Leader>x', desc = '([x]  Trouble commands)' },
            { mode = 'n', keys = '<C-x><C-n>', desc = 'neotree show filesystem'},

            --completion clues
            { mode = 'i', keys = '<C-x><Tab>', desc = 'completion and snippet jump' },
            { mode = 'i', keys = '<C-x><S-Tab>', desc = 'completion and snippet jump back' },
            { mode = 'i', keys = '<C-x><C-e>', desc = 'exit completion menu'},
            { mode = 'i', keys = '<C-x><C-k>', desc = 'expand luasnip'},
            { mode = 'i', keys = '<C-x><C-J>', desc = 'next luansip segment <C-j>'},
            { mode = 'i', keys = '<C-x><C-l>', desc = 'prev luasnip segment'},
            }
        })
        end
    },
}
