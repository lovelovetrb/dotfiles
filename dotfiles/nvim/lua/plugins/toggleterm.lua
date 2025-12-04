return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    keys = {
      { "<A-i>", "<cmd>ToggleTerm 1 direction=float<cr>",      desc = "Toggle floating terminal",   mode = { "n", "t" } },
      { "<A-h>", "<cmd>ToggleTerm 2 direction=horizontal<cr>", desc = "Toggle horizontal terminal", mode = { "n", "t" } },
      { "<A-v>", "<cmd>ToggleTerm 3 direction=vertical<cr>",   desc = "Toggle vertical terminal",   mode = { "n", "t" } },
    },
    config = function()
      require("toggleterm").setup({
        direction = "float",
        size = function(term)
          if term.direction == "horizontal" then
            return math.floor(vim.o.lines * 0.2)
          elseif term.direction == "vertical" then
            return math.floor(vim.o.columns * 0.3)
          end
        end,
        float_opts = {
          border = "curved",
          width = function()
            return math.floor(vim.o.columns * 0.4)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.3)
          end,
        },
      })
    end
  }
}
