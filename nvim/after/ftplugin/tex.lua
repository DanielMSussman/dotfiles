-- a set of localleader keymaps I call a lot
vim.keymap.set('n','<localleader>b',':VimtexCompileSS<CR>',{noremap=true, desc="VimTex: single-shot compile"})
    vim.keymap.set('n','<localleader>c',':VimtexCompile<CR>',{noremap=true, desc="VimTex: continuous compile"})
    vim.keymap.set('n','<localleader>Z',':VimtexStopAll<CR>',{noremap=true, desc="VimTex: stop all compilation"})

    vim.keymap.set('n','<localleader>o',':VimtexCompileSS<CR><bar>:VimtexCompileOutput<CR><bar>:wincmd J<CR><bar>:resize 10<CR>',{noremap=true, desc="VimTex: compile and see compilation log"})
    vim.keymap.set('n','<localleader>v',':VimtexView<CR>',{noremap=true, desc="VimTex: forward search"})
    
    vim.keymap.set('n','<localleader>t',':VimtexTocToggle<CR>',{noremap=true, desc="VimTex: toggle table of contents"})
    vim.keymap.set('n','<localleader>i',':VimtexInfo<CR>',{noremap=true, desc="VimTex: info"})
    vim.keymap.set('n','<localleader>x',':VimtexClean<CR>',{noremap=true, desc="VimTex: clean aux files"})
    vim.keymap.set('n','<localleader>X',':VimtexClean!<CR>',{noremap=true, desc="VimTex: clean aux files and output"})

local autocmd=vim.api.nvim_create_autocmd
autocmd({"BufEnter","BufRead","BufNewFile"},{
    group = vim.api.nvim_create_augroup('miniClues',{}),
    pattern = '*.tex',
    callback = function()
        -- add descriptions to miniclue
        local has_miniclue, miniclue = pcall(require, 'mini.clue')
        if not has_miniclue then end

        miniclue.set_mapping_desc('n','tsb','toggle line-break macro \\\\')
        miniclue.set_mapping_desc('n','tsc','toggle starred command')
        miniclue.set_mapping_desc('n','tsD','toggle \\left and \\right around delimiters')
        miniclue.set_mapping_desc('n','tsd','toggle \\left and \\right around delimiters')
        miniclue.set_mapping_desc('n','tse','toggle starred environment')
        miniclue.set_mapping_desc('n','tsf','toggle fraction form')
        miniclue.set_mapping_desc('n','ts$','toggle math environment')

        miniclue.set_mapping_desc('n','csc','change surrounding command')
        miniclue.set_mapping_desc('n','cse','change surrounding environment')
        miniclue.set_mapping_desc('n','csd','change surrounding delimiter')
        miniclue.set_mapping_desc('n','cs$','change surrounding math environment')

        miniclue.set_mapping_desc('n','dsc','delete surrounding command')
        miniclue.set_mapping_desc('n','dse','delete surrounding environment')
        miniclue.set_mapping_desc('n','dsd','delete surrounding delimiter')
        miniclue.set_mapping_desc('n','ds$','delete surrounding math environment')

        miniclue.set_mapping_desc('n','<localleader>li','VimTex: info')
        miniclue.set_mapping_desc('n','<localleader>lI','VimTex: info (full)')
        miniclue.set_mapping_desc('n','<localleader>lt','VimTex: open table of contents')
        miniclue.set_mapping_desc('n','<localleader>lT','VimTex: toggle ToC')
        miniclue.set_mapping_desc('n','<localleader>lq','VimTex: log')
        miniclue.set_mapping_desc('n','<localleader>lv','VimTex: view')
        miniclue.set_mapping_desc('n','<localleader>ll','VimTex: compile')
        miniclue.set_mapping_desc('n','<localleader>lL','VimTex: compile selected')
        miniclue.set_mapping_desc('n','<localleader>lk','VimTex: Stop compilation')
        miniclue.set_mapping_desc('n','<localleader>lK','VimTex: Stop all compilation')
        miniclue.set_mapping_desc('n','<localleader>le','VimTex: errors')
        miniclue.set_mapping_desc('n','<localleader>lo','VimTex: compiler output')
        miniclue.set_mapping_desc('n','<localleader>lg','VimTex: status')
        miniclue.set_mapping_desc('n','<localleader>lG','VimTex: status (all)')
        miniclue.set_mapping_desc('n','<localleader>lc','VimTex: clean')
        miniclue.set_mapping_desc('n','<localleader>lC','VimTex: clean files and outputs')
        miniclue.set_mapping_desc('n','<localleader>lx','VimTex: reload')
        miniclue.set_mapping_desc('n','<localleader>lX','VimTex: reload state')
        miniclue.set_mapping_desc('n','<localleader>ls','VimTex: toggle the main tex file')
        miniclue.set_mapping_desc('n','<localleader>la','VimTex: open context menu relevant to cursor location')

    end
})
