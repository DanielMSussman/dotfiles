return {
    {
    -- dir = '~/repos/motleyLatex.nvim',
    "DanielMSussman/motleyLatex.nvim",
    config = function()
        require("motleyLatex").setup({
                --colbacktitle and coltitle are sumiInk5 and fujiWhite from kanagawa
                    tcolorbox_opts = {
                    --overwrite any default options, or add new ones
                        colframe = "black!40",
                        boxrule = "0.5pt", 
                        width = "0.9\\textwidth",
                        fontupper = "\\footnotesize",
                        top = "0.5pt",
                            bottom = "0.5pt",
                        colbacktitle="{rgb,255:red,54;green,54;blue,70}",
                        coltitle = "{rgb,255:red,220;green,215;blue,186}",
                        fonttitle="\\scshape\\ttfamily",
                    },
        })
    end
    },
}
