local utils = require("core.utils")

return {
  "2KAbhishek/markit.nvim",
  dependencies = { "2kabhishek/pickme.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("markit").setup({
      add_default_keybindings = false,
    })
    utils.map_key(
      "n",
      "<leader>qm",
      "Markit mark list quickfix",
      "Fill the quickfix list with all marks in the current buffer."
    )
    utils.map_key("n", "m:", "Markit mark preview", "Markit preview")
    utils.map_key("n", "]m", "Markit mark next", "Markit next mark")
    utils.map_key("n", "[m", "Markit mark prev", "Markit prev mark")
  end,
}
