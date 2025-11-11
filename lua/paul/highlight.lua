-- Disable spellcapture highlight from TS
-- In onedark we had an issue where comments and strings got highlighted as
-- spell ( white ) instead of their normal highlight - if TS was enabled. TS
-- for these nodes returned { { @comment, prio = 100} , {@spell, prio = 100} }.
-- In the highlighting the last type won.
vim.api.nvim_set_hl(0, "@spell", {})
