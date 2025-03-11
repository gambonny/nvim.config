local utils = require("core.utils")

return {
  "2KAbhishek/markit.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("markit").setup()
    utils.map_key("n", "<leader>qm", "MarksQFListBuf", "Fill the quickfix list with all marks in the current buffer.")
  end,
}
