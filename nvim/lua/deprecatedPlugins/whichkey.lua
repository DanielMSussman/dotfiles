return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup( {
        show_help = true,
        plugins = {
            presets = {
                operators = false,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = true,      -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true,      -- default bindings on <c-w>
                nav = false,          -- misc bindings to work with windows
                z = false,            -- bindings for folds, spelling and others prefixed with z
                g = false,            -- bindings for prefixed with g
                marks = false,        -- shows a list of your marks on ' and `
                registers = false,    -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                spelling = {
                    enabled = false,    -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 10,   -- how many suggestions should be shown in the list?
                },
                -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                -- No actual key bindings are created
            },
        },
    })
    end,
}
