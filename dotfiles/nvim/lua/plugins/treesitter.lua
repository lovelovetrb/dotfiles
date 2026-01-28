return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    configs = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'lua',
          'python',
          'typescript',
          'javascript',
          'json',
          'html',
          'css',
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      }
    end,
  },
}
