local plugins = {
  { "github/copilot.vim", lazy = false },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "astro",

        "python",
        "yaml",

        "java",

        "gitignore",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function()
     return require "custom.configs.mason"
    end,
  }
}
return plugins
