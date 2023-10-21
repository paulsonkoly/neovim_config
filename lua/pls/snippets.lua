local ls = require("luasnip")

local s = ls.snippet
--local sn = ls.snippet_node
-- local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
--local c = ls.choice_node
--local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require("luasnip.extras").lambda
--local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.conditions")
-- local conds_expand = require("luasnip.extras.conditions.expand")

local function arguments_to_declarations(arg_string)
  local result = {}
  local args = vim.split(arg_string, ",", { trim_empty = true })
  for _, arg in ipairs(args) do
    arg = string.gsub(arg, "[:=].*", "")
    arg = vim.trim(arg)
    table.insert(result, "  @" .. arg .. " = " .. arg)
  end
  return result
end

ls.add_snippets("ruby",
  {
    s("defi",
      fmt(
        [[
        def initialize({})
        {}
          {}
        end
        ]],
        {
          i(1, "args"),
          f(function(args_string)
            return arguments_to_declarations(args_string[1][1])
          end, 1),
          i(0)
        }
      )
    ),
    s("dov",
      fmt(
        [[
        do |{}|
           {}
         end
        ]],
        { i(1, "v"), i(0) }
      )
    ),
    s("iiexp", fmt("it {{ is_expected.to {} }}", { i(0) })),
    s("exp", fmt("expect({}).to {}", { i(1, "object"), i(0) })
    )
  }
)
