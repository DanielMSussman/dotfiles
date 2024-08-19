local autogroup = vim.api.nvim_create_augroup

--do I understand autogroups? not really. I guess it's about disabling whole groups of them at a time?
local sussmanGroup = autogroup('DMS',{})
local vimtexGroup = vim.api.nvim_create_augroup("vimtex_events", {})
local yankGroup = autogroup('HighlightYank', {})

local autocmd=vim.api.nvim_create_autocmd

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
        vim.cmd('VimtexView')
        vim.cmd('sleep 100m') -- tweak per hardware...a bit janky
        vim.cmd('!open -a wezterm')
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
        local id = MiniNotify.add('VimTex: Compilation finished','INFO')
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
