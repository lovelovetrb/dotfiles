return {
  'shaunsingh/nord.nvim',
  lazy = true,
  priority = 1000,
  config = function()
    require('nord').set()
  end,
}
