return {

    {
    'stevearc/conform.nvim',
    event = {'VeryLazy'},

    config = function()
        require("conform").setup({
            formatters_by_ft = {
                tex = {'latexindent'},
            },
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
        -- create a keymap to format a visual selection
        vim.keymap.set("", "<leader>q", function()
            require("conform").format({ async = true, lsp_fallback = true })
        end, { desc = "Conform: format" })
        -- create a user command to run on current file
        vim.api.nvim_create_user_command("Format", function(args)
            local range = nil
            if args.count ~= -1 then
                local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                range = {
                    start = { args.line1, 0 },
                    ["end"] = { args.line2, end_line:len() },
                }
            end
            require("conform").format({ async = true, lsp_format = "fallback", range = range })
        end, { range = true })
    end
    },
}
