return {
    --a few color schemes... the default one should apparently get high priority
    {
        "sho-87/kanagawa-paper.nvim",
        priority=1000,
    },
    {
        "rebelot/kanagawa.nvim",
        priority=1000,
        config = function()
            vim.cmd.colorscheme "kanagawa"
        end
    },
    --light-themed solarized, for old time's sake
    {
        'shaunsingh/solarized.nvim',
        priority=1000,
    },

    --lualine
    {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
            require("lualine").setup()
    end
    },


}

