return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      renderer = {
        root_folder_label = false,
      },
      view = {
        relativenumber = false,
      },
    }
    vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', {
      noremap = true,
      silent = true,
      desc = 'Toggle nvim-tree'
    })
  end,
}
