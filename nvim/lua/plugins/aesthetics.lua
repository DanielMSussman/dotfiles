return {
    --a few color schemes... the default one should apparently get high priority
    {
        "rebelot/kanagawa.nvim",
        priority=1000,
        config = function()
            vim.o.pumblend = 0
            local colors = require("kanagawa.colors")
            require('kanagawa').setup({
                overrides = function()
                    local theme = colors.theme
                    return {
                     Pmenu = { fg = colors.fg_dark, bg = colors.bg_light0, blend = vim.o.pumblend },
                     PmenuSel = { fg = "NONE", bg = colors.bg_light1, blend =0 },
                     PmenuSbar = { bg = colors.bg_dim },
                     PmenuThumb = { bg = colors.bg_light1 },

                    TelescopeNormal = { bg = colors.bg_dim },
                    TelescopeBorder = { fg = colors.bg_dim, bg = colors.bg_dim},
                    TelescopeTitle = { fg = colors.bg_light3, bold=true},

                    TelescopePromptNormal = { bg = colors.bg_light0 },
                    TelescopePromptBorder = { fg = colors.bg_light0, bg = colors.bg_light0},

                    TelescopeResultsNormal = { bg = "#1a1a22" },
                    TelescopeResultsBorder = { fg = "#1a1a22", bg = "#1a1a22" },

                    TelescopePreviewNormal = { bg = colors.bg_dim },
                    TelescopePreviewBorder = { bg = colors.bg_dim, fg = colors.bg_dim }
                }
                        end
            })
            vim.cmd.colorscheme "kanagawa"
        end
    },

    --lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup({
                options = {
                    refresh = {statusline = 1000, tabline = 1000, winbar = 1000}
                    },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {{
                        'filename',
                        newfile_status = true,  -- Display new file status (new file means no write after created)
                        path = 1,                -- 0: Just the filename

                        shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                                }},
                    lualine_x = {
                        function()
                            local ok, pomo = pcall(require, "pomo")
                            if not ok then
                                return ""
                            end

                            local timer = pomo.get_first_to_finish()
                            if timer == nil then
                                return ""
                            end

                            return "󰄉 " .. tostring(timer)
                        end,
                        "fileformat",
                        "filetype",
                    },
                    lualine_y = {'progress'},
                    lualine_z = {'location'},
                },    
            })
        end
    },


}

