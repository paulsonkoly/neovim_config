return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  dependencies = { "nvim-mini/mini.icons" },
  opts = {},
  keys = {
    { '<leader>f',        '<cmd>FzfLua files<cr>',        desc = "files" },
    { '<leader>o',        '<cmd>FzfLua oldfiles<cr>',     desc = "old files" },
    { '<leader><leader>', '<cmd>FzfLua live_grep<cr>',    desc = "live grep" },
    { '<leader>b',        '<cmd>FzfLua buffers<cr>',      desc = "buffers" },
    { '<leader>/',        '<cmd>FzfLua lgrep_curbuf<cr>', desc = "find in buffer" },
    { '<F1>',             '<cmd>FzfLua helptags<cr>',     desc = "help tags" },
  }
}
