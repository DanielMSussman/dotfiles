vim.pack.add({ "https://github.com/L3MON4D3/LuaSnip" })

-- auto-build jsregexp C extension if missing
-- ...can navigate to ~/.local/share/nvim/site/pack/core/opt/LuaSnip and run the make command manually.
local function ensure_jsregexp_built()
    local luasnip_lua_path = vim.api.nvim_get_runtime_file("lua/luasnip/init.lua", false)[1]
    if not luasnip_lua_path then return end
    
    local luasnip_root = vim.fn.fnamemodify(luasnip_lua_path, ":h:h:h")
    local artifact = luasnip_root .. "/deps/jsregexp/jsregexp.so"
    
    if isWindows then
        artifact = luasnip_root .. "/deps/jsregexp/jsregexp.dll"
    end
    
    if not vim.uv.fs_stat(artifact) then
        vim.notify("Building LuaSnip jsregexp in the background...", vim.log.levels.INFO)
        
        vim.system({"make", "install_jsregexp"}, { cwd = luasnip_root }, function(out)
            vim.schedule(function()
                if out.code == 0 then
                    vim.notify("LuaSnip jsregexp built successfully!", vim.log.levels.INFO)
                else
                    vim.notify("Failed to build LuaSnip jsregexp:\n" .. (out.stderr or out.stdout or ""), vim.log.levels.ERROR)
                end
            end)
        end)
    end
end

ensure_jsregexp_built()



local snippet_path = vim.fn.stdpath("config") .. "/lua/luasnip/"
require("luasnip.loaders.from_lua").lazy_load({ paths = { snippet_path } })

local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.setup({
    update_events = { "TextChanged", "TextChangedI" },
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
    -- Add virtual text for active choice nodes and active/passive insert nodes
    ext_opts = {
        [types.choiceNode] = {
            active = { virt_text = { { "●", "NotifyWarnTitle" } } },
        },
        [types.insertNode] = {
            active = { virt_text = { { "●", "NotifyInfoTitle" } } },
            passive = { virt_text = { { "●", "NotifyHintTitle" } } },
        }
    },
})

vim.keymap.set({ "i" }, "<C-k>", function() ls.expand() end, { silent = true, desc = "expand autocomplete" })
vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(1) end, { silent = true, desc = "next autocomplete" })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(-1) end, { silent = true, desc = "previous autocomplete" })

vim.keymap.set({ "i", "s" }, "<C-h>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true, desc = "cycle through choice nodes" })

vim.keymap.set({ "i", "s" }, "<C-y>", function() ls.unlink_current() end, { silent = true, desc = "use this to leave choice node" })

vim.keymap.set({ "i", "s" }, "<C-z>", function()
    require('blink.cmp').hide()
    
    require('luasnip.extras.select_choice')()
end, { desc = "ui select for choice node" })
