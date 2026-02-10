return {
  "EvWilson/spelunk.nvim",
  dependencies = {
    "folke/snacks.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-lualine/lualine.nvim",
  },
  config = function()
    require("spelunk").setup({
      enable_persist = true,
      statusline_prefix = "🔖",
      fuzzy_search_provider = "snacks",
      enable_status_col_display = true,
      base_mappings = {
        toggle = "<leader>bu",
      },
    })
  end,
}
