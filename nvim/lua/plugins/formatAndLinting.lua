return {
    {
    'mhartington/formatter.nvim',
--    event = {'VeryLazy'},
    ft = "tex",
    config = function()
        local devnullstring 
        if isWindows then
            devnullstring = "NUL"
        else
            devnullstring = "/dev/null"
        end

        require("formatter").setup({
            logging = false,
            filetype = {
                tex = {
                        function()
                            return {
                                exe = "latexindent",
                                args = {
                                    "-g",devnullstring,
                                    "-y", "modifyLineBreaks:oneSentencePerLine:manipulateSentences:1,modifyLineBreaks:oneSentencePerLine:multipleSpacesToSingle:1,dos2unixlinebreaks:1,modifyLineBreaks:oneSentencePerLine:sentencesdoNOTcontain:other:\\begin",
                                    "-m"
                                },
                                stdin = true,
                            }
                        end,
                    },
                },
        })
    end
    },
}
