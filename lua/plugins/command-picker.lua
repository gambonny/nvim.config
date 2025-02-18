local utils = require("core.utils")

return {
  "https://gitlab.com/silvercircle74/commandpicker.nvim",
  branch = "v1",
  config = function()
    require("commandpicker").setup({
      commands = {
        {
          desc = "Copy buffers to clipboard",
          cmd = function()
            vim.api.nvim_exec2("CopyBuffersToClipboard", { output = false })
          end,
        },
        {
          desc = "Copy quickfix files to clipboard",
          cmd = function()
            vim.api.nvim_exec2("CopyQuickfixFilesToClipboard", { output = false })
          end,
        },
        {
          desc = "Copy current buffer to clipboard",
          cmd = function()
            vim.api.nvim_exec2("CopyCurrentBufferToClipboard", { output = false })
          end,
        },
      },
    })

    utils.map_key("n", "<leader>cc", function()
      require("commandpicker").open({
        layout = "vscode",
      })
    end, "Open custom commands picker")
  end,
}
