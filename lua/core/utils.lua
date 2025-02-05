local M = {}

-- Utility function to register keymaps with descriptions
function M.map_key(mode, lhs, rhs, description, opts)
  opts = opts or {}
  opts.desc = description

  if type(rhs) == "string" then
    local command = rhs
    rhs = function()
      vim.api.nvim_exec2(command, { output = false })
    end
  end

  vim.api.nvim_set_keymap(mode, lhs, "", vim.tbl_extend("force", { callback = rhs }, opts))
end

return M
