return {
  "cbochs/grapple.nvim",
  opts = {
    scope = "cwd",
  },
  event = { "BufReadPost", "BufNewFile" },
  cmd = "Grapple",
  keys = {
    { "<leader>ag", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
    { "<leader>ga", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
    { "<leader>gn", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
    { "<leader>gb", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
    { "<leader>21", "<cmd>Grapple select index=1<cr>", desc = "Grapple index 1" },
    { "<leader>22", "<cmd>Grapple select index=2<cr>", desc = "Grapple index 2" },
    { "<leader>23", "<cmd>Grapple select index=3<cr>", desc = "Grapple index 3" },
    { "<leader>24", "<cmd>Grapple select index=4<cr>", desc = "Grapple index 4" },
    { "<leader>25", "<cmd>Grapple select index=5<cr>", desc = "Grapple index 5" },
  },
}
