return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "vim",
        "bash",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "html",
        "css",
        "astro",
        "regex",
      },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true },
      matchup = { enable = true },
    })
  end,
}
