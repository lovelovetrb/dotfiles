vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile' },
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
      analysis = {
        typeCheckingMode = "off", -- Disable type checking to rely on pyrefly's type checking
        ignore = { '*' },
      },
      pyright = {
        -- Using Ruff's import organizer
        disableOrganizeImports = true,
      },
    }
  }
})
