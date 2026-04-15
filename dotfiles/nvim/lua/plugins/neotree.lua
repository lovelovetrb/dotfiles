return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
    {
      "s1n7ax/nvim-window-picker",
      version = "2.*",
      config = function()
        require("window-picker").setup({
          hint = "statusline-winbar",
          selection_chars = "abcdefghijklmnopqrstuvwxyz",
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            bo = {
              filetype = { "neo-tree", "neo-tree-popup", "notify" },
              buftype = { "terminal", "quickfix" },
            },
          },
          highlights = {
            statusline = {
              focused   = { fg = "#c0caf5", bg = "#3d59a1", bold = true },
              unfocused = { fg = "#c0caf5", bg = "#2d3f6c", bold = true },
            },
            winbar = {
              focused   = { fg = "#c0caf5", bg = "#3d59a1", bold = true },
              unfocused = { fg = "#c0caf5", bg = "#2d3f6c", bold = true },
            },
          },
        })
      end,
    },
  },
  lazy = false,                    -- neo-tree will lazily load itself
  keys = {
    {
      "<C-n>",
      function() require("neo-tree.command").execute({ toggle = true }) end,
      desc = "Toggle Neo-tree",
    },
  },
  config = function()
    require("neo-tree").setup({
      sources = { "filesystem", "buffers", "git_status" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        mappings = {
          ["l"] = "open_with_window_picker",
          ["<cr>"] = "open_with_window_picker",
          ["h"] = "close_node",
          ["<space>"] = "none",
          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg("+", path, "c")
            end,
            desc = "Copy Path to Clipboard",
          },
          ["O"] = {
            function(state)
              require("lazy.util").open(state.tree:get_node().path, { system = true })
            end,
            desc = "Open with System Application",
          },
          ["P"] = { "toggle_preview", config = { use_float = false } },
          ["w"] = "open_with_window_picker",
          ["<C-v>"] = "open_vsplit",
          ["<C-s>"] = "open_split",
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        git_status = {
          symbols = {
            unstaged = "󰄱",
            staged = "󰱒",
          },
        },
      }
    })

    vim.api.nvim_set_hl(0, "NeoTreeDimText", { link = "NeoTreeNormal" })
  end,
}
