return {
  'christoomey/vim-tmux-navigator',
  config = function()
    vim.keymap.set({ 'n', 'i' }, "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", { desc = "Window left" })
    vim.keymap.set({ 'n', 'i' }, "<C-j>", "<Cmd>TmuxNavigateDown<CR>", { desc = "Window down" })
    vim.keymap.set({ 'n', 'i' }, "<C-k>", "<Cmd>TmuxNavigateUp<CR>", { desc = "Window up" })
    vim.keymap.set({ 'n', 'i' }, "<C-l>", "<Cmd>TmuxNavigateRight<CR>", { desc = "Window right" })
  end
}
