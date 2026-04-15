return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    image = {
      doc = {
        enabled = true,
        inline = true,
        float = true,
      },
      convert = {
        notify = true,
        mermaid = function()
          local theme = vim.o.background == "light" and "neutral" or "dark"
          return { "-i", "{src}", "-o", "{file}", "-b", "transparent", "-t", theme, "-s", "{scale}" }
        end,
      },
    },
    styles = {
      backdrop = false,
    },
  },
}
