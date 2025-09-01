return {
  "piersolenski/import.nvim",
  dependencies = {
    "folke/snacks.nvim",
  },
  opts = {
    picker = "snacks",
  },
  keys = {
    {
      "<leader>ti",
      function()
        require("import").pick()
      end,
      desc = "Import",
    },
  },
}
