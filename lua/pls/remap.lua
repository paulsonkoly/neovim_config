vim.g.mapleader = "#"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-h>", "<C-w>h", { remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { remap = true })

vim.keymap.set("n", "<C-Left>", "<cmd>tabprev<CR>", { remap = true })
vim.keymap.set("n", "<C-Right>", "<cmd>tabnext<CR>", { remap = true })

vim.keymap.set('n', '<leader>r', require('pls.reload'))
vim.keymap.set('n', '<leader>x', '<Plug>PlenaryTestFile')

vim.keymap.set('c', '<C-a>', "<Home>", { remap = true })
vim.keymap.set('c', '<C-e>', '<End>', { remap = true })
