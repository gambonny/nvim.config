return {
  "subev/sibling-jump.nvim",
  config = function()
    require("sibling_jump").setup({
      next_key = "<leader>jj", -- Jump to next sibling (default)
      prev_key = "<leader>kk", -- Jump to previous sibling (default)
      block_loop_key = "<leader>ll", -- Cycle through block boundaries (optional)
      center_on_jump = false, -- Center screen after jump (default: false)
    })
  end,
}
