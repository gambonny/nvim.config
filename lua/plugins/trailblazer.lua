local utils = require("core.utils")

return {
  "LeonHeidelbach/trailblazer.nvim",
  config = function()
    require("trailblazer").setup({})

    utils.map_key("n", "<leader>tn", ":TrailBlazerNewTrailMark", "move cursor left")
    utils.map_key("n", "<leader>tb", ":TrailBlazerTrackBack", "move cursor left")
    utils.map_key("n", "<leader>tpn", ":TrailBlazerPeekMoveNextDown", "move cursor left")
    utils.map_key("n", "<leader>tpb", ":TrailBlazerPeekMovePreviousUp", "move cursor left")
    utils.map_key("n", "<leader>tpq", ":TrailBlazerOpenTrailMarkList", "move cursor left")
  end,
}
