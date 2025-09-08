return {
    {
        -- dir = '~/repos/simpleJuliaTreesitterTools.nvim',
        "DanielMSussman/simpleJuliaTreesitterTools.nvim",
        dependencies = { 'nvim-treesitter/nvim-treesitter'},
        ft = "julia",
        config = function()
            require("simpleJuliaTreesitterTools").setup({
                rules = {
                    --Allowed targets are Constant, Module, Struct, AbstractType, Function
                    --Allowed cases are snake_case, SCREAMING_SNAKE_CASE, UpperCamelCase, camelCase, AbstractUpperCamelCase, lowercase, UPPERCASE
                    ["Constant"] = "SCREAMING_SNAKE_CASE",
                    ["Module"] = "UpperCamelCase",
                    ["Struct"] = "UpperCamelCase",
                    ["AbstractType"] = "AbstractUpperCamelCase", -- i.e., PascalCase but with the first part always being "Abstract"
                    ["Function"] = "snake_case",
                },
                defaultApproach = "treesitter", --"treesitter" or "lsp"
                lint_action = "jump", -- "quickfix" or "jump"
                -- projectRootFile: from the current directory, search upwards to find this file
                projectRootFile = "Project.toml",
                -- projectDirectory: from wherever the root file is, descend to this directory (and recurse) to find the location of the project files
                projectDirectory = "/src",
            })
            vim.keymap.set('n', '<leader>cb', function()
                require('simpleJuliaTreesitterTools').lint_buffer_names()
            end, { desc = 'Lint names in [c]urrent [b]uffer' })

            vim.keymap.set('n', '<leader>cr', function()
                require('simpleJuliaTreesitterTools').lint_project_names()
            end, { desc = 'Lint names in [c]urrent [r]oot project' })

            vim.keymap.set('n', '<leader>cc', function()
                require('simpleJuliaTreesitterTools').cycle_violations()
            end, { desc = 'Linting: [c]ycle to next violation' })
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
