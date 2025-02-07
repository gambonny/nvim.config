return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = true,
  opts = {
    check_ts = true, -- Enable Treesitter for smarter pairing
    enable_check_bracket_line = true, -- Prevent extra brackets on the same line
  }
}
