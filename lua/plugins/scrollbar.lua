return {
  "petertriho/nvim-scrollbar",
  name = "scrollbar",
  config = function()
    require("scrollbar").setup({
      handlers = { gitsigns = true },
    })
  end,
}
