--For colorschemes that I am not using right now
return {
    {
        "sho-87/kanagawa-paper.nvim",
        lazy = false,
        priority = 1000,
        config  =  function()
            require('kanagawa-paper').setup({
                undercurl = false,
                transparent = false,
                gutter = false,
                dimInactive = true, -- disabled when transparent
                terminalColors = true,
                commentStyle = { italic = true },
                functionStyle = { italic = false },
                keywordStyle = { italic = false, bold = false },
                statementStyle = { italic = false, bold = false },
                typeStyle = { italic = false },
            })
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    }


}
