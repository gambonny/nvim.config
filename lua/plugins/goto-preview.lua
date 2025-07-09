local utils = require("core.utils")

return {
  "rmagatti/goto-preview",
  event = "VeryLazy",
  config = function()
    require("goto-preview").setup({
      width = 140,
      height = 25,
    })

    utils.map_key(
      "n",
      "<leader>gpd",
      "lua require('goto-preview').goto_preview_definition()",
      "Go to preview definition"
    )
    utils.map_key(
      "n",
      "<leader>gpt",
      "lua require('goto-preview').goto_preview_type_definition()",
      "Go to preview type definition"
    )
    utils.map_key(
      "n",
      "<leader>gpi",
      "lua require('goto-preview').goto_preview_implementation()",
      "Go to preview implementation"
    )
    utils.map_key(
      "n",
      "<leader>gpD",
      "lua require('goto-preview').goto_preview_declaration()",
      "Go to preview declaration"
    )
    utils.map_key(
      "n",
      "<leader>gpr",
      "lua require('goto-preview').goto_preview_references()",
      "Go to preview references"
    )
  end,
}
