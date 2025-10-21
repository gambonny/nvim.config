return {
  "jameswolensky/marker-groups.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required
    "folke/snacks.nvim", -- Optional: Snacks picker
  },
  config = function()
    require("marker-groups").setup({
      picker = "snacks",
    })
  end,
}
