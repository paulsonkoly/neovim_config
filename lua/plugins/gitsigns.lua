return {
  'lewis6991/gitsigns.nvim',
  config = function()
    vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { link = "GitSignsChange" })
  end
}
