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
                transparent=true,
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
tabline = {
  lualine_a = {
    {
      'buffers',
      show_filename_only = true,   -- Shows shortened relative path when set to false.
      hide_filename_extension = false,   -- Hide filename extension when set to true.
      show_modified_status = true, -- Shows indicator when the buffer is modified.

      mode = 0, -- 0: Shows buffer name
                -- 1: Shows buffer index
                -- 2: Shows buffer name + buffer index
                -- 3: Shows buffer number
                -- 4: Shows buffer name + buffer number

      max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
                                          -- it can also be a function that returns
                                          -- the value of `max_length` dynamically.
      filetype_names = {
        TelescopePrompt = 'Telescope',
        dashboard = 'Dashboard',
        packer = 'Packer',
        fzf = 'FZF',
        alpha = 'Alpha'
      }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

      -- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
      use_mode_colors = false,

      buffers_color = {
        -- Same values as the general color option can be used here.
        active = 'lualine_{section}_normal',     -- Color for active buffer.
        inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
      },

      symbols = {
        modified = ' ●',      -- Text to show when the buffer is modified
        alternate_file = '#', -- Text to show to identify the alternate file
        directory =  '',     -- Text to show when the buffer is a directory
      },
    }
  }
},
            })
        end
    },
}

