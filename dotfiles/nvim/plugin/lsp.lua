-- mason
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
require('mason-tool-installer').setup({
  ensure_installed = { 'prettierd', 'typescript-language-server', 'eslint_d', 'css-lsp', 'typescript-language-server','pyright',  'black', 'flake8', 'isort' },
  auto_update = true,
  run_on_start = true,
  start_delay = 3000,
  debounce_hours = 5,
})

local prettier = require("prettier")
prettier.setup({
  bin = 'prettierd', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

-- lspconfig
-- tsserver setting
require 'lspconfig'.tsserver.setup {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProviser = false
    -- client.server_capabilities.document_range_formatting = false
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
}

--css setting
require 'lspconfig'.cssls.setup {}
--lua setting
require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}

require("lspconfig").pyright.setup({})

-- C-bでhoverでLSPの情報が閲覧できる。
vim.api.nvim_set_keymap('n', '<C-b>', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
-- C-fでFormat
vim.keymap.set('n', '<C-f>', function() vim.lsp.buf.format { async = true } end)
-- gdで参照先に移動
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true })
-- gbで参照前に戻る
vim.keymap.set('n', 'gb', "<Cmd>b#<CR>", { noremap = true })
-- show error
vim.keymap.set('n', 'qp', '<Cmd>lua vim.diagnostic.setqflist()<CR>', { noremap = true })

-- nvim-cmp
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = require('cmp').mapping.preset.insert({
    ['<CR>'] = require('cmp').mapping.confirm({ select = true }),
    ["<C-k>"] = require('cmp').mapping.select_prev_item(),
    ["<C-j>"] = require('cmp').mapping.select_next_item(),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
  experimental = {
    ghost_text = true,
  },
})

-- lspkindでLSP関連の表示に対してアイコンを表示することができる
local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',       -- show only symbol annotations
      maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    })
  }
}

-- null-ls
local null_ls = require('null-ls')
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require('null-ls').setup({
  sources = {
    null_ls.builtins.diagnostics.eslint.with({
      prefer_local = "node_modules/.bin", --プロジェクトローカルがある場合はそれを利用
    }),
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.black, -- python formatter
		null_ls.builtins.formatting.isort, -- python import sort
		null_ls.builtins.diagnostics.flake8, -- python linter

  },
  debug = true,
  -- you can reuse a shared lspconfig on_attach callback here
  -- on_attach = function(client, bufnr)
  --  if client.supports_method("textDocument/formatting") then
  --    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --    vim.api.nvim_create_autocmd("BufWritePre", {
  --      group = augroup,
  --      buffer = bufnr,
  --      callback = function()
  -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
  --        vim.lsp.buf.formatting_sync()
  --      end,
  --    })
  --  end
  --end,
})
