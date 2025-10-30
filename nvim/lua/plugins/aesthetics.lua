return {
    {
        "rebelot/kanagawa.nvim",
        priority=1000,
        config = function()
            require('kanagawa').setup({
                undercurl = false,
                colors = {
                    theme = {
                        -- I don't use the light theme, but this is for lecture notes
                        lotus ={
                            ui = {
                                bg = "#fffad4"
                                -- bg = "#fff8c7"
                                -- bg = "#ffffd0"
                            }
                        },
                        all = {
                            ui = {
                                bg_gutter = "none"
                            }
                        }
                    }
                },
                overrides = function(cols)
                    local theme = cols.theme
                    local makeDiagnosticColor = function(color)
                        local c = require("kanagawa.lib.color")
                        return { fg = color, bg = c(color):blend(theme.ui.bg, 0.96):to_hex() }
                    end
                    return {
                        NormalFloat = { bg = "none" },
                        FloatBorder = { bg = "none" },
                        FloatTitle = { bg = "none" },
                        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg},
                        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2, blend =0},
                        PmenuSbar = { bg = theme.ui.bg_m1 },
                        PmenuThumb = { bg = theme.ui.bg_p1 },
                        DiagnosticVirtualTextHint  = makeDiagnosticColor(theme.diag.hint),
                        DiagnosticVirtualTextInfo  = makeDiagnosticColor(theme.diag.info),
                        DiagnosticVirtualTextWarn  = makeDiagnosticColor(theme.diag.warning),
                        DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
                    }
                end
            })
            vim.cmd.colorscheme "kanagawa"
        end
    },
}

