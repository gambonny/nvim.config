return {
  "briangwaltney/paren-hint.nvim",
  lazy = false,
  config = function()
    require("paren-hint").setup({
      include_paren = true,
      anywhere_on_line = true,
      show_same_line_opening = false,
    })
  end,
}
