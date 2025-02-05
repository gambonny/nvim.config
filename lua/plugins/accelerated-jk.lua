return {
  "rainbowhxch/accelerated-jk.nvim",
  config = function()
    vim.api.nvim_set_keymap("n", "j", "<plug>(accelerated_jk_gj)", { noremap = true, silent = true })
  end,
}
