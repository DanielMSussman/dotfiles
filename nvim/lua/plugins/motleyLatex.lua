return {
    {
    -- dir = '~/repos/motleyLatex.nvim',
    "DanielMSussman/motleyLatex.nvim",
    config = function()
        require("motleyLatex").setup({
                    tcolorbox_opts = {
                    --overwrite any default options, or add new ones
                        colframe = "black!40",
                        boxrule = "0.5pt", 
                        width = "0.9\\textwidth",
                        fontupper = "\\footnotesize",
                        top = "0.5pt",
                        bottom = "0.5pt",
                    },
        })
    end
    },
}

