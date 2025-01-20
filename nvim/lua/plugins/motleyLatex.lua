return {
    {
    dir = '~/repos/motleyLatex.nvim',
    -- "DanielMSussman/motleyLatex.nvim",
    config = function()
        require("motleyLatex").setup({
                    tcolorbox_opts = {
                        colframe = "black!40",
                        boxrule = "1.5pt", --overwrite any default options, or add new ones
                        width = "0.9\\textwidth",
                    },
        })
        -- vim.keymap.set("n", "<localleader>c", function() vim.cmd("ImplementMembersInClass") end,{desc = 'implement [c]lass member declarations'})
        -- vim.keymap.set("n", "<localleader>l", function() vim.cmd("ImplementMemberOnCursorLine") end,{desc = 'implement member current [l]ine'})
        -- vim.keymap.set("n", "<localleader>s", function() vim.cmd("StPatrick") end,{desc = 'drive out the [s]nakes'})
        -- vim.keymap.set("n", "<localleader>d", function() vim.cmd("CreateDerivedClass") end,{desc = 'Create a class which [d]erives from the current one'})
    end
    },
}

