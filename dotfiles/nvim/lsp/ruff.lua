vim.lsp.config('ruff', {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml' },
  settings = {
    python = {
      -- 仮想環境のルートパス
      venvPath = ".",
      -- 仮想環境のフォルダ名
      -- venv = ".venv",
      pythonPath = "./.venv/bin/python",
      -- analysis = {
      --   extraPaths = {"."},
      --   autoSearchPaths = true,
      --   useLibraryCodeForTypes = true
      -- }
    }
  }
})
