return {
    {
    "williamboman/mason.nvim",
    -- event = "VeryLazy",
    lazy=true,
    config = function()
        require("mason").setup()
    end
    },
    {
    "williamboman/mason-lspconfig.nvim",
    -- event = "VeryLazy",
    lazy=true,
    config = function()
        require("mason-lspconfig").setup({
            -- ensure_installed = {"clangd","lua_ls"},
            -- ensure_installed = {"lua_ls"},
            }
            )
    end
    },
    {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    event = { "BufReadPre", "BufNewFile" },
    -- example using `opts` for defining servers
    opts = {
        servers = {
            -- lua_ls = {},
            clangd = {},
        }
    },
    config = function(_, opts)
        local lspconfig = require('lspconfig')
        for server, config in pairs(opts.servers) do
            -- passing config.capabilities to blink.cmp merges with the capabilities in your
            -- `opts[server].capabilities, if you've defined it
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end
    end
    },

}
