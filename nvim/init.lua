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



-- set up leader and local leader, and set vim options before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
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

-- potential flags for some platform-specific options in plugins
isWindows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
--recommended settings to use pwsh instead of cmd.exe
if isWindows then
    vim.o.shell="pwsh"
    vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.o.shellquote = ""
    vim.o.shellxquote = ""
end
