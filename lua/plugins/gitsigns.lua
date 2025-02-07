local utils = require("core.utils")

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- Navigation
        utils.map_key(
          "n",
          "]g",
          function()
            if vim.wo.diff then
              return "]g"
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
          "[g",
          function()
            if vim.wo.diff then
              return "[g"
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
        utils.map_key("n", "<leader>gs", "Gitsigns stage_hunk", "Gitsigns stage hunk")
        utils.map_key("n", "<leader>gr", "Gitsigns reset_hunk", "Gitsigns reset hunk")
        utils.map_key("n", "<leader>gS", gs.stage_buffer, "Gitsigns stage buffer")
        utils.map_key("n", "<leader>gu", gs.undo_stage_hunk, "Gitsigns undo stage hunk")
        utils.map_key("n", "<leader>gR", gs.reset_buffer, "Gitsigns reset buffer")
        utils.map_key("n", "<leader>gp", gs.preview_hunk, "Gitsigns preview hunk")
        utils.map_key("n", "<leader>gi", gs.preview_hunk_inline, "Gitsigns preview hunk inline")
        utils.map_key("n", "<leader>gb", function()
          gs.blame_line({ full = true })
        end, "Gitsigns blame line")
        utils.map_key("n", "<leader>gl", gs.toggle_current_line_blame, "Gitsigns current line blame")
        utils.map_key("n", "<leader>gd", gs.diffthis, "Gitsigns diff this")
        utils.map_key("n", "<leader>gDD", function()
          gs.diffthis("~")
        end, "Gitsigns diff this -")
        utils.map_key("n", "<leader>gt", gs.toggle_deleted, "Gitsigns toggle deleted")
        utils.map_key("n", "<leader>gq", "Gitsigns setqflist", "Gitsigns qflist")
      end,
    })
    require("scrollbar.handlers.gitsigns").setup()
  end,
}
