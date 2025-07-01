local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

return {
  s("ff", {
    t("assign "), i(1, "sig"), t("_en  = "), i(2, "'0"), t(";"),
    t({"", "assign "}), rep(1), t("_nxt = "), i(3, "'0"), t(";"),
    t({"", "always_ff @(posedge clk or negedge reset_n) begin"}),
    t({"", "  if (~reset_n) begin"}),
    t({"", "    "}), rep(1), t("_r <= '0;"),
    t({"", "  end else if ("}), rep(1), t("_en) begin"),
    t({"", "    "}), rep(1), t("_r <= "), rep(1), t("_nxt;"),
    t({"", "  end"}),
    t({"", "end"})
  })
}
