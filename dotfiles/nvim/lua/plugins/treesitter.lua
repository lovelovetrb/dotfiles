return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        'lua',
        'python',
        'typescript',
        'javascript',
        'json',
        'html',
        'css',
      },
      auto_install = true,
    },
  },
}
