return {
  "esmuellert/codediff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  config = function()
    require("codediff").setup({
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
