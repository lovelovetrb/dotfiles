local lspconfig = require('lspconfig')

-- tsserver setting
lspconfig.tsserver.setup {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProviser = false
    -- client.server_capabilities.document_range_formatting = false
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
}

--css setting
lspconfig.cssls.setup {}
--
--lua setting
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}

-- python setting
lspconfig.pyright.setup({})




