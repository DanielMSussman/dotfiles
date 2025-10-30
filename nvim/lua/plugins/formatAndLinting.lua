return {

    {
    'stevearc/conform.nvim',

    config = function()
        conformTex = require("conform").setup({
            formatters_by_ft= {
                    tex= {'texFormatter'},
                    cpp= {'cppFormatter'},
                    cuda= {'cppFormatter'},
                },
            formatters = {
                cppFormatter= {
                        command = "clang-format",
                        args = '-style="{BasedOnStyle: WebKit, AccessModifierOffset: 0,AlignAfterOpenBracket: Align, AlignOperands: Align, AllowShortIfStatementsOnASingleLine: Never, AllowShortLoopsOnASingleLine: false, BinPackArguments: false, BinPackParameters: false, BreakBeforeBraces: Whitesmiths, BreakConstructorInitializers: BeforeColon, Cpp11BracedListStyle: true, FixNamespaceComments: true, IndentWidth: 4, Language: Cpp, PointerAlignment: Left, SpaceAfterTemplateKeyword: false, SpaceBeforeParens: ControlStatements, Standard: c++14, TabWidth: 4, UseTab: Never, IndentCaseLabels: true, IndentAccessModifiers: true, AllowShortCaseLabelsOnASingleLine: true, ColumnLimit: 120}"',
                        stdin = true,
                    },
                texFormatter= {
                        command = "latexindent",
                                args = {
                                    "-y",
                                    "modifyLineBreaks:oneSentencePerLine:manipulateSentences:1,modifyLineBreaks:oneSentencePerLine:multipleSpacesToSingle:1,dos2unixlinebreaks:1, modifyLineBreaks:environments:BeginStartsOnOwnLine:1, modifyLineBreaks:environments:BodyStartsOnOwnLine:1, modifyLineBreaks:environments:EndStartsOnOwnLine:1, modifyLineBreaks:environments:EndFinishesWithLineBreak:1, ",
                                    "-m",
                                },
                                stdin = true,

                    },
                },

                --
            -- If this is set, Conform will run the formatter on save.
            -- It will pass the table to conform.format().
            -- This can also be a function that returns the table.
--            format_on_save = {
--                lsp_format = "fallback",
--                timeout_ms = 500,
--            },
            -- If this is set, Conform will run the formatter asynchronously after save.
--            format_after_save = {
--                lsp_format = "fallback",
--            },
        })
        -- create a user command to run on current file
        vim.api.nvim_create_user_command("Format", 
            function(args)
                local range = nil
                if args.count ~= -1 then
                    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                    range = {
                        start = { args.line1, 0 },
                        ["end"] = { args.line2, end_line:len() },
                    }
                end
                require("conform").format({ async = true, lsp_format = false, range = range })
            end, { range = true })
        vim.keymap.set("n","<leader>cf", ':Format<CR>', {noremap=true,desc="format [f]ile"})
        vim.keymap.set("n","<leader>cp", 'vip:Format<CR>', {noremap=true,desc="format [p]aragraph"})

    end
    },
}

