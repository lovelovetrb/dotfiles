vim.lsp.config.terraformls = {
  cmd = { 'terraform-ls', 'serve' },
  filetypes = { 'terraform' },
  root_markers = { '.terraform', '.terraform-ls-root' },
}

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.tf', '*.tfvars' },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
