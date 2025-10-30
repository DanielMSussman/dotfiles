vim.lsp.enable({'luals', 'clangd'}) -- ,'julials'})

vim.diagnostic.config({
  virtual_text = {
    severity = {
      max = vim.diagnostic.severity.WARN,
    },
  },
  virtual_lines = {
    severity = {
      min = vim.diagnostic.severity.ERROR,
    },
  },
})

--lsp windows get a nice little border
local original_open_floating_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts)
  opts = opts or {}
  opts.border = opts.border or "rounded"

  return original_open_floating_preview(contents, syntax, opts)
end
