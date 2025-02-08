return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      lua = { "luacheck" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      json = { "jsonlint" },
      markdown = { "markdownlint" },
    }

    -- Automatically trigger linting on file save
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
