return {
  "bassamsdata/namu.nvim",
  cmd = { "Namu" },
  keys = {
    { "<leader>ss", ":Namu symbols<cr>",   desc = "Jump to LSP symbol",       silent = true },
    { "<leader>sw", ":Namu workspace<cr>", desc = "LSP Symbols - Workspace",  silent = true },
  },
  opts = {
    global = {},
    namu_symbols = {
      options = {},
    },
  },
}
