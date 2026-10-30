local nematex_auto = false
local compiling = false
local nematex_timer = (vim.uv or vim.loop).new_timer()

local function compile_nematex()
    if compiling then
        return
    end
    compiling = true

    vim.cmd.write()

    local file = vim.api.nvim_buf_get_name(0)
    local start_time = (vim.uv or vim.loop).hrtime()

    vim.system(
        { vim.fn.expand('~/repos/cpptex/build/nematex'), '-S', file },
        { text = true },
        function(obj)
            compiling = false
            if not nematex_auto then
                local elapsed_ms = ((vim.uv or vim.loop).hrtime() - start_time) / 1e6

                vim.schedule(function()
                    if obj.code == 0 then
                        local time_str = elapsed_ms < 1000
                        and string.format('%.0f ms', elapsed_ms)
                        or string.format('%.2f s', elapsed_ms / 1000)

                        vim.notify(
                            'nematex finished in ' .. time_str,
                            vim.log.levels.INFO,
                            { title = 'nemaTeX' }
                        )
                    else
                        local err_msg = obj.stderr ~= '' and ('\n' .. obj.stderr) or ''
                        vim.notify(
                            'Compilation failed (code ' .. obj.code .. ')' .. err_msg,
                            vim.log.levels.ERROR,
                            { title = 'nemaTeX' }
                        )
                    end
                end)
            end
        end
    )
end

local group = vim.api.nvim_create_augroup('NemaTeXAutoCompile', { clear = true })

vim.keymap.set('n', '<localleader>N', function()
    nematex_auto = not nematex_auto

    if not nematex_auto then
        nematex_timer:stop()
    end

    vim.notify(
        'Auto-compile ' .. (nematex_auto and 'enabled' or 'disabled'),
        vim.log.levels.INFO,
        { title = 'nemaTeX' }
    )
end, { desc = '[n]emaTeX: Toggle auto-compile' })

vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
    group = group,
    pattern = '*.tex',
    callback = function()
        if not nematex_auto then
            return
        end

        nematex_timer:stop()
        nematex_timer:start(100, 0, vim.schedule_wrap(
            function()
                if nematex_auto then
                    compile_nematex()
                end
            end
        )
    )
end,
})

vim.keymap.set('n', '<localleader>n', compile_nematex, {
    desc = '[n]emaTeX: Save buffer and compile',
})
