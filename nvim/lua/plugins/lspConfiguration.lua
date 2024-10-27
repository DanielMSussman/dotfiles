return {
    {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    config = function()
        require("mason").setup()
    end
    },
    {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    config = function()
        require("mason-lspconfig").setup({
            -- ensure_installed = {"clangd"}
            }
            )
    end
    },
    {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lspconfig = require("lspconfig")
            --advertise cmp-nvim-lsp
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        lspconfig.clangd.setup {capabilities = capabilities,
            autostart=false,}
    end
    },

}
