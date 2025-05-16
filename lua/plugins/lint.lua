local utils = require("core.utils")

return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      lua = { "luacheck" },
      javascript = { "biomejs" },
      typescript = { "biomejs" },
      javascriptreact = { "biomejs" },
      typescriptreact = { "biomejs" },
      astro = { "biomejs" },
      json = { "jsonlint" },
      markdown = { "markdownlint" },
    }

    -- Automatically trigger linting on file save
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })

    -- Send diagnostics to quickfix
    utils.map_key("n", "<leader>dq", function()
      vim.diagnostic.setqflist()
    end, "Send diagnostics to quickfix")

    -- Send diagnostics to loclist
    utils.map_key("n", "<leader>lq", function()
      vim.diagnostic.setloclist()
    end, "Send diagnostics to loclist")
  end,
}
