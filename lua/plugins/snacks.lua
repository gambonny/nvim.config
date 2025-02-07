return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    explorer = { replace_netrw = true },
    git = {
      patterns = { "GitSign" },
    },
  },
  keys = {
    { "<leader>'", function() Snacks.explorer({ git_status_open = true }) end, desc = "File Explorer" },
  }
}
