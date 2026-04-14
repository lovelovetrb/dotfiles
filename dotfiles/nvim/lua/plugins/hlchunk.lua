return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        use_treesitter = true,
        chars = {
          horizontal_line = "-",
          vertical_line = "┃",
          left_top = "┏",
          right_arrow = "▶",
          left_bottom = "┗",
        },
        style = "#7aa2f7",
        delay = 0,
      },

    })
  end
}
