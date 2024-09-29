return {
    {
    'mhartington/formatter.nvim',
--    event = {'VeryLazy'},
    ft = {"tex","cpp"},
    config = function()
        local util = require "formatter.util"
        local devnullstring 
        if isWindows then
            devnullstring = "NUL"
        else
            devnullstring = "/dev/null"
        end

        vim.keymap.set('n','<leader>q','vip:Format<CR>',{noremap=true,desc="[q] Format paragraph"})
        require("formatter").setup({
            logging = false,
            filetype = {
                --quick call to latexindent to enforce oneSentencePerline
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
                cpp = {
                        function()
                            return {
                                exe = "clang-format",
                                args = {
                                    '-style="{BasedOnStyle: WebKit, AccessModifierOffset: 0,AlignAfterOpenBracket: Align, AlignOperands: Align, AllowShortIfStatementsOnASingleLine: Never, AllowShortLoopsOnASingleLine: false, BinPackArguments: false, BinPackParameters: false, BreakBeforeBraces: Whitesmiths, BreakConstructorInitializers: BeforeColon, Cpp11BracedListStyle: true, FixNamespaceComments: true, IndentWidth: 4, Language: Cpp, PointerAlignment: Left, SpaceAfterTemplateKeyword: false, SpaceBeforeParens: ControlStatements, SpacesInAngles: Never, Standard: Cpp11, TabWidth: 4, UseTab: Never }"',
                                    "-assume-filename",
                                    util.escape_path(util.get_current_buffer_file_name()),
                                },
                                stdin = true,
                                try_node_modules = true,
                            }
                        end,
                    },
                },
            })
    end
    },
}
