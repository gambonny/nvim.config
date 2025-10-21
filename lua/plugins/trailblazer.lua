local utils = require("core.utils")

return {
  "LeonHeidelbach/trailblazer.nvim",
  config = function()
    require("trailblazer").setup({})

    utils.map_key("n", "<leader>tn", ":TrailBlazerNewTrailMark", "New Trail Mark")
    utils.map_key("n", "<leader>tb", ":TrailBlazerTrackBack", "Consume Trail Mark")
    utils.map_key("n", "<leader>tpn", ":TrailBlazerPeekMoveNextDown", "Peek Next Trail")
    utils.map_key("n", "<leader>tpb", ":TrailBlazerPeekMovePreviousUp", "Peek Previous Trail")
    utils.map_key("n", "<leader>tpq", ":TrailBlazerOpenTrailMarkList", "Open Trail Mark List")
  end,
}
