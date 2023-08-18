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
    ["qp"] = { "<Cmd>lua vim.diagnostic.setqflist()<CR>" },

    ["<C-f>"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
  },

  v = {
    ["v"] = { "$h", "行末まで選択" }
  },
  t = {
    ["jj"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  }
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["gcc"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["gcc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.nvterm = {
  plugin = true,
  n = {
    ["tt"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
  },
}

return M
