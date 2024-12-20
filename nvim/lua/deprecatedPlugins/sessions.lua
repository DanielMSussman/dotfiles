return {
    {
        "Shatur/neovim-session-manager",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local Path = require('plenary.path')
            local config = require('session_manager.config')
            require('session_manager').setup({
                --save sessions on the nvim data path
                sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), 
                autoload_mode = config.AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments.
                autosave_last_session = false, -- Automatically save last session on exit and on session switch.
                autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
                autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
                autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
                    'gitcommit',
                    'gitrebase',
                },
                autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
                autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
                max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
            })
            --session  management
            vim.keymap.set('n','<leader>ss',function()
                vim.cmd("SessionManager save_current_session")
                vim.notify("Session saved")
            end,
                {noremap=true,desc = "[s]ave current session"})
            vim.keymap.set('n','<leader>sd',function()
                vim.cmd("SessionManager delete_session")
                vim.notify("Session deleted")
            end,
                {noremap=true,desc = "[d]elete session (picker)"})

            vim.keymap.set('n','<leader>sl',function()
                vim.cmd("SessionManager load_session")
                vim.notify("Session loaded")
            end,
                {noremap=true,desc = "[l]oad session"})
            vim.keymap.set('n','<leader>sx',function()
                vim.cmd("SessionManager save_current_session")
                vim.notify("Session saved")
                vim.cmd("wqa<CR>")
            end,
                {noremap=true,desc = "save session and e[x]it"})
        end
    },
}
