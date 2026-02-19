vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.fillchars = { eob = ' ' }
vim.opt.laststatus = 0 -- 3: global statusline  2: always statusline 1: show statusline when over two window 0: no statusline
vim.opt.statusline = "─"
vim.opt.fillchars:append({ stl = "─", stlnc = "─" })
vim.opt.cmdheight = 0
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.termguicolors = true
vim.opt.splitright = true

vim.opt.fillchars:append({ vert = '│', vertleft = '│', vertright = '│', verthoriz = '│' })

local function apply_transparency()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
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

local osc52 = require("vim.ui.clipboard.osc52")

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = osc52.copy("+"),
    ["*"] = osc52.copy("*"),
  },
  paste = {
    ["+"] = osc52.paste("+"),
    ["*"] = osc52.paste("*"),
  },
}

-- tmux内ではOSC 52のpaste応答がtmuxに傍受されるため、
-- コピーはOSC 52（DCSパススルー経由で透過）、
-- ペーストはNeovim内部レジスタにフォールバック
if vim.env.TMUX then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = osc52.copy("+"),
      ["*"] = osc52.copy("*"),
    },
    paste = {
      ["+"] = function()
        return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
      end,
      ["*"] = function()
        return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
      end,
    },
  }
end

-- kittyはブラケットペーストモードが無効な接続（SSH等）では
-- 改行をNEL（ESC E = \x1bE）に変換するため、vim.pasteをオーバーライドして対処
vim.paste = (function(overridden)
  return function(lines, phase)
    local new_lines = {}
    for _, line in ipairs(lines) do
      local parts = vim.split(line, "\027E", { plain = true })
      for _, part in ipairs(parts) do
        table.insert(new_lines, part)
      end
    end
    return overridden(new_lines, phase)
  end
end)(vim.paste)
