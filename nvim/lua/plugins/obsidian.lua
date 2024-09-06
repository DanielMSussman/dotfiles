return{
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        event = "VeryLazy",
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
            --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
            --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
            --   -- refer to `:h file-pattern` for more examples
            --   "BufReadPre path/to/my-vault/*.md",
            --   "BufNewFile path/to/my-vault/*.md",
            -- },
            dependencies = {
                -- Required.
                "nvim-lua/plenary.nvim",

                -- see below for full list of optional dependencies 
            },
            opts = {
                workspaces = {
                    {
                        name = "sussman",
                        path = "~/repos/obsidianNotes",
                    },
                    --{
                    --    name = "work",
                    --    path = "~/vaults/work",
                    --},
                    {
                    name = "no-vault",
                    path = function()
                        -- alternatively use the CWD:
                        -- return assert(vim.fn.getcwd())
                        return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
                    end,
                    overrides = {
                        notes_subdir = vim.NIL,  -- have to use 'vim.NIL' instead of 'nil'
                        new_notes_location = "current_dir",
                        templates = {
                            folder = vim.NIL,
                        },
                        disable_frontmatter = true,
                    },
                },
            },
            disable_frontmatter = false,
            notes_subdir = "notes",
            new_notes_location = "notes_subdir",
            ui = {enable = false},
            note_id_func = function(title)
                local suffix = ""
                if title ~= nil then
                    -- If title is given, transform it into valid file name.
                    suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                    -- If title is nil, just add 4 random uppercase letters to the suffix.
                    for _ = 1, 4 do
                        suffix = suffix .. string.char(math.random(65, 90))
                    end
                end
                return suffix
            end,
            preferred_link_style = "markdown",
            -- a function that allows for github-flavored markdown links (links relative to root)
            markdown_link_func = function(opts)
                local util = require("obsidian").util
                local anchor = opts.anchor and opts.anchor.anchor or ""
                local header = opts.anchor and util.format_anchor_label(opts.anchor) or ""
                local path = util.urlencode(opts.path, { keep_path_sep = true })
                return string.format("[%s%s](/%s%s)", opts.label, header, path, anchor)
            end,
            templates = {
                folder = "templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M",
                -- A map for custom variables, the key should be the variable and the value a function
                substitutions = {
                    fname = function()
                        --return vim.fn.expand('%')
                        local temp = vim.fn.expand('%:p:h:t') .. "/" .. vim.fn. expand('%:t')
                        return temp
                    end
                },
            },
            follow_url_func = function(url)
                -- Open the URL in the default web browser.
                -- vim.fn.jobstart({"open", url})  -- Mac OS
                -- vim.fn.jobstart({"xdg-open", url})  -- linux
                -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
                vim.ui.open(url) -- need Neovim 0.10.0+
            end,
        },


    },

}
