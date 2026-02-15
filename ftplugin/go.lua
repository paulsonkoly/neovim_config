local gen_hook = MiniSplitjoin.gen_hook
local parens = { brackets = { '%b{}', '%b()', '%b[]' } }

local add_comma_parens = gen_hook.add_trailing_separator(parens)
local del_comma_parens = gen_hook.del_trailing_separator(parens)
local pad_parens = gen_hook.pad_brackets(parens)

-- Create buffer-local config
vim.b.minisplitjoin_config = {
  split = { hooks_post = { add_comma_parens } },
  join  = { hooks_post = { del_comma_parens, pad_parens } },
}
