return {
  'ayu-theme/ayu-vim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme ayu]])
  end,
}
