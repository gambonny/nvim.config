return {
  -- "Koalhack/darcubox-nvim",
  "wadackel/vim-dogrun",
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme("dogrun")
  end,
}
