local gs = require('gitsigns')

local wk = require('which-key')

gs.setup {
  on_attach = function(bufnr)
    wk.add({
      buffer = bufnr,
      { '<leader>h',  group = "hunk" },
      { '<leader>hp', gs.preview_hunk_inline,       desc = "preview hunk" },
      { '<leader>hu', gs.reset_hunk,                desc = "reset hunk" },
      { '<leader>hs', gs.stage_hunk,                desc = "stage hunk" },
      { '<leader>w',  gs.toggle_current_line_blame, desc = "toggle blame" },
      { '[c',         gs.prev_hunk,                 desc = "previous hunk" },
      { ']c',         gs.next_hunk,                 desc = "next hunk" },
    })
  end
}
