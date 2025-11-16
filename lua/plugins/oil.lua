return {
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    keys = {
      {"-", "<cmd>Oil<CR>", desc= "oil"},
    },
  },
}
