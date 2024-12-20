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
    vim.keymap.set("i", "<C-s>", function() require('cmp_vimtex.search').search_menu() end)
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
    version = 'v0.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- see the "default configuration" section below for full documentation on how to define
        -- your own keymap.
        keymap = { preset = 'default' },

        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release
            use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },

        --luasnip setup
        snippets = {
            expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
            active = function(filter)
                if filter and filter.direction then
                    return require('luasnip').jumpable(filter.direction)
                end
                return require('luasnip').in_snippet()
            end,
            jump = function(direction) require('luasnip').jump(direction) end,
        },
        -- default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, via `opts_extend`
        sources = {
            -- default = { 'lsp', 'path', 'luasnip','buffer' },
            completion = {
                enabled_providers = {'lsp', 'path', 'luasnip', 'buffer','vimtex'},
                },
            -- optionally disable cmdline completions
            -- cmdline = {},
            providers = {
                luasnip = {
                    score_offset = 1,
                    },
                -- create provider
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
