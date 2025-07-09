local utils = require("core.utils")

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      word_diff = false,
      on_attach = function()
        local gs = package.loaded.gitsigns

        -- Navigation
        utils.map_key(
          "n",
          "]h",
          function()
            if vim.wo.diff then
              return "]h"
            end
            vim.schedule(function()
              gs.nav_hunk("next")
            end)
            return "<Ignore>"
          end,
          "next hunk",
          {
            expr = true,
          }
        )

        utils.map_key(
          "n",
          "[h",
          function()
            if vim.wo.diff then
              return "[h"
            end
            vim.schedule(function()
              gs.nav_hunk("prev")
            end)
            return "<Ignore>"
          end,
          "previous hunk",
          {
            expr = true,
          }
        )

        -- Actions
        utils.map_key("n", "<leader>hs", "Gitsigns stage_hunk", "Gitsigns stage hunk")
        utils.map_key("n", "<leader>hr", "Gitsigns reset_hunk", "Gitsigns reset hunk")
        utils.map_key("n", "<leader>hS", gs.stage_buffer, "Gitsigns stage buffer")
        utils.map_key("n", "<leader>hu", gs.undo_stage_hunk, "Gitsigns undo stage hunk")
        utils.map_key("n", "<leader>hR", gs.reset_buffer, "Gitsigns reset buffer")
        utils.map_key("n", "<leader>hp", gs.preview_hunk, "Gitsigns preview hunk")
        utils.map_key("n", "<leader>hi", gs.preview_hunk_inline, "Gitsigns preview hunk inline")
        utils.map_key("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "Gitsigns blame line")
        utils.map_key("n", "<leader>hl", gs.toggle_current_line_blame, "Gitsigns current line blame")
        utils.map_key("n", "<leader>hd", gs.diffthis, "Gitsigns diff this")
        utils.map_key("n", "<leader>hD", function()
          gs.diffthis("~")
        end, "Gitsigns diff this -")
        utils.map_key("n", "<leader>ht", gs.toggle_deleted, "Gitsigns toggle deleted")
        utils.map_key("n", "<leader>qh", "Gitsigns setqflist", "Gitsigns qflist")
      end,
    })
    require("scrollbar.handlers.gitsigns").setup()
  end,
}
