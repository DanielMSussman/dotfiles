return {

    {
    dir="~/repos/code/cppTools.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter'},
    config = function()
        require("simpleCppTreesitterTools").setup({
            verboseNotifications = true,
            })

        vim.api.nvim_create_user_command("ImplementEverything",
            function()
                require("simpleCppTreesitterTools").implementEverythingInClass()
            end,{desc = 'call the implementEverything function'}
        )
        vim.api.nvim_create_user_command("ImplementNodeOnLine",
            function()
                require("simpleCppTreesitterTools").implementFunctionOnLine()
            end,{desc = 'call the implementFunctionOnLine function'}
        )
        vim.api.nvim_create_user_command("StPatrick",
            function()
                require("simpleCppTreesitterTools").whereAreTheSnakeCaseVariables()
            end,{desc = 'a function of convenience'}
        )
        vim.keymap.set("n", "<localleader>c", function() vim.cmd("ImplementEverything") end,{desc = 'implement class member declarations in [c]pp file'})
        vim.keymap.set("n", "<localleader>a", function() vim.cmd("ImplementNodeOnLine") end,{desc = 'implement function on current '})
        vim.keymap.set("n", "<localleader>s", function() vim.cmd("StPatrick") end,{desc = 'drive out the [s]nakes'})
    end
    },
}
