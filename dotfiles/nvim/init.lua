require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.lsp")
require("config.diagnostics")

if vim.env.LOGFILE or vim.env.WARMUP then
  local start = vim.uv.hrtime()
  vim.api.nvim_create_autocmd("User", {
    once = true,
    -- snacks.nvim の場合はここを
    -- "SnacksDashboardOpened" とします。
    pattern = "DashboardLoaded",
    callback = function()
      if vim.env.LOGFILE then
        local finish = vim.uv.hrtime()
        vim.fn.writefile({ tostring((finish - start) / 1e6) }, vim.env.LOGFILE, "a")
      end
      vim.schedule_wrap(vim.cmd.qall) { bang = true }
    end,
  })
end
