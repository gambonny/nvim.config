return {
  "tomiis4/BufferTabs.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    require("buffertabs").setup({
      show_single_buffer = false,
      horizontal = "right",
      max_buffers = 6,
      display = "column",
    })
  end,
}
