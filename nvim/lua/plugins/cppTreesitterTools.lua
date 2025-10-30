return {
    {
        "DanielMSussman/simpleCppTreesitterTools.nvim",
        dependencies = { 'nvim-treesitter/nvim-treesitter'},
        ft = "cpp",
        config = function()
            require("simpleCppTreesitterTools").setup({
                headerExtension =".h",
                implementationExtension=".cpp",
                verboseNotifications = true,
                tryToPlaceImplementationInOrder = true,
                onlyDerivePureVirtualFunctions = false,
                dontActuallyWriteFiles = false, -- for testing, of course
            })
            vim.keymap.set("n", "<localleader>c", function() vim.cmd("ImplementMembersInClass") end,{desc = 'implement [c]lass member declarations'})
            vim.keymap.set("n", "<localleader>l", function() vim.cmd("ImplementMemberOnCursorLine") end,{desc = 'implement member current [l]ine'})
            vim.keymap.set("n", "<localleader>s", function() vim.cmd("StPatrick") end,{desc = 'drive out the [s]nakes'})
            vim.keymap.set("n", "<localleader>d", function() vim.cmd("CreateDerivedClass") end,{desc = 'Create a class which [d]erives from the current one'})
        end
    },
}
