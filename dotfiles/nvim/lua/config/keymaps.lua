-- normal mode
vim.keymap.set('n', '<C-h>', '<C-w>h', {
  noremap = true,
  silent = true,
  desc = 'Move to left window'
})

vim.keymap.set('n', '<C-j>', '<C-w>j', {
  noremap = true,
  silent = true,
  desc = 'Move to bottom window'
})

vim.keymap.set('n', '<C-k>', '<C-w>k', {
  noremap = true,
  silent = true,
  desc = 'Move to above window'
})

vim.keymap.set('n', '<C-l>', '<C-w>l', {
  noremap = true,
  silent = true,
  desc = 'Move to right window'
})

vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR>', {
  noremap = true,
  silent = true,
  desc = 'Clear search highlight'
})

vim.keymap.set('n', 'H', '^', {
  noremap = true,
  silent = true,
  desc = 'Move to beginning of line'
})

vim.keymap.set('n', 'L', '$', {
  noremap = true,
  silent = true,
  desc = 'Move to end of line'
})

vim.keymap.set('n', '<C-f>', function()
  require('conform').format({ async = false, lsp_fallback = true })
end, {
  noremap = true,
  silent = true,
  desc = 'Format with conform'
})

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
  noremap = true,
  silent = true,
  desc = 'Go to definition'
})


vim.keymap.set('n', '<Tab>', ':BufferNext<CR>', {
  noremap = true,
  silent = true,
  desc = 'Next buffer'
})

vim.keymap.set('n', '<S-Tab>', ':BufferPrevious<CR>', {
  noremap = true,
  silent = true,
  desc = 'Previous buffer'
})

vim.keymap.set('n', '<leader>x', ':BufferClose<CR>', {
  noremap = true,
  silent = true,
  desc = 'Close buffer'
})

vim.keymap.set('n', '<leader>q', ':q<CR>', {
  noremap = true,
  silent = true,
  desc = 'Quit window'
})

-- insert mode
vim.keymap.set('i', 'jj', '<ESC>', {
  noremap = true,
  silent = true,
  desc = 'Exit insert mode with jj'
})

vim.keymap.set('i', '<C-h>', '<Left>', {
  noremap = true,
  silent = true,
  desc = 'Move left in insert mode'
})

vim.keymap.set('i', '<C-j>', '<Down>', {
  noremap = true,
  silent = true,
  desc = 'Move down in insert mode'
})

vim.keymap.set('i', '<C-k>', '<Up>', {
  noremap = true,
  silent = true,
  desc = 'Move up in insert mode'
})

vim.keymap.set('i', '<C-l>', '<Right>', {
  noremap = true,
  silent = true,
  desc = 'Move right in insert mode'
})


-- visual mode
vim.keymap.set('v', 'v', '$', {
  noremap = true,
  silent = true,
  desc = 'Select to end of line'
})

-- terminal mode
vim.keymap.set('t', 'qq', [[<C-\><C-n>]], {
  noremap = true,
  silent = true,
  desc = 'Exit terminal mode with qq'
})
