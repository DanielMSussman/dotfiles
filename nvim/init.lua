-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- stuff for windows, wsl, etc
require("platformSpecifics")

-- set up leader and local leader, and set vim options before loading plugins
require("vimOptions")

require("lazy").setup("plugins")

require("keymaps")
require("autocmds")
require("filetypes")
require("lspAndDiagnostics")


local currentProject = "vermeer.nvim"
vim.keymap.set("n", "<leader>t",
    function()
        vim.cmd("Lazy reload current project:" .. currentProject)
    end,
    { desc = "Reload " .. currentProject })

