local utils = require("core.utils")

return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    -- move
    utils.map_key("n", "<leader>h", function()
      require("smart-splits").move_cursor_left()
    end, "move cursor left")
    utils.map_key("n", "<leader>l", function()
      require("smart-splits").move_cursor_right()
    end, "move cursor right")
    utils.map_key("n", "<leader>j", function()
      require("smart-splits").move_cursor_down()
    end, "move cursor down")
    utils.map_key("n", "<leader>k", function()
      require("smart-splits").move_cursor_up()
    end, "move cursor up")
    utils.map_key("n", "<leader>1r", function()
      require("smart-splits").move_cursor_previous()
    end, "jump to last visited split")

    -- resize
    utils.map_key("n", "<leader>@r", function()
      require("smart-splits").resize_left(15)
    end, "resize cursor left")
    utils.map_key("n", "<leader>6r", function()
      require("smart-splits").resize_right(15)
    end, "resize cursor right")
    utils.map_key("n", "<leader>4r", function()
      require("smart-splits").resize_down(15)
    end, "resize cursor down")
    utils.map_key("n", "<leader>5r", function()
      require("smart-splits").resize_up(15)
    end, "resize cursor up")

    -- swap
    utils.map_key("n", "<leader>@s", function()
      require("smart-splits").swap_buf_left()
    end, "swap buffer left")
    utils.map_key("n", "<leader>6s", function()
      require("smart-splits").swap_buf_right()
    end, "swap buffer right")
    utils.map_key("n", "<leader>4s", function()
      require("smart-splits").swap_buf_down()
    end, "swap buffer down")
    utils.map_key("n", "<leader>5s", function()
      require("smart-splits").swap_buf_up()
    end, "swap buffer up")
  end,
}
