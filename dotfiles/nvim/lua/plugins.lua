local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here

  use({ "wbthomason/packer.nvim" })
  use({ "nvim-lua/plenary.nvim" }) -- Common utilities

  -- start up screen
  use({
    'startup-nvim/startup.nvim',
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require "startup".setup({ theme = "dashboard" })
    end
  })

  -- Colorschemes
  -- use({ "Mofiqul/dracula.nvim" }) -- Color scheme
  use({ "cocopon/iceberg.vim" })

  -- Copilot
  use({ "github/copilot.vim" })

  -- icon
  use({ 'nvim-tree/nvim-web-devicons' })

  -- tag complate
  use({ "itmammoth/doorboy.vim" })

  -- file browser
  use({
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
  })
  use({ "nvim-telescope/telescope-file-browser.nvim" })
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- statusLine
  use 'nvim-lualine/lualine.nvim'

  -- tabbar
  use 'romgrk/barbar.nvim'

  -- manage external editor tooling such as LSP servers, DAP servers, linters, and formatters
  use({
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  })
  use 'WhoIsSethDaniel/mason-tool-installer.nvim'

  -- complement
  use({ "hrsh7th/nvim-cmp" })     --補完エンジン本体
  use({ "hrsh7th/cmp-nvim-lsp" }) --LSPを補完ソースに
  use({ "hrsh7th/cmp-buffer" })   --bufferを補完ソースに
  use({ "hrsh7th/cmp-path" })     --pathを補完ソースに
  use({ "onsails/lspkind.nvim" })

  --LuaSnip
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- comment
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- for fomatter and linnter tool
  use({
    "jose-elias-alvarez/null-ls.nvim",
  })
  use('MunifTanjim/prettier.nvim')

  -- git
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })

  use({
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('neogit').setup {}
    end
  })

  -- SSH
  use {
    'chipsenkbeil/distant.nvim',
    config = function()
      require('distant').setup {
        -- Applies Chip's personal settings to every machine you connect to
        --
        -- 1. Ensures that distant servers terminate with no connections
        -- 2. Provides navigation bindings for remote directories
        -- 3. Provides keybinding to jump into a remote file's parent directory
        ['*'] = require('distant.settings').chip_default()
      }
    end
  }

  -- markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
