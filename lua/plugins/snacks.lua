return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    explorer = { replace_netrw = true },
    bufdelete = {},
    git = {
      patterns = { "GitSign" },
    },
    indent = {},
    input = {},
    picker = {
      sources = {
        files = {
          layout = {
            preset = function()
              return vim.o.columns >= 120 and "ivy" or "vertical"
            end,
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader>'",
      function()
        Snacks.explorer({ git_status_open = true })
      end,
      desc = "File Explorer",
    },
    {
      "<leader><leader>",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>,",
      function()
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
        })
      end,
      desc = "[P]Snacks picker buffers",
    },
    {
      "<leader><space>",
      function()
        Snacks.bufdelete.delete({
          wipe = true,
        })
      end,
      desc = "Delete buffer keeping layout",
    },
    {
      "<leader>@d",
      function()
        Snacks.bufdelete.other({})
      end,
      desc = "Delete buffer keeping layout",
    },
  },
}
