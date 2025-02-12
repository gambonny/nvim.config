local keymap_utils = require("core.utils")
local map_key = keymap_utils.map_key

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true }, -- LSP installer
    { "williamboman/mason-lspconfig.nvim", config = true }, -- Mason + lspconfig bridge
    { "saghen/blink.cmp" }, -- Autocompletion engine
    { "zeioth/garbage-day.nvim", config = true }, -- Stops inactive LSP clients to free RAM
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- Ensure LSP servers are installed
    mason_lspconfig.setup({
      ensure_installed = { "ts_ls", "lua_ls", "astro", "html" },
    })

    local lspconfig = require("lspconfig")

    lspconfig.ts_ls.setup({ capabilities = capabilities })
    lspconfig.astro.setup({ capabilitites = capabilities })
    lspconfig.html.setup({ capabilities = capabilities })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "Snacks" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })

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
