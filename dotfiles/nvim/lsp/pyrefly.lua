vim.lsp.config('pyrefly', {
  -- example of how to run `uv` installed Pyrefly without adding to your path
  cmd = { 'uvx', 'pyrefly', 'lsp' },
  settings = {
    python = {
      pyrefly = {
        displayTypeErrors = 'force-on'
      }
    }
  }
})
