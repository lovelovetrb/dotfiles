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
      pyright = {
        -- Using Ruff's import organizer
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          -- Ignore all files for analysis to exclusively use Ruff for linting
          ignore = { '*' },
        },
      },
    }
  }
})
