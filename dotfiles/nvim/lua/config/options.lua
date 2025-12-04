vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.fillchars = { eob = ' ' }
vim.opt.laststatus = 0 -- 3: global statusline  2: always statusline 1: show statusline when over two window 0: no statusline
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.termguicolors = true
vim.opt.splitright = true

vim.opt.fillchars:append({ vert = '│', vertleft = '│', vertright = '│', verthoriz = '│' })

local function apply_transparency()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
  vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
  vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#3b4261", bg = "none" })
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3b4261", bg = "none" })
  vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
  vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
  vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })
end

apply_transparency()

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = apply_transparency,
})
