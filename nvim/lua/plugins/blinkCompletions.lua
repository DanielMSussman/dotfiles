return {
    {
    'saghen/blink.cmp',
        dependencies = {
            { 'L3MON4D3/LuaSnip', version = 'v2.*' },
            {
                "micangl/cmp-vimtex",
                dependencies = {
                    "saghen/blink.compat",
                    version = "*",
                    lazy = true,
                    opts={},
                },
            },
        },
    -- lazy = false,
        event = "InsertEnter",

        version = '*',

        opts = {
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            keymap = { preset = 'default' },
            snippets = { preset = 'luasnip' },
            sources = {
                default = { 'lsp', 'path','cmdline','snippets', 'buffer','vimtex' },
                providers = {
                    snippets = { score_offset = 10, },
                    vimtex = {
                        name = 'vimtex',
                        module = 'blink.compat.source',
                        score_offset = 15,
                    },
                },
            },
            signature = { enabled = true },
            completion ={
                menu ={
                    draw ={
                        columns ={
                            -- { "label", "label_description",gap=1},
                            -- {"kind_icon","kind"},
                            {"kind_icon"},
                            -- {"kind"},
                            {"label"},
                            {"label_description"},
                            -- {"source_name"},
                            -- {"source_id"},
                        },
                    },
                },
                documentation = {
                    auto_show = true,
                window = {border = "single"},
                },
            },
        },
        opts_extend = { "sources.default" },
    },
}
