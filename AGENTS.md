## Layout
- `init.lua` is the only root entrypoint; it loads `core.mappings`, `core.settings`, then `core.lazy` in that order.
- `lua/plugins/*.lua` is auto-imported by `lazy.nvim` via `require("lazy").setup({ spec = { { import = "plugins" } } })`; add or change plugin specs there instead of wiring imports manually.
- Repo-local logic lives outside plugin specs: `lua/core/*.lua` for editor defaults/helpers and `lua/monorepo/*.lua` for the custom pnpm workspace picker.

## Verified Commands
- Format Lua changes with `stylua <paths>`; style is defined only in `.stylua.toml` (2 spaces, width 120).
- Fast syntax/load check: `nvim --headless "+qa"`.
- There is no repo test suite, task runner, or CI config in this checkout; practical verification is `stylua` plus a headless Neovim startup.

## Tooling Quirks
- Formatting-on-save is configured in `lua/plugins/conform.lua`: `stylua` for Lua, `biome` for JS/TS/TSX/Astro/JSON, with `lsp_fallback = false`.
- Linting-on-save is configured separately in `lua/plugins/lint.lua`: `luacheck`, `biomejs`, `jsonlint`, and `markdownlint` by filetype.
- LSP setup is in `lua/plugins/lspconfig.lua` and uses Neovim's `vim.lsp.config` / `vim.lsp.enable` API, not the older `require("lspconfig").*.setup()` pattern.
- Treesitter parsers are explicitly managed in `lua/plugins/treesitter.lua`; if you add a new language-dependent feature, update `ensure_installed` there.

## Repo-Specific Behavior
- Leader is `;` (`core/mappings.lua` and `core/settings.lua` both set it), so preserve that when adding mappings.
- `core.utils.map_key()` wraps string RHS values with `vim.api.nvim_exec2`; existing mappings may pass Ex commands without `<cmd>...<cr>`.
- `lua/monorepo/list.lua` only returns packages when Neovim is opened inside a git repo whose root contains `pnpm-workspace.yaml`; the picker is expected to no-op elsewhere.
- Snippets are loaded from `snippets/` via `LuaSnip`; `snippets/ts.lua` is reused for `typescriptreact`, `typescript`, `javascript`, and `astro` through `filetype_extend()`.

## Current Gotcha
- `nvim --headless "+qa"` currently prints `[CodeDiff] 'vscode-diff' is deprecated. Please use 'codediff' instead.`; treat that as an existing warning unless you are intentionally updating that plugin config.
