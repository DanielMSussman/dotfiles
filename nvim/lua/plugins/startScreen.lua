return  {
    {
        "goolord/alpha-nvim",
--        event  = "VimEnter",
        lazy = false,
        cond = function()
            return vim.api.nvim_buf_get_name(0) == ""
        end,
        dependencies  =  {
            "nvim-tree/nvim-web-devicons",
            "Shatur/neovim-session-manager",
            "nvim-neo-tree/neo-tree.nvim",
            'nvim-telescope/telescope.nvim'
        },
        config  =  function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")
            dashboard.section.header.val = {
                [[                               __                ]],
                [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
                [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
                [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
                [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            }
            dashboard.section.header.opts.hl = "Title"
            dashboard.section.buttons.val = {
                dashboard.button("s","  Sessions",":SessionManager load_session<CR>"),
                dashboard.button("e", "󰱼 Explorer",":Neotree filesystem reveal left<CR>"),
                dashboard.button("r", "󰈚  Recent", ":Telescope oldfiles <CR>"),
                dashboard.button("f", "  Find", ":Telescope find_files <CR>"),
                dashboard.button( "n", "  > New file" , ":ene <BAR> startinsert <CR>"),
                dashboard.button("p"," Plugins",":Lazy<CR>"),
                dashboard.button("q"," Quit",":qa!<CR>"),
            }

            alpha.setup(dashboard.opts)

            -- Set footer
            -- dashboard.section.footer.val = fortune
            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

                    -- local now = os.date "%d-%m-%Y %H:%M:%S"
                    local version = "neovim v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
                    -- local fortune = require "alpha.fortune"
                    -- local quote = table.concat(fortune(), "\n")
                    local plugins = "⚡Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                    local footer = version .. "\t" .. plugins -- .. "\n" .. quote
                    dashboard.section.footer.val = footer
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end
    },
}
