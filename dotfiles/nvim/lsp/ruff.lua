vim.lsp.config('ruff', {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml' },
  settings = {
    python = {
      -- 仮想環境のルートパス
      venvPath = ".",
      pythonPath = "./.venv/bin/python",
    }
  }
})
