return {
  "esmuellert/vscode-diff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  config = function()
    require("vscode-diff").setup({
      keymaps = {
        view = {
          next_hunk = "]h",
          prev_hunk = "[h",
          toggle_explorer = "<leader>/b",
        },
      },
    })
  end,
}
