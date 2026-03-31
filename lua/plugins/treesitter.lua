return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "go" },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
