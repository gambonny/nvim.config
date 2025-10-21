-- File: lua/plugins/lspconfig.lua
local keymap_utils = require("core.utils")
local map_key = keymap_utils.map_key

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "saghen/blink.cmp" },
    { "zeioth/garbage-day.nvim", config = true },
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- Define configs
    vim.lsp.config("ts_ls", { capabilities = capabilities })
    vim.lsp.config("astro", { capabilities = capabilities })
    vim.lsp.config("html", { capabilities = capabilities })
    vim.lsp.config("biome", { capabilities = capabilities })

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim", "Snacks" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })

    -- Enable (autostart based on filetype/root markers)
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("astro")
    vim.lsp.enable("html")
    vim.lsp.enable("biome")
    vim.lsp.enable("lua_ls")

    -- Keymaps
    map_key("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map_key("n", "K", vim.lsp.buf.hover, "Hover for info")
    map_key("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
    map_key("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map_key("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map_key("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
    map_key("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
    map_key("n", "<leader>e", vim.diagnostic.open_float, "Open diagnostic tooltip")
    map_key("n", "<leader>qd", vim.diagnostic.setloclist, "Set location list")
  end,
}
