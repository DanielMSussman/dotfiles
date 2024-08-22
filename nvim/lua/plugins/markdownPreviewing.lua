return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        event = "VeryLazy",
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
