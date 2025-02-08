return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    explorer = { replace_netrw = true },
    git = {
      patterns = { "GitSign" },
    },
    picker = {},
  },
  keys = {
    { "<leader>'", function() Snacks.explorer({ git_status_open = true }) end, desc = "File Explorer" },
    { "<leader><leader>", function() Snacks.picker.files({
      finder = "files",
      format = "file",
      show_empty = true,
      supports_live = true,
      layout = 'ivy',
    }) end, desc = "Find Files" },
    { '<leader>,',  function()
      Snacks.picker.buffers({
        finder = "buffers",
        format = "buffer",
        hidden = false,
        unloaded = true,
        current = true,
        sort_lastused = true,
          win = {
            input = {
              keys = {
                ["d"] = "bufdelete",
              },
            },
            list = { keys = { ["d"] = "bufdelete" } },
          },
      layout = "vscode",
    }) end, desc = "[P]Snacks picker buffers", },
  }
}
