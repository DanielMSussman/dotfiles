return {
 	{ 'nvim-mini/mini.statusline', version = false,
    dependencies = { "nvim-tree/nvim-web-devicons"},
        config = function()
            local statusline = require('mini.statusline')
            local fileinfo      = function(args)
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
                -- local fileinfo      = statusline.section_fileinfo({ trunc_width = 80 })
                -- local location      = statusline.section_location({ trunc_width = 75 })
                --                       '%l|%L|%2v|%-2{virtcol("$") -1}'   
                local location = '%l,%2v'
                local search        = statusline.section_searchcount({ trunc_width = 75 })
                local infostring = fileinfo()
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
                content = {active = contents},
            })
        end
    },
}
