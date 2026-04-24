return {
  "SmiteshP/nvim-navic",
  lazy = true,
  config = function()
    require("nvim-navic").setup({
      lsp = {
        auto_attach = true,
        preference = { "pyright", "pyrefly" },
      },
    })
  end,
}
