local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
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

local function factory_bot_choices(index)
  return c(index, {
    t(""),
    sn(nil, { t("create(:"), i(1), t(")") }),
    sn(nil, { t("build(:"), i(1), t(")") }),
  })
end

local function file_name_classified()
  local str = vim.api.nvim_buf_get_name(0)
  str = vim.fs.basename(str)
  local replace = { { "[.]rb", "" }, { "^(.)", string.upper }, { "_(.)", string.upper } }
  for _, repl in ipairs(replace) do
    str = string.gsub(str, repl[1], repl[2])
  end
  return str
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
    s("do",
      fmt(
        [[
        do
           {}
         end
        ]],
        { i(0) }
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
    s("cont",
      fmt(
        [[
        context "{} {}" do
          {}
        end
        ]],
        { c(1, { t("when"), t("with"), t("without") }), i(2), i(0) }
      )
    ),
    s("desc",
      fmt(
        [[
        describe "{}" do
          {}
        end
        ]],
        { i(1), i(0) }
      )
    ),
    s("subj", fmt("subject {{ {} }}", { factory_bot_choices(1) })),
    s("let", fmt("let(:{}) {{ {} }}", { i(1, "symbol"), factory_bot_choices(2) })),
    s("it",
      fmt(
        [[
        it "{}" do
          {}
        end
        ]], { i(1), i(0) }
      )
    ),
    s("iiexp", fmt("it {{ is_expected.to {} }}", { i(0) })),
    s("exp", fmt("expect({}).to {}", { i(1, "object"), i(0) })),
    s("r", fmt("attr_reader :{}", i(0))),
    s("w", fmt("attr_writer :{}", i(0))),
    s("rw", fmt("attr_accessor :{}", i(0))),
    s("cla",
      fmt(
        [[
        class {}
          {}
        end
        ]], { f(file_name_classified), i(0) }
      )
    ),
    s("mod",
      fmt(
        [[
        module {}
          {}
        end
        ]], { f(file_name_classified), i(0) }
      )
    ),
    s("frozen", t({ "# frozen_string_literal: true", "" })),
    s("def",
      fmt(
        [[
        def {}{}
          {}
        end
        ]], {
          i(1, "method"),
          c(2, { { t("("), i(1, "arg"), t(")") }, t("") }),
          i(0)
        }
      )
    )
  }
)

ls.add_snippets("lua",
  {
    s("desc",
      fmt(
        [[
        describe("{}", function()
          {}
        end)
        ]], { i(1), i(0) }
      )
    ),
    s("it",
      fmt(
        [[
        it("{}", function()
          {}
        end)
        ]], { i(1), i(0) }
      )
    )
  }
)
