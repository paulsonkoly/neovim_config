gitsigns = require('gitsigns').setup {
  on_attach = function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hp', '<cmd>lua require"gitsigns".preview_hunk_inline()<CR>', {})
  end
}
