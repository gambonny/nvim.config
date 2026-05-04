local utils = require("core.utils")

return {
  "Sang-it/fluoride",
  config = function()
    require("fluoride").setup()

    utils.map_key("n", "<leader>cp", ":Fluoride", "Fluoride")
    utils.map_key("n", "<leader>cv", ":Fluoride vsplit", "Fluoride split")
  end,
}
