return {
  "metalelf0/kintsugi-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kintsugi").setup({
      variant = "flared",
      transparent = false,
      terminal_colors = true,
      bold_keywords = true,
      italic_comments = false,
    })
    vim.cmd.colorscheme("kintsugi-flared")
  end,
}
