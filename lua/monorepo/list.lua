local M = {}

local cache = nil

local function get_git_root()
  local ok, result = pcall(vim.fn.systemlist, "git rev-parse --show-toplevel")
  if not ok or not result or result[1] == "" then
    return nil
  end
  return result[1]
end

function M.get_monorepo_packages(opts)
  opts = opts or {}

  -- allow cache bypass
  if opts.refresh then
    cache = nil
  end

  if cache then
    return cache
  end

  local root = get_git_root()
  if not root then
    return {}
  end

  local workspace_file = root .. "/pnpm-workspace.yaml"
  if vim.fn.filereadable(workspace_file) == 0 then
    return {}
  end

  local lines = vim.fn.readfile(workspace_file)
  local globs = {}

  for _, line in ipairs(lines) do
    local glob = line:match("%s*%- (.+)")
    if glob then
      table.insert(globs, glob)
    end
  end

  local packages = {}
  for _, glob in ipairs(globs) do
    local raw_paths = vim.fn.glob(root .. "/" .. glob, true, true)
    for _, path in ipairs(raw_paths) do
      if
        vim.fn.isdirectory(path) == 1
        and vim.fn.filereadable(path .. "/package.json") == 1
        and not path:find("/node_modules/")
      then
        table.insert(packages, {
          name = vim.fs.basename(path),
          path = path,
        })
      end
    end
  end

  table.sort(packages, function(a, b)
    return a.path < b.path
  end)

  cache = packages
  return packages
end

return M
