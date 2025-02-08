return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup()
      require("mini.bracketed").setup()
    end,
    event = "VeryLazy",
  },
}
