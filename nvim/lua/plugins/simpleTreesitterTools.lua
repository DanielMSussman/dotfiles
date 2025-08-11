return {
    {
    dir = '~/repos/simpleJuliaTreesitterTools.nvim',
    -- "DanielMSussman/simpleJuliaTreesitterTools.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter'},
    ft = "julia",
    config = function()
        require("simpleJuliaTreesitterTools").setup({
            rules = {
                ["Constant"] = "SCREAMING_SNAKE_CASE",
                ["Module"] = "UpperCamelCase",
                ["Struct"] = "UpperCamelCase",
                ["AbstractType"] = "AbstractUpperCamelCase", -- eventually implement a rule for this, like "must start with abstract"?
                ["Function"] = "snake_case",
            },
            defaultApproach = "treesitter", --or "lsp"...
        })
        vim.keymap.set('n', '<localleader>lb', function()
            require('simpleJuliaTreesitterTools').lint_buffer_names()
        end, { desc = '[L]int names in current [b]uffer' })

        vim.keymap.set('n', '<localleader>lp', function()
            require('simpleJuliaTreesitterTools').lint_project_names()
        end, { desc = '[L]int names in current [p]roject' })
    end
    },
    {
    -- dir = '~/repos/simpleCppTreesitterTools.nvim',
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
