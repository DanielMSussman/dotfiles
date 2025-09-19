return {
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        config = function()
            require("oil").setup({

            })
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

            vim.keymap.set('n', '<C-n>', function()
                local oil_win = nil
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "oil" then
                        oil_win = win
                        break
                    end
                end

                if oil_win then
                    -- If an oil window is found, close it
                    vim.api.nvim_win_close(oil_win, false)
                else
                    -- If not, create a vertical split on the left and open oil
                    vim.cmd("leftabove vsplit")
                    require("oil").open()
                end
            end,{desc = "toggle oil buffer on a vsplit to the left"})
            --default keymap reminders
            --
            -- g? Show a popup with this cheat sheet contents
            -- <CR> Open the entry under the cursor
            -- <C-p> Open the entry under the cursor in a preview window, or close the preview window if already open
            -- <C-s> Open the entry under the cursor in a vertical split window
            -- <C-h> Open the entry under the cursor in a horizontal split window
            -- <C-t> Open the entry under the cursor in a new tab
            -- <C-l> Refresh current directory list (:e! also works)
            -- <C-c> Close Oil and restore original buffer
            -- g. Toggle hidden files and directories (including the ../ parent entry)
            -- g\ Jump to and from the trash for the current directory
            -- - Navigate to the parent path
            -- _ Open Oil at Neovim’s current working directory
            -- ` Runs :cd to change the current working directory to the current Oil directory
            -- ~ Show the current working directory (cwd)
            -- gx Open the entry under the cursor in an external program
            -- gs Opens a popup for changing the sort order
        end
    }
}
