local utils = require("core.utils")
return {
  "stevearc/quicker.nvim",
  event = "FileType qf",
  ---@module "quicker"
  ---@type quicker.SetupOptions
  opts = {},
  config = function()
    require("quicker").setup()
    utils.map_key("n", "<leader>qo", function()
      require("quicker").toggle()
    end, "Quicker - Toggle")
  end,
}
