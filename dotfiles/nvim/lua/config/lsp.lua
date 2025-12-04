local navic = require("nvim-navic")

vim.lsp.config('*', {
  root_markers = { '.git' },
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  end,
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('ruff')
vim.lsp.enable('ts_ls')
vim.lsp.enable('rust_analyzer')

return {}
