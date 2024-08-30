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


-- potential flags for some platform-specific options in plugins
isWindows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
isMac = vim.fn.has("mac") == 1 

-- load vimoptions and plugins
local opts = {}
--
--require("editorconfig").properties.end_of_line = "lf"
--

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("vimOptions")

require("lazy").setup("plugins")

require("keymaps")
require("autocmds")
