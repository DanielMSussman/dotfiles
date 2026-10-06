-- We need to configure vimtex globals BEFORE loading the plugin
vim.g.vimtex_imaps_enabled = 0 -- disable imaps (luasnip instead)
vim.g.vimtex_compiler_silent = 1 -- i.e., don't emit compilation notifications
-- vim.g.vimtex_compiler_latexmk = {
--     aux_dir = 'auxFiles', -- put aux files in another directory
-- }
vim.g.vimtex_format_enabled = 0
vim.g.vimtex_syntax_conceal_disable = 1
vim.g.vimtex_matchparen_enabled = 0

vim.g.vimtex_view_method = 'general'
vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
vim.g.vimtex_quickfix_open_on_warning = 0 -- don't open quickfix if there are only warnings
vim.g.vimtex_quickfix_ignore_filters = {
    "Underfull",
    "Overfull", 
    "LaTeX Warning: .\\+ float specifier changed to", 
    "Package hyperref Warning: Token not allowed in a PDF string"
}

vim.pack.add({ "https://github.com/lervag/vimtex" })
vim.pack.add({ "https://github.com/DanielMSussman/motleyLatex.nvim" })

require("motleyLatex").setup({
    tcolorbox_opts = {
        colframe = "{rgb,255:red,118;green,107;blue,144}", --lotusViolet2
        boxrule = "1.0pt",
        width = "1.0\\textwidth",
        fontupper = "\\normalsize",
        breakable="false",
        top = "0.5pt",
        bottom = "0.5pt",
        colbacktitle="{rgb,255:red,54;green,54;blue,70}", --sumiInk5
        coltitle = "{rgb,255:red,220;green,215;blue,186}", --fujiWhite
        fonttitle="\\scshape\\ttfamily",
    },
})

vim.keymap.set('n', '<localleader>n', function()
  vim.cmd.write()
  local file = vim.api.nvim_buf_get_name(0)
  local start_time = (vim.uv or vim.loop).hrtime()

  vim.system(
    { vim.fn.expand('~/repos/cpptex/build/nematex'), '-S', file },
    { text = true },
    function(obj)
      local elapsed_ms = ((vim.uv or vim.loop).hrtime() - start_time) / 1e6

      vim.schedule(function()
        if obj.code == 0 then
          local time_str = elapsed_ms < 1000
              and string.format('%.0f ms', elapsed_ms)
              or string.format('%.2f s', elapsed_ms / 1000)

          vim.notify('nematex finished in ' .. time_str, vim.log.levels.INFO, { title = 'nemaTeX' })
        else
          local err_msg = obj.stderr ~= '' and ('\n' .. obj.stderr) or ''
          vim.notify('Compilation failed (code ' .. obj.code .. ')' .. err_msg, vim.log.levels.ERROR, { title = 'nemaTeX' })
        end
      end)
    end
  )
end, { desc = '[n]emaTeX: Save buffer and compile' })
