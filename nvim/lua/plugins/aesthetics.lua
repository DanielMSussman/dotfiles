return {
    --a few color schemes... the default one should apparently get high priority
    {
        "rebelot/kanagawa.nvim",
        priority=1000,
        config = function()
            local colors = require("kanagawa.colors")
            require('kanagawa').setup({
                undercurl = false,
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none"
                            }
                        }
                    }
                },
 --               transparent=true,
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        -- Save an hlgroup with dark background and dimmed foreground
                        -- so that you can use it where your still want darker windows.
                        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                        NormalFloat = { bg = "none" },
                        FloatBorder = { bg = "none" },
                        FloatTitle = { bg = "none" },
                        -- Popular plugins that open floats will link to NormalFloat by default;
                        -- set their background accordingly if you wish to keep them dark and borderless
                        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg},
                        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2, blend =0},
                        PmenuSbar = { bg = theme.ui.bg_m1 },
                        PmenuThumb = { bg = theme.ui.bg_p2 },

                        -- ridiculous tweaking of nvim-cmp completion menus
                        completionWindowNormal = {fg = theme.ui.shade0, bg=theme.ui.bg},
                        completionWindowCursorLine = {fg="NONE", bg = theme.ui.bg_p1, blend=0},
                        completionFloatBorder = { fg = theme.ui.shade0, bg = theme.ui.bg,blend=0},
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
        event = "VeryLazy",
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
                        path = 0,                -- 0: Just the filename

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

