local autogroup = vim.api.nvim_create_augroup
local autocmd=vim.api.nvim_create_autocmd

local sussmanGroup = autogroup('DMS',{})
local vimtexGroup = vim.api.nvim_create_augroup("vimtex_events", {})
local yankGroup = autogroup('HighlightYank', {})

-- active buffer has relative line numbers, others have absolute line numbers
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

--briefly highlight text that gets yanked
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
