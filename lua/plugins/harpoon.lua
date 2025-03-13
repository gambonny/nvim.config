local utils = require("core.utils")

return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    utils.map_key("n", "<leader>ha", "lua require('harpoon.ui').toggle_quick_menu()", "Harpoon add")

    utils.map_key("n", "<leader>ah", "lua require('harpoon.mark').add_file()", "Harpoon add")
    utils.map_key("n", "<leader>ar", "lua require('harpoon.mark').rm_file()", "Harpoon remove")
    utils.map_key("n", "<leader>ac", "lua require('harpoon.mark').clear_all()", "Harpoon clear")

    utils.map_key("n", "[a", "lua require('harpoon.ui').nav_prev()", "Prev harpooned file")
    utils.map_key("n", "]a", "lua require('harpoon.ui').nav_next()", "Next harpooned file")

    utils.map_key("n", "<leader>11", "lua require('harpoon.ui').nav_file(1)", "Harpoon index 1")
    utils.map_key("n", "<leader>12", "lua require('harpoon.ui').nav_file(2)", "Harpoon index 2")
    utils.map_key("n", "<leader>13", "lua require('harpoon.ui').nav_file(3)", "Harpoon index 3")
    utils.map_key("n", "<leader>14", "lua require('harpoon.ui').nav_file(4)", "Harpoon index 4")
    utils.map_key("n", "<leader>15", "lua require('harpoon.ui').nav_file(5)", "Harpoon index 5")
    utils.map_key("n", "<leader>16", "lua require('harpoon.ui').nav_file(6)", "Harpoon index 6")
    utils.map_key("n", "<leader>17", "lua require('harpoon.ui').nav_file(7)", "Harpoon index 7")
    utils.map_key("n", "<leader>18", "lua require('harpoon.ui').nav_file(8)", "Harpoon index 8")
    utils.map_key("n", "<leader>19", "lua require('harpoon.ui').nav_file(9)", "Harpoon index 9")
  end,
}
