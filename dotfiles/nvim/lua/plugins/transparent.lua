return {
  "xiyaowong/transparent.nvim",
  lazy = false,
  opts = {
    extra_groups = {
      "NeoTreeNormal",
      "NeoTreeNormalNC",
      "NeoTreeEndOfBuffer",
      "NeoTreeWinSeparator",
      "SignColumn",
      "FloatBorder",
      "TabLine",
      "TabLineFill",
      "TabLineSel",
    },
  },
  config = function(_, opts)
    require("transparent").setup(opts)
    vim.cmd("TransparentEnable")
  end,
}
