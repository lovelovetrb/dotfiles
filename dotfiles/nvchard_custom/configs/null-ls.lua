local null_ls = require('null-ls')
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
})
