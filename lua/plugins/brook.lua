return {
  "bravoecho/brook.nvim",
  dependencies = {
    -- Optional, highly recommended for result context and preview.
    -- See: https://github.com/kevinhwang91/nvim-bqf
    { "kevinhwang91/nvim-bqf", optional = true },
  },

  -- Lazy loading
  cmd = {
    "Rg",
    "RgStop",
    "RgRepeat",
  },
  keys = {
    { "<leader>gg", mode = "n", desc = "Search for current word with ripgrep" },
    { "<leader>gg", mode = "x", desc = "Search for visual selection with ripgrep" },
    { "<leader>g/", mode = "n", desc = "Open ripgrep prompt" },
    { "<leader>gG", mode = "n", desc = "Stop ripgrep search" },
    { "<leader>gR", mode = "n", desc = "Repeat last ripgrep search" },
  },

  -- Defaults (you only need to specify the fields you want to customise)
  opts = {
    -- Keymaps (set to false to disable)
    keymap_cword = "<leader>gg",
    keymap_visual = "<leader>gg",
    keymap_prompt = "<leader>g/",
    keymap_stop = "<leader>gG",
    keymap_repeat = "<leader>gR",

    -- Result limits
    max_results = 1000, -- 1-10,000
    max_preview_chars = 200, -- 100-500

    -- Performance tuning
    max_batch_size = 100, -- results per quickfix update
    flush_throttle_ms = 10, -- delay between updates (0 to disable)

    -- Quickfix window
    qf_open = true,
    qf_auto_resize = true,
    qf_win_height = 10,

    -- 'one-line-per-match' (default) or 'unique-lines'
    output_format = "one-line-per-match",

    -- Populate search register for n/N navigation and :cfdo substitutions
    set_search_register = true,
  },
}
