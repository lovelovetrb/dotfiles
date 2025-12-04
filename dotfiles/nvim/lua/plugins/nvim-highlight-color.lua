return {
  'brenoprata10/nvim-highlight-colors',
  config = function()
    require('nvim-highlight-colors').setup {
      virtual_symbol = '',
      render = 'virtual',
      enable_tailwind = true,
    }
  end,
}
