local M = {}
local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

M.show_packages = function()
  local packages = require("monorepo.list").get_monorepo_packages()
  if not packages or vim.tbl_isempty(packages) then
    vim.notify("No monorepo packages found", vim.log.levels.WARN)
    return
  end

  local items = {}
  for _, pkg in ipairs(packages) do
    local relative_path = pkg.path:gsub("^" .. git_root .. "/", "")
    table.insert(items, {
      name = relative_path,
      text = relative_path,
      path = pkg.path,
    })
  end

  table.sort(items, function(a, b)
    return a.name < b.name
  end)

  require("snacks").picker({
    title = "Monorepo Packages",
    layout = {
      preset = "vscode",
    },
    items = items,
    format = function(item)
      return {
        { item.text, "Normal" },
      }
    end,
    confirm = function(picker, item)
      picker:close()
      vim.cmd.cd(item.path)
      vim.notify("cd → " .. item.name .. " (" .. item.path .. ")", vim.log.levels.INFO)

      require("snacks").picker.files({
        cwd = item.path,
        layout = { preset = vim.o.columns >= 120 and "ivy" or "vertical" },
      })
    end,
  })
end

return M
