vim.lsp.config('pyrefly', {
  cmd = { 'uvx', 'pyrefly', 'lsp' },
  filetypes = { 'python' },
  settings = {
    python = {
      pyrefly = {
        displayTypeErrors = 'force-on'
      }
    }
  }
})
