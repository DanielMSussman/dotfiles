vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

vim.cmd("set number")
vim.cmd("set ruler")
vim.cmd("set relativenumber")
vim.cmd("set wrap linebreak")
vim.cmd("set breakindent")
vim.cmd("set showbreak=󱞩")
vim.cmd("set breakindentopt=shift:3,sbr")

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set autoindent")
vim.cmd("set smartindent")

vim.cmd("set incsearch")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
-- vim.cmd("set inccommand")

vim.cmd("set signcolumn =yes")
vim.cmd("set numberwidth=2")
vim.cmd("set termguicolors")
vim.cmd("set cursorline")

vim.cmd("set spell spelllang=en_us")

vim.cmd("set clipboard=unnamedplus")

vim.cmd("set noerrorbells")

vim.cmd("set hidden")

vim.o.pumblend=20
--vim.cmd("set mouse=a")

--vim.cmd("set pumheight=8")
vim.cmd("set history=1000")
vim.cmd("set scrolloff=10")

vim.cmd("highlight Spellbad  cterm=underline gui=underline") 
vim.cmd("highlight SpellRare  cterm=underdashed gui=underdashed")
vim.cmd("highlight SpellCap  cterm=underdotted gui=underdotted")
