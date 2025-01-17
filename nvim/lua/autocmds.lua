local autogroup = vim.api.nvim_create_augroup
local autocmd=vim.api.nvim_create_autocmd

--do I understand autogroups? not really. I guess it's about disabling whole groups of them at a time?
local sussmanGroup = autogroup('DMS',{})
local vimtexGroup = vim.api.nvim_create_augroup("vimtex_events", {})
local yankGroup = autogroup('HighlightYank', {})


--call that function when moving between windows
autocmd({"WinEnter","WinLeave"},{
    group=autogroup("windowSettings", {clear = false}),
    pattern = "*",
    callback = function ()
        local current_win = vim.api.nvim_get_current_win()
        local all_wins = vim.api.nvim_list_wins()

        for _, wind in ipairs(all_wins) do
            if wind == current_win then
                vim.api.nvim_set_option_value("relativenumber",true,{scope="local",win=wind})
            else
                vim.api.nvim_set_option_value("relativenumber",false,{scope="local",win=wind})
            end
        end
    end
})

-- resize splits if the window itself is resized
autocmd('VimResized',{
        group=sussmanGroup,
        callback = function()
            local currentTab=vim.fn.tabpagenr()
            vim.cmd("tabdo wincmd =")
            vim.cmd("tabnext " .. currentTab)
        end
})

--briefly (140ms) highlight text that gets yanked
autocmd('TextYankPost',{
        group=yankGroup,
        pattern = '*',
        callback = function()
            vim.highlight.on_yank({
                higroup = 'IncSearch',
                timeout=140,
                })
            end,
})

--enter files where I left off
autocmd({"BufWinLeave", "BufWritePost", "WinLeave" },{
    desc = "save view for files",
    callback = function(event)
        if vim.b[event.buf].view_activated then
           vim.cmd.mkview { mods = { emsg_silent = true } }
        end
    end,
})

autocmd("BufWinEnter",{
    desc = "open where we left off",
        callback = function(event)
            if not vim.b[event.buf].view_activated then
            local filetype = vim.bo[event.buf].filetype
            local buftype = vim.bo[event.buf].buftype
            local ignore_filetypes = { "gitcommit", "gitrebase", "svg", "hgcommit" }
            if buftype == "" and filetype and filetype ~= "" and not vim.tbl_contains(ignore_filetypes, filetype) then
            vim.b[event.buf].view_activated = true
        vim.cmd.loadview { mods = { emsg_silent = true } }
    end
        end
        end,
})

-- after loading a session, check if the session is at the root of a git repo, then fetch to check status relative to remote
autocmd("User",{
    group=sussmanGroup,
    pattern="SessionLoadPost",
    callback = function()
        local path = vim.loop.cwd() .. "/.git"
        local ok, err = vim.loop.fs_stat(path)
        if ok then
            update_currentGitStatus()
        else
            vim.notify("Session not at the root directory of a git repo")
        end
    end
})

--after inverse search, focus back on the nvim terminal and center line on screen
autocmd("User", {
    pattern = "VimtexEventViewReverse",
    group = vimtexGroup,
    callback = function() 
       --"call b:vimtex.viewer.xdo_focus_vim()" --
        vim.cmd('!open -a wezterm')
        vim.cmd('redraw')
        vim.cmd("normal zz")
    end
    }
)

--after compilation, return focus to terminal
vim.api.nvim_create_autocmd("User", {
    pattern = "VimtexEventCompileSuccess",
    group = vimtexGroup,
    callback =  function()
        -- vim.cmd('VimtexView')
        -- vim.cmd('sleep 100m') -- tweak per hardware...a bit janky
        -- --vim.cmd('!goto wezterm')
        -- vim.cmd('!open -a wezterm')
    end
    }
)

--
-- completely frivolous notifications about vimtex compilation progress
--
vim.api.nvim_create_autocmd("User", {
    pattern = "VimtexEventCompileSuccess",
    group = vimtexGroup,
    callback =  function()
        vimtexCompileDuration = os.difftime(os.time(),vimtexStartTime)
        local id = MiniNotify.add('VimTex: Compilation finished after '..tostring(vimtexCompileDuration)..'s','INFO')
         vim.defer_fn(function() MiniNotify.remove(id) end, 2000)
    end
    }
)

vim.api.nvim_create_autocmd("User", {
    pattern = {"VimtexEventCompileStarted","VimtexEventCompiling"},
    group = vimtexGroup,
    callback =  function()
        local id = MiniNotify.add('VimTex: Compilation started','INFO')
        vim.defer_fn(function() MiniNotify.remove(id) end, 2000)
        vimtexStartTime = os.time()
    end
    }
)
vim.api.nvim_create_autocmd("User", {
    pattern = "VimtexEventCompileFailed",
    group = vimtexGroup,
    callback =  function()
        local id = MiniNotify.add('VimTex: Compilation FAILED','ERROR')
         vim.defer_fn(function() MiniNotify.remove(id) end, 4000)
    end
    }
)
