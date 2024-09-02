--snippets; vital for TeX
return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*",
    build = "make install_jsregexp",
    config = function()
        require("luasnip.loaders.from_lua").lazy_load({paths = "./lua/luasnip/"})
        local ls = require("luasnip")
        local types = require("luasnip.util.types")
        ls.setup({
            update_events = {"TextChanged", "TextChangedI"},
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
            ext_opts = {
                [types.choiceNode] = {
                    active = { virt_text = {{"●", "Todo"}}, hl_mode = "combine" }
                },
                [types.insertNode] = {
                    active = { virt_text = {{"●", "Blue"}}, hl_mode = "combine" }
                }
            },
        })
        vim.keymap.set({"i"}, "<C-k>", function() ls.expand() end, {silent = true, desc = "expand autocomplete"})
        vim.keymap.set({"i", "s"}, "<C-j>", function() ls.jump( 1) end, {silent = true, desc = "next autocomplete"})
        vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump(-1) end, {silent = true, desc = "previous autocomplete"})

        vim.keymap.set({"i", "s"}, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, {silent = true, desc = "select autocomplete"})
    end
}
