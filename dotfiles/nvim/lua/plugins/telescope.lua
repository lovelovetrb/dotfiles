return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.2.0',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = { 'Telescope' },
  keys = {
    { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Telescope find files' },
    { '<leader>fw', function() require('telescope.builtin').live_grep() end,  desc = 'Telescope live grep' },
    { '<leader>fb', function() require('telescope.builtin').buffers() end,    desc = 'Telescope buffers' },
    { '<leader>fh', function() require('telescope.builtin').help_tags() end,  desc = 'Telescope help tags' },
  },
  config = function()
    local actions = require('telescope.actions')
    require('telescope').setup({
      defaults = {
        mappings = {
          i = { ["<Esc>"] = actions.close },
          n = { ["<Esc>"] = actions.close },
        },
      },
    })
  end
}
