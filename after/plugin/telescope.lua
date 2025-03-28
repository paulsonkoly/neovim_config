local tb = require('telescope.builtin')
local wk = require('which-key')

wk.add({
  { '<leader>f',        tb.find_files, desc = "find files" },
  { '<leader><leader>', tb.live_grep,  desc = "live grep" },
  { '<leader>b',        tb.buffers,    desc = "buffer" },
  { '<F1>',             tb.help_tags,  desc = "help tags" },
})
