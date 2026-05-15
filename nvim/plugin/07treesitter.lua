vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })


-- adapted from https://nvim-mini.org/MiniMax/configs/nvim-0.12/
local languages = { -- ensure these are installed
    'lua',
    'cpp',
    'julia',
    'markdown'
}
local function install_missing_parsers()
    --check if the parser file exists in the runtimepath
  local missing_parsers = vim.tbl_filter(function(lang)
    return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
  end, languages)

  if #missing_parsers > 0 then
    require('nvim-treesitter').install(missing_parsers)
  end
end

install_missing_parsers()

-- map languages to their associated filetypes
local filetypes = {}
for _, lang in ipairs(languages) do
  local fts = vim.treesitter.language.get_filetypes(lang)
  for _, ft in ipairs(fts) do
    table.insert(filetypes, ft)
  end
end

-- create autocommand to start native tree-sitter on file open
local ts_group = vim.api.nvim_create_augroup('CustomTreesitterStart', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = ts_group,
  pattern = filetypes,
  desc = 'Start native Neovim tree-sitter',
  callback = function(ev)
    vim.treesitter.start(ev.buf)
  end,
})
