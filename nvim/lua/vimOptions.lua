vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

local opt = vim.opt

-- UI and numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.pumblend = 20
opt.showbreak = "↳ "

-- Indentation and Tabs
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true

-- wrapping and line breaks
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.breakindentopt = "shift:3,sbr"

-- search and command behavior
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"
opt.history = 1000

-- system and clipboard
opt.clipboard = "unnamedplus"
opt.spell = true
opt.spelllang = "en_us"
opt.errorbells = false
opt.hidden = true

-- view handling
opt.viewoptions:remove("curdir")

-- 3. highlighting
local set_hl = vim.api.nvim_set_hl
set_hl(0, "SpellBad", { underline = true })
set_hl(0, "SpellRare", { underdashed = true })
set_hl(0, "SpellCap", { underdotted = true })
