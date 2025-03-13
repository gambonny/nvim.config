local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node
local c = ls.choice_node
local postfix = require("luasnip.extras.postfix").postfix

local function getPostfixMatch(_, parent)
  return parent.snippet.env.POSTFIX_MATCH
end

return {
  s({ trig = ",,", snippetType = "autosnippet" }, {
    t("("),
    i(1),
    t(") => {"),
    i(0),
    t("}"),
  }, { hidden = true }),
  s({ trig = ",imp", snippetType = "autosnippet" }, {
    t("import "),
    i(1),
    t(" from '"),
    i(0),
    t("'"),
  }),
  postfix({ trig = ".log", snippetType = "autosnippet" }, {
    t("console.log('"),
    f(getPostfixMatch, {}),
    t(": ', "),
    f(getPostfixMatch, {}),
    t(");"),
  }),
  postfix({ trig = ".var", snippetType = "autosnippet" }, {
    c(1, {
      t("const "),
      t("let "),
    }),
    f(getPostfixMatch, {}),
    t(" = "),
    i(0),
  }),
  s({ trig = ",c,", snippetType = "autosnippet" }, {
    t("const "),
    i(1),
    t(" = "),
    t("("),
    i(2),
    t(")"),
    t(" => {"),
    i(0),
    t("}"),
  }, { hidden = true }),
  s({ trig = ",class", snippetType = "autosnippet" }, {
    t("class={css({"),
    i(1),
    t("})}"),
  }),
  s({ trig = ",name", snippetType = "autosnippet" }, {
    t("className={css({"),
    i(1),
    t("})}"),
  }),
}
