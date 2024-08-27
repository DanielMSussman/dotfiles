--convenient quick view of files in a tree view
return {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VimEnter",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window=true,
            document_symbols = {
                follow_cursor = false,
                client_filters =
                    { 
                        fn = function(name) return false end,
                        allow_only = {},
                        ignore = {},
                    },
            },

        })
    end
}
