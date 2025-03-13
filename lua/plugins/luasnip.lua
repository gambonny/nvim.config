local utils = require("core.utils")

return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  config = function()
    require("luasnip.loaders.from_lua").load({ paths = "./snippets" })
    local ls = require("luasnip")

    ls.config.set_config({
      enable_autosnippets = true,
      updateevents = "TextChanged,TextChangedI",
    })

    vim.keymap.set({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })

    require("luasnip").filetype_extend("markdown", { "markdown" })
    require("luasnip").filetype_extend("typescriptreact", { "ts" })
    require("luasnip").filetype_extend("typescript", { "ts" })
    require("luasnip").filetype_extend("javascript", { "ts" })

    utils.map_key("i", "<A-u>", function()
      require("luasnip").jump(1)
    end, "Luasnip jump next")
    utils.map_key("n", "<A-u>", function()
      require("luasnip").jump(1)
    end, "Luasnip jump next")
    utils.map_key("i", "<A-p>", function()
      require("luasnip").jump(-1)
    end, "Luasnip jump prev")
    utils.map_key("n", "<A-p>", function()
      require("luasnip").jump(-1)
    end, "Luasnip jump prev")
  end,
}
