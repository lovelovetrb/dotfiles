local M = {}
M.general = {
  i = {

    ["jj"] = { "<Esc>", "Leave Insert mode" },
  },
  n = {
    -- create new tab
    ["te"] = { ":tabnew<Return>", "new tab" },
    -- move beginning of line or ending of line
    ["<leader>h"] = { "^", "move beginning of line" },
    ["<leader>l"] = { "$", "move beginning of line" },

    -- Split window
    ["ss"] = { ":split<Return><C-w>w", "split window vertically" },
    ["sv"] = { ":vsplit<Return><C-w>w", "split window horizontally" },

    -- forced termination
    ["<leader>q"] = { ":<C-u>q!<Return>", "forced termination" },

    --  show error
    ["qp"] = { "<Cmd>lua vim.diagnostic.setqflist()<CR>" }
  }

}

return M
