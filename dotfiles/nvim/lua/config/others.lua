local function auto_activate_venv()
  local venv_path = vim.fn.getcwd() .. "/.venv"
  if vim.fn.isdirectory(venv_path) == 1 then
    vim.env.VIRTUAL_ENV = venv_path
    vim.env.PATH = venv_path .. "/bin:" .. vim.env.PATH
    require("noice").redirect(function()
      local notify = require "notify"
      notify("activate -> " .. venv_path, "info", { title = "Activate venv" })
    end)
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    auto_activate_venv()
  end,
})
