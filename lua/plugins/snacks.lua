local workspace_picker = require("monorepo.picker")

function cd_up(picker)
  picker:set_cwd(vim.fs.dirname(picker:cwd()))
  picker:find()
end

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
      finders = {
        monorepo_packages = { source = "monorepo_packages" },
      },
      sources = {
        monorepo_packages = {
          get_items = function()
            return workspace_picker.get_monorepo_packages()
          end,
          format_item = function(item)
            return item.name
          end,
          select_item = function(item)
            vim.cmd.cd(item.path)
            vim.notify("Switched to " .. item.name .. " at " .. item.path)
          end,
          layout = "vscode",
        },
        files = {
          layout = {
            preset = function()
              return vim.o.columns >= 120 and "ivy" or "vertical"
            end,
          },
          actions = {
            cd_up = function(picker, _)
              cd_up(picker)
            end,
          },
          win = {
            input = {
              keys = {
                ["<c-.>"] = { "cd_up", desc = "cd_up", mode = { "i", "n" } },
              },
            },
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader>'",
      function()
        Snacks.explorer({ git_status_open = true, focus = "list", enter = false })
      end,
      desc = "File Explorer",
    },
    {
      "<leader><leader>",
      function()
        Snacks.picker.files({
          layout = "vscode",
        })
      end,
      desc = "Find Files",
    },
    {
      "<leader>G",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status",
    },
    {
      "<leader>.",
      function()
        Snacks.picker.files({ cwd = vim.fn.expand("%:p:h"), layout = "vscode" })
      end,
      desc = "Find adjacent files",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Git Diff (Hunks)",
    },
    {
      "<leader>sc",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
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
      desc = "Zen",
    },
    {
      "<leader>zo",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Zoom",
    },
    {
      "<leader>sp",
      function()
        require("monorepo.picker").show_packages()
      end,
      desc = "Switch to monorepo package",
    },
  },
}
