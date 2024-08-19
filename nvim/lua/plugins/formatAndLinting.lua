return {
    {
    'mhartington/formatter.nvim',
    event = {'VeryLazy'},
    config = function()
        local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
        local devnullstring 
        if is_windows then
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
                                    "-y", "modifyLineBreaks:oneSentencePerLine:manipulateSentences:1,modifyLineBreaks:oneSentencePerLine:multipleSpacesToSingle:1",
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
