local utils = require("core.utils")

return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    utils.map_key("n", "<leader>ah", "lua require('harpoon.ui').toggle_quick_menu()", "Harpoon add")

    utils.map_key("n", "<leader>aa", "lua require('harpoon.mark').add_file()", "Harpoon add")
    utils.map_key("n", "<leader>ar", "lua require('harpoon.mark').rm_file()", "Harpoon remove")
    utils.map_key("n", "<leader>ac", "lua require('harpoon.mark').clear_all()", "Harpoon clear")

    utils.map_key("n", "[a", "lua require('harpoon.ui').nav_prev()", "Prev harpooned file")
    utils.map_key("n", "]a", "lua require('harpoon.ui').nav_next()", "Next harpooned file")

    utils.map_key("n", "<leader>1", "lua require('harpoon.ui').nav_file(1)", "Harpoon index 1")
    utils.map_key("n", "<leader>2", "lua require('harpoon.ui').nav_file(2)", "Harpoon index 2")
    utils.map_key("n", "<leader>3", "lua require('harpoon.ui').nav_file(3)", "Harpoon index 3")
    utils.map_key("n", "<leader>4", "lua require('harpoon.ui').nav_file(4)", "Harpoon index 4")
    utils.map_key("n", "<leader>5", "lua require('harpoon.ui').nav_file(5)", "Harpoon index 5")
    utils.map_key("n", "<leader>6", "lua require('harpoon.ui').nav_file(6)", "Harpoon index 6")
    utils.map_key("n", "<leader>7", "lua require('harpoon.ui').nav_file(7)", "Harpoon index 7")
    utils.map_key("n", "<leader>8", "lua require('harpoon.ui').nav_file(8)", "Harpoon index 8")
    utils.map_key("n", "<leader>9", "lua require('harpoon.ui').nav_file(9)", "Harpoon index 9")
  end,
}
