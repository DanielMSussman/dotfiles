return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        --event = "VeryLazy",
        ft = "markdown",
        opts={},
        dependencies={ 'nvim-treesitter/nvim-treesitter' , 'nvim-tree/nvim-web-devicons'},
    config = function()
        require('render-markdown').setup({
                enabled = false,
                preset = 'obsidian',
                indent = { enabled = true },
                heading = {
                    position = 'inline'
                },
            })
    end
    },
}
