local gitsigns = require('gitsigns')

gitsigns = gitsigns.setup {
  on_attach = function(bufnr)
    local gs = require('gitsigns')

    vim.keymap.set('n', '<leader>hp', gs.preview_hunk_inline, { buffer = bufnr })
    vim.keymap.set('n', '<leader>hu', gs.reset_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<leader>w', gs.toggle_current_line_blame, { buffer = bufnr })
  end
}
