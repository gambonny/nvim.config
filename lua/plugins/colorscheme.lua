return {
  "Everblush/nvim",
  name = "everblush",
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme("everblush")
  end,
}
