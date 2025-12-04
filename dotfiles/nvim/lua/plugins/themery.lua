return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = { "gruvbox", "ayu", "nord", "tokyonight", "catppuccin" },
    })
  end
}
