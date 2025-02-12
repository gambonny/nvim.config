return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    explorer = { replace_netrw = true },
    bufdelete = {},
    dim = {},
    git = {
      patterns = { "GitSign" },
    },
    indent = {},
    input = {},
    toggle = {},
    words = {},
    zen = {},
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
      "<leader>sp",
      function()
        Snacks.picker.projects({
          dev = "~/urrepo/three/packages/",
          projects = { "~/urrepo/three/" },
          recent = false,
        })
      end,
      desc = "Projects",
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
      "<leader>=",
      function()
        Snacks.picker.lsp_symbols({ layout = { preset = "vscode", preview = "main" } })
      end,
      desc = "Symbols preview",
    },
    {
      "<leader>sr",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume",
    },
    {
      "<leader>su",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo History",
    },
    {
      "<leader>@d",
      function()
        Snacks.bufdelete.other({})
      end,
      desc = "Delete buffer keeping layout",
    },
    {
      "<leader>zz",
      function()
        Snacks.zen.zen()
      end,
      desc = "Delete buffer keeping layout",
    },
    {
      "<leader>zo",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Delete buffer keeping layout",
    },
  },
}
