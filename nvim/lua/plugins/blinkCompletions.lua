return {
    {
    "micangl/cmp-vimtex",
        lazy=false,
    ft = "tex",
    --event = "VeryLazy", -- don't lazy load, or else it'll show up twice in nvim-cmp sources
    config = function()
            if isWindows then
                require('cmp_vimtex').setup({
                    search = {
                        browser = {"start"},
                            },
                })
            else
                require('cmp_vimtex').setup({
                })
            end
    end,
    },
    {
    'saghen/blink.compat',
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = '*',
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    -- lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {impersonate_nvim_cmp = false},
    },
    {
    'saghen/blink.cmp',
    dependencies = {
            { 'L3MON4D3/LuaSnip', version = 'v2.*' },
            {"micangl/cmp-vimtex"},
        },
    lazy = false, -- lazy loading handled internally

    -- use a release tag to download pre-built binaries
    version = '*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- see the "default configuration" section below for full documentation on how to define
        -- your own keymap.
        keymap = { preset = 'default' },
            snippets = { preset = 'luasnip' },
            -- ensure you have the `snippets` source (enabled by default)
            sources = {
                -- default = { 'lsp', 'path', 'snippets', 'buffer','vimtex' },
                default = { 'lsp', 'path','cmdline','snippets', 'buffer','vimtex' },
                providers = {
                    snippets = {
                        score_offset = 1,
                    },
                    vimtex = {
                        name = 'vimtex',
                        module = 'blink.compat.source',
                        score_offset = 3,
                    },
                },
            },
            -- experimental signature help support
            signature = { enabled = true },
        },
        -- allows extending the providers array elsewhere in your config
        -- without having to redefine it
        opts_extend = { "sources.default" },
    },
}
