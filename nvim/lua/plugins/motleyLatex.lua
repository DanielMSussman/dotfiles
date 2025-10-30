return {
    {
    "DanielMSussman/motleyLatex.nvim",
    config = function()
        require("motleyLatex").setup({
                    tcolorbox_opts = {
                    --overwrite any default options, or add new ones
                        -- colframe = "{rgb,255:red,84;green,84;blue,100}", --lotusInk1
                        colframe = "{rgb,255:red,118;green,107;blue,144}", --lotusViolet2
                        boxrule = "1.0pt",
                        width = "1.0\\textwidth",
                        fontupper = "\\normalsize",
                        breakable="false",
                        top = "0.5pt",
                            bottom = "0.5pt",
                        colbacktitle="{rgb,255:red,54;green,54;blue,70}", --sumiInk5
                        coltitle = "{rgb,255:red,220;green,215;blue,186}", --fujiWhite
                        fonttitle="\\scshape\\ttfamily",
                    },
        })
    end
    },
}
