return {
    {
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
                projectRootFile = "Project.toml", -- projectRootFile: from the current directory, search upwards to find this file
                projectDirectory = "/src", -- projectDirectory: from wherever the root file is, descend to this directory (and recurse) to find the location of the project files
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

}
