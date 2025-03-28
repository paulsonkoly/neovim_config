vim.g.mapleader = "#"

local wk = require("which-key")

wk.add({
  { "<leader>pv", vim.cmd.Ex,              desc = "Ex file browser" },
  { "<C-h>",      "<C-w>h",                desc = "Window left" },
  { "<C-j>",      "<C-w>j",                desc = "Window down" },
  { "<C-k>",      "<C-w>k",                desc = "Window up" },
  { "<C-l>",      "<C-w>l",                desc = "Window right" },

  { "<C-Left>",   "<cmd>tabprev<CR>" },
  { "<C-Right>",  "<cmd>tabnext<CR>" },

  { '<leader>r',  require('pls.reload'),   desc = "Reload pls" },
  { '<leader>x',  '<Plug>PlenaryTestFile', desc = "Plenary test file" },
})

-- For whatever reason these don't work via which-key
vim.keymap.set('c', '<C-a>', "<Home>", { remap = true })
vim.keymap.set('c', '<C-e>', '<End>', { remap = true })
-- wk.add({
--   { "<C-a>", "<Home>", desc = "Move to start of line", mode = "c" },
--   { "<C-e>", "<End>",  desc = "Move to end of line",   mode = "c" }
-- })
