return {
  "jugarpeupv/processmonitor.nvim",
  config = function()
    require("ps").setup({
      -- Optional configuration
      ps_cmd = "ps aux", -- Command to list processes
      kill_cmd = "kill -9", -- Command to kill processes
    })
  end,
}
