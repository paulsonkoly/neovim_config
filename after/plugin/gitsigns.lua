local gitsigns = require('gitsigns')

gitsigns = gitsigns.setup {
  on_attach = function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hp', '<cmd>lua require"gitsigns".preview_hunk_inline()<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hu', '<cmd>lua require"gitsigns".reset_hunk()<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>w', '<cmd>lua require"gitsigns".toggle_current_line_blame()<CR>', {})
  end
}
